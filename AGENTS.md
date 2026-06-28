# Agent guide — type-list

**Docs:** [docs/API.md](docs/API.md) · [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) · [docs/IMPLEMENTATION.md](docs/IMPLEMENTATION.md)

Modules: `type_list.*` — compile-time lists (`nil` / `cons`).

## Verify

```bash
cmake -B build -G Ninja && cmake --build build
ctest --test-dir build -R '^type_list_'
./scripts/build-docs.sh
```

## Adding a partition

See [docs/IMPLEMENTATION.md](docs/IMPLEMENTATION.md).

Cross-domain imports use domain umbrellas (`import type_list.core;`).

## Pitfalls

- No `#include` — `import std;` and `import type_list;`
- Filter functors need `.value`; map uses unary class template
- Apple Clang is not supported — Homebrew LLVM only
