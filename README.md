# graph-wrapper

A wrapper around the standard Data.Graph with a less awkward interface.

## changelog

- `[next release]`

  - `depthNumbering` ignores given root indexes that don't exist (instead of
    throwing an exception).

- `0.2.5` (changes to `0.2.4.4`)

  - `reachableVertices` returns an empty list given a vertex that doesn't exist
    (instead of throwing an exception).
