`run.sh` reproduces the full conflict scenario: it creates diverging `hello.xml` content on `master` and on the `GitWork` branch, merges them (which genuinely conflicts), and then resolves the conflict by writing a combined version of the file and committing it.

The HOL suggests using the P4Merge tool for a visual 3-way merge. That's a GUI application and isn't scripted here; the resolution in `run.sh` is done by directly writing the resolved file content. If you have P4Merge installed and want to resolve it interactively instead, run the merge step yourself and use:

```
git mergetool -t p4merge
```
