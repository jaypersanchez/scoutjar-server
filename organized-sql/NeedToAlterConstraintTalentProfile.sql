SELECT conname, pg_get_constraintdef(c.oid) AS constraint_definition
FROM pg_constraint c
WHERE conrelid = 'talent_profiles'::regclass
  AND conname ILIKE '%availability%';

