# frozen_string_literal: true

# Mark existing migrations as safe
StrongMigrations.start_after = 20250120000000

# Customize error messages
StrongMigrations.error_messages[:add_column_default] = 'Adding a column with a default value is safe in Postgres 11+'
StrongMigrations.error_messages[:change_column] = 'Changing a column type is dangerous. A safer approach is to create a new column.'

