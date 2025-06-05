import os
import shutil

DEST_ROOT = "organized-sql"

def classify_sql(content):
    content = content.lower()
    if 'create table' in content:
        return 'schema'
    elif 'foreign key' in content or 'alter table' in content:
        return 'migrations'
    elif 'insert into' in content:
        return 'data-load'
    elif 'create function' in content or 'pg_get_functiondef' in content:
        return 'functions'
    elif 'create view' in content:
        return 'views'
    elif 'delete from' in content or 'not in (select' in content:
        return 'cleanup'
    elif 'create index' in content:
        return 'performance'
    elif 'pg_dump' in content or '--schema-only' in content:
        return 'export'
    return 'misc'

def scan_and_move_files(base_path):
    categorized = {}
    moved_files = []
    empty_dirs = []

    for root, dirs, files in os.walk(base_path):
        for filename in files:
            full_path = os.path.join(root, filename)
            if not filename.endswith(('.sql', '.sh')):
                continue
            if full_path.startswith(os.path.join(base_path, DEST_ROOT)):
                continue  # Skip already-organized directory

            try:
                with open(full_path, 'r', encoding='utf-8') as f:
                    content = f.read()
                    category = classify_sql(content)
                    dest_dir = os.path.join(base_path, DEST_ROOT, category)
                    os.makedirs(dest_dir, exist_ok=True)

                    dest_path = os.path.join(dest_dir, filename)
                    shutil.move(full_path, dest_path)
                    categorized.setdefault(category, []).append(dest_path)
                    moved_files.append(full_path)
            except Exception as e:
                print(f"⚠️ Could not read {full_path}: {e}")

    # Look for empty directories AFTER moving
    for root, dirs, _ in os.walk(base_path):
        for d in dirs:
            dir_path = os.path.join(root, d)
            if dir_path.startswith(os.path.join(base_path, DEST_ROOT)):
                continue
            try:
                if not os.listdir(dir_path):
                    empty_dirs.append(dir_path)
            except Exception:
                continue

    return categorized, moved_files, empty_dirs

def generate_report(categorized, output='migration_report.md'):
    with open(output, 'w') as f:
        f.write("# 🧠 SQL/Script Categorization Report\n\n")
        for category, files in categorized.items():
            f.write(f"## {category.upper()} ({len(files)} files)\n")
            for path in files:
                f.write(f"- `{path}`\n")
            f.write("\n")
    print(f"✅ Report generated: {output}")

if __name__ == "__main__":
    base_dir = "."
    print("🚚 Scanning and organizing SQL/scripts...")
    categorized, moved_files, empty_dirs = scan_and_move_files(base_dir)

    print("\n📝 Generating migration report...")
    generate_report(categorized)

    print("\n✅ All files moved into: /organized-sql/\n")
    if empty_dirs:
        print("📦 These directories are now empty and may be safely removed:")
        for d in empty_dirs:
            print(f"- {d}")
    else:
        print("👍 No empty directories found.")
