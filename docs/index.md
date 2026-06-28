# type-list documentation

Compile-time type lists (`nil` / `cons`) — metaprogramming reference.

```{toctree}
:maxdepth: 2

STRUCTURE
ARCHITECTURE
API
IMPLEMENTATION
```

## Build HTML

```bash
./scripts/build-docs.sh
# → docs/_build/html/
```

## Code

```bash
cmake -B build -G Ninja && cmake --build build
ctest --test-dir build -R '^type_list_'
```
