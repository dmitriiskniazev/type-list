# Implementation checklist — type_list

Compile-time type lists — domain umbrellas (`type_list.core`, …) with one partition per operation.

## Where things live

| Role | Path |
|------|------|
| Module sources | [src/](../src/) — `core/`, `access/`, `build/`, `transform/`, `combine/` |
| Umbrella module | [src/type_list.cppm](../src/type_list.cppm) |
| Domain umbrellas | [src/core/core.cppm](../src/core/core.cppm), … |
| Tests | [tests/](../tests/) — `core/`, `access/`, `build/`, `transform/`, `combine/` |
| Examples | [examples/](../examples/) — `core`, `access`, `transform`, `combine` |
| Lecture | [type-list](https://github.com/dmitriiskniazev/type-list) (submodule) |
| CMake | [CMakeLists.txt](../CMakeLists.txt) |

---

## Import

```cpp
import std;
import type_list;                    // full API
import type_list.transform;          // one domain
import type_list.transform:map;      // one partition
```

---

## Partition checklist

When adding `<op>` in domain `<domain>`:

| Step | Action |
|------|--------|
| 1 | [ ] `src/<domain>/<op>.cppm` — see [ARCHITECTURE.md](ARCHITECTURE.md) |
| 2 | [ ] `export import :<op>;` in `src/<domain>/<domain>.cppm` |
| 3 | [ ] Register in [CMakeLists.txt](../CMakeLists.txt) (`target_sources` + test list) |
| 4 | [ ] `tests/<domain>/<op>_test.cpp` |
| 5 | [ ] Update [API.md](API.md) |

**Domains:** `core` · `access` · `build` · `transform` · `combine`

---

## Coverage by domain

| Domain | Partitions | Test target prefix |
|--------|------------|-------------------|
| `core` | `types`, `type_list`, `empty`, `non_empty`, `size` | `type_list_core_*_test` |
| `access` | `front`, `back`, `pop_*`, `push_*` | `type_list_access_*_test` |
| `build` | `insert`, `concat`, `from_pack` | `type_list_build_*_test` |
| `transform` | `map`, `filter`, `fold_*` | `type_list_transform_*_test` |
| `combine` | `zip`, `zip_with`, `unzip`, `reverse`, `flatten` | `type_list_combine_*_test` |

`non_empty` is validated in `type_list_core_type_list_test` (no dedicated test file).

---

## Verify

From meta-repo root:

```bash
./scripts/ci.sh
ctest --test-dir build -R '^type_list_'
```

Example binaries: `type_list_core`, `type_list_access`, `type_list_transform`, `type_list_combine`.
