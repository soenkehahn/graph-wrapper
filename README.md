**Note: I (@soenkehahn) don't actively use or maintain this project anymore. If you have an interest in taking on maintainership, let me know!**

# graph-wrapper

A wrapper around the standard Data.Graph with a less awkward interface.

## changelog

- `0.2.6`

  - Added `Eq` instance for `Graph`. (Thanks, @gelisam.)

- `0.2.5` (changes to `0.2.4.4`)

  - `reachableVertices` returns an empty list given a vertex that doesn't exist
    (instead of throwing an exception).
