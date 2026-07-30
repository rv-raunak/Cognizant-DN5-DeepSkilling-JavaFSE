`run.sh` automates branch creation, switching, committing on the branch, a command-line diff, the merge, the graph log, and branch deletion.

The HOL also asks you to view the differences visually with the P4Merge tool. That's a GUI application and isn't scripted here; `run.sh` uses `git diff` instead to show the same information on the command line. If you have P4Merge installed, you can view the same comparison visually with:

```
git difftool -t p4merge master GitNewBranch
```
