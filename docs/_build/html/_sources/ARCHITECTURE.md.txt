# type_list architecture

> **Layout:** `src/<domain>/` — one tree per category (like `stdx.memory/`); each operation is its own partition module.  
> **Std dependency:** `import std;` in every partition.

## Module map

```
type_list                         # import type_list;
├── type_list.core                # nil, cons, concepts, size
├── type_list.access              # front, back, push_*, pop_*
├── type_list.build               # insert, concat, from_pack
├── type_list.transform           # map, filter, fold_*
└── type_list.combine              # zip, zip_with, unzip, reverse, flatten
```

**Import:** `import type_list;` (default) · `import type_list.transform;` (domain) · `import type_list.transform:map;` (partition)

Partitions use colons: `export module type_list.transform:map;`

## Source tree

```
src/
  type_list.cppm              # export import every domain
  core/
    core.cppm                 # type_list.core umbrella
    types.cppm
    type_list.cppm            # concept only (meta-partition)
    empty.cppm
    non_empty.cppm
    size.cppm
  access/
    access.cppm
    front.cppm
    …
  build/
    build.cppm
    insert.cppm
    …
  transform/
    transform.cppm
    map.cppm
    …
  combine/
    combine.cppm
    zip.cppm
    …
tests/
  core/ access/ build/ transform/ combine/
examples/
  core.cpp access.cpp transform.cpp combine.cpp
```

## Partition pattern

Every operation is a single self-contained module file — no interface/impl split (unlike stdx runtime types).

```
<domain>/<op>.cppm
  export module type_list.<domain>:<op>;
  import std;
  import type_list.core;             # cross-domain (domain umbrella)
  import :other;                      # same-domain partition only

  namespace type_list {
    template <…> struct <op>;           # recursive metafunction
    template <…> struct <op><…> : std::type_identity<Result> {};

    export {
      template <…> using <op>_t = …;    # public alias
      template <…> inline constexpr … _v = …;  # when applicable
    }
  }
```

**Result type:** inherit `std::type_identity<Result>` on the algorithm struct; expose `*_t` / `*_v` in `export { … }`.

**Functors:** template-template parameters (`map_t<Unary, List>`), filter predicates via `Predicate<T>::value`, fold/zip_with via nested `type` on a class template.

## Namespace

All public symbols live in `namespace type_list`.

## Tests and examples

| Artifact | Pattern |
|----------|---------|
| Smoke | `tests/core/smoke_test.cpp` → `type_list_core_smoke_test` |
| Partition test | `tests/<category>/<op>_test.cpp` → `type_list_<category>_<op>_test` |
| Overview example | `examples/<topic>.cpp` → `type_list_<topic>` |

Marker types in tests: PascalCase ordinals (`Fst`, `Snd`); functors: `Boxed`, `MakePair`.

Checklist: [IMPLEMENTATION.md](IMPLEMENTATION.md).

## Adding a partition

1. Add `src/<domain>/<op>.cppm` following the pattern above.
2. `export import :<op>;` in `src/<domain>/<domain>.cppm`.
3. Register in `CMakeLists.txt` (`target_sources`, category test list).
4. Update [API.md](API.md) and [IMPLEMENTATION.md](IMPLEMENTATION.md).
5. From meta-repo root: `./scripts/ci.sh`.
