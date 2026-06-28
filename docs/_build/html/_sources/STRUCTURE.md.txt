# Структура type-list

Compile-time type lists — domain umbrellas (`type_list.core`, …) с одним partition-модулем на операцию.

## Дерево

```text
type-list/
├── src/
│   ├── type_list.cppm      # umbrella
│   ├── core/               # type_list.core
│   ├── access/             # type_list.access
│   ├── build/              # type_list.build
│   ├── transform/          # type_list.transform
│   └── combine/            # type_list.combine
├── docs/                   # Sphinx
├── tests/
└── examples/
```

## Импорт

```cpp
import std;
import type_list;
```

Домен: `import type_list.transform;`  
Partition: `import type_list.transform:map;`

## Сборка

```bash
cmake -B build -G Ninja && cmake --build build
ctest --test-dir build -R '^type_list_'
./scripts/build-docs.sh
```

Docs: [index.md](index.md) · [ARCHITECTURE.md](ARCHITECTURE.md) · [API.md](API.md) · [IMPLEMENTATION.md](IMPLEMENTATION.md)
