<#
.SYNOPSIS
    Prunes merged local/remote step branches, stale tracking refs, and orphaned worktrees.

.DESCRIPTION
    Run this script after merging a Pull Request or completing a step in BUILD_PROTOCOL.md.
    1. Detects the primary branch (`main` preferred, falls back to `master`).
    2. Runs `git fetch --prune` to clean stale remote tracking refs.
    3. Runs `git worktree prune` to clean orphaned git worktree metadata.
    4. Lists and deletes local branches already merged into the primary branch.
    5. Optionally deletes merged `step/*` branches on `origin` when `-DeleteRemote` is passed.

.PARAMETER DryRun
    Preview branches that would be deleted without deleting them.

.PARAMETER DeleteRemote
    Also delete merged `step/*` branches from `origin`.
#>
param(
    [switch]$DryRun,
    [switch]$DeleteRemote
)

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host ""
Write-Host "Git Branch & Worktree Hygiene" -ForegroundColor Cyan
Write-Host "=============================" -ForegroundColor Cyan
Write-Host ""

# 1. Detect primary branch
$branches = git branch --format="%(refname:short)" 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "  !!  Not a valid git repository." -ForegroundColor Red
    exit 1
}

$primary = if ($branches -contains "main") { "main" } elseif ($branches -contains "master") { "master" } else { "main" }
$current = (git branch --show-current).Trim()

Write-Host "  Primary branch : $primary" -ForegroundColor White
Write-Host "  Current branch : $current" -ForegroundColor White
Write-Host ""

# 2. Fetch and prune stale remote tracking references
Write-Host "Pruning remote tracking references..." -ForegroundColor White
if ($DryRun) {
    git fetch --prune --dry-run
} else {
    git fetch --prune
}
Write-Host "  OK  Remote tracking refs pruned." -ForegroundColor Green
Write-Host ""

# 3. Prune orphaned worktrees
Write-Host "Pruning orphaned git worktrees..." -ForegroundColor White
if ($DryRun) {
    git worktree prune --dry-run -v
} else {
    git worktree prune -v
}
Write-Host "  OK  Worktrees checked." -ForegroundColor Green
Write-Host ""

# 4. Find local branches merged into primary
Write-Host "Checking local branches merged into '$primary'..." -ForegroundColor White
$mergedBranches = git branch --merged $primary --format="%(refname:short)" | Where-Object {
    $_ -ne $primary -and $_ -ne "main" -and $_ -ne "master" -and $_ -ne $current
}

if (-not $mergedBranches -or $mergedBranches.Count -eq 0) {
    Write-Host "  OK  No merged local branches to clean up." -ForegroundColor Green
} else {
    foreach ($b in $mergedBranches) {
        if ($DryRun) {
            Write-Host "  [DryRun] Would delete local branch: $b" -ForegroundColor Yellow
        } else {
            git branch -d $b
            if ($LASTEXITCODE -eq 0) {
                Write-Host "  OK  Deleted local branch: $b" -ForegroundColor Green
            } else {
                Write-Host "  !!  Failed to delete local branch: $b" -ForegroundColor Red
            }
        }

        if ($DeleteRemote -and $b -match "^(step|feat|fix|chore)/") {
            $remoteExists = git ls-remote --heads origin $b
            if ($remoteExists) {
                if ($DryRun) {
                    Write-Host "  [DryRun] Would delete remote branch: origin/$b" -ForegroundColor Yellow
                } else {
                    git push origin --delete $b
                    if ($LASTEXITCODE -eq 0) {
                        Write-Host "  OK  Deleted remote branch: origin/$b" -ForegroundColor Green
                    }
                }
            }
        }
    }
}

Write-Host ""
Write-Host "Done." -ForegroundColor Cyan
Write-Host ""
