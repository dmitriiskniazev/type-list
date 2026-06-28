# type-list

Compile-time type lists for C++23 modules (`nil` / `cons`) — metaprogramming reference.

| Topic | Docs |
|-------|------|
| **Site** | [dmitriiskniazev.github.io/type-list](https://dmitriiskniazev.github.io/type-list/) |
| API | [docs/API.md](docs/API.md) |
| Architecture | [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) |
| Checklist | [docs/IMPLEMENTATION.md](docs/IMPLEMENTATION.md) |

## Import

```cpp
import std;
import type_list;
```

Domain: `import type_list.transform;` · partition: `import type_list.transform:map;`

## Layout

```text
type-list/
├── src/           # type_list.* modules
├── docs/          # Sphinx design documentation
├── tests/
├── examples/
└── cmake/
```

## Build

Requires Clang 19+ with `import std` (Homebrew LLVM).

```bash
cmake -B build -G Ninja
cmake --build build
ctest --test-dir build -R '^type_list_'
./scripts/build-docs.sh
```

## License

MIT — see [LICENSE](LICENSE).
