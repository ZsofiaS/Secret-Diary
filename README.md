### Secret Diary

Task: Test-drive the secret diary example

SecretDiary
  - lock
  - unlock
  - add_entry
  - get_entries
 
Initially the `SecretDiary` class is locked, meaning `add_entry` and `get_entries` should throw an error.
When the user calls `unlock`, `add_entry` and `get_entries` should work as desired.
When the user calls `lock` again they throw errors again.