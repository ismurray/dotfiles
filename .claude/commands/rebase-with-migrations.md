# Rebase with Migration Conflict Resolution

Safely rebase a feature branch with database migrations against the latest main branch.

## Prerequisites

1. **Verify State**
   - Confirm current branch: `git branch --show-current`
   - Check for uncommitted changes: `git status --porcelain`
   - If uncommitted changes exist, stash them first

2. **Create Backup**
   - `git branch backup-$(git branch --show-current)-$(date +%Y%m%d-%H%M%S)`
   - This is **mandatory** for safety

## Rebase Process

3. **Update Main**
   - `git checkout main`
   - `git pull origin main`
   - If conflicts occur, **STOP** and consult user

4. **Start Rebase**
   - `git checkout -` (return to feature branch)
   - `git rebase main`

5. **Handle Migration Conflicts**
   - If conflicts in `db/schema.rb` or migration files:
     - Run `bin/rails db:migrate` to resolve schema conflicts

6. **Stage and Continue**
   - `git add db/schema.rb db/migrate/`
   - Check for other db files: `git status | grep -E "db/"`
   - Continue rebase: `git -c core.editor=true rebase --continue`
   - Repeat until complete

## Post-Rebase (CRITICAL)

7. **Check Pending Migrations**
   - `bin/rails db:migrate:status | grep down`
   - If pending migrations exist, run them: `bin/rails db:migrate`
   - **Commit schema changes** if any files were modified

8. **Force Push**
   - Use `git push --force-with-lease` (NEVER `--force`)
   - If rejected, someone else may have pushed to the branch

9. **Verify**
   - Check PR shows no conflicts
   - Verify migration status: `bin/rails db:migrate:status | grep down` (should return nothing)

## Abort Procedures

- Abort rebase: `git rebase --abort`
- Return to backup: `git checkout backup-[branch]-[timestamp]`
- Emergency reset: `git reset --hard origin/[branch]`

## Critical Warnings

- **NEVER stage**: `./zscripts/`, `./TRD/`, `./development_notes/`
- **ALWAYS** create backup branch before starting
- **NEVER** use `git push --force` (use `--force-with-lease`)
- **ALWAYS** check for pending migrations after rebase
- Pending migrations cause `ActiveRecord::PendingMigrationError` in CI/CD

$ARGUMENTS
