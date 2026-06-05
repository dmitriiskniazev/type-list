#!/usr/bin/env bash
# Regenerates compile_commands.json for clangd / IDE (.cppm needs -x c++-module).
set -euo pipefail
root="$(cd "$(dirname "$0")/.." && pwd)"
cd "$root"

write_module_entry() {
  local file="$1"
  cat <<ENTRY
  {
    "directory": "${root}",
    "file": "${file}",
    "arguments": [
      "clang++",
      "-std=c++23",
      "-x",
      "c++-module",
      "-c",
      "${file}"
    ]
  }
ENTRY
}

write_cpp_entry() {
  local file="$1"
  cat <<ENTRY
  {
    "directory": "${root}",
    "file": "${file}",
    "arguments": [
      "clang++",
      "-std=c++23",
      "-c",
      "${file}"
    ]
  }
ENTRY
}

modules=(
  modules/type_list/types.cppm
  modules/type_list/type_list.cppm
  modules/type_list/empty.cppm
  modules/type_list/non_empty.cppm
  modules/type_list/size.cppm
  modules/type_list/front.cppm
  modules/type_list/back.cppm
  modules/type_list/pop_front.cppm
  modules/type_list/pop_back.cppm
  modules/type_list/push_front.cppm
  modules/type_list/push_back.cppm
  modules/type_list/insert.cppm
  modules/type_list/concat.cppm
  modules/type_list/from_pack.cppm
  modules/type_list/map.cppm
  modules/type_list/filter.cppm
  modules/type_list/fold_left.cppm
  modules/type_list/fold_right.cppm
  modules/type_list/zip.cppm
  modules/type_list/zip_with.cppm
  modules/type_list/unzip.cppm
  modules/type_list/reverse.cppm
  modules/type_list/flatten.cppm
  modules/type_list.cppm
)

tests=(
  tests/types_test.cpp
  tests/type_list_test.cpp
  tests/empty_test.cpp
  tests/size_test.cpp
  tests/front_test.cpp
  tests/back_test.cpp
  tests/pop_front_test.cpp
  tests/pop_back_test.cpp
  tests/push_front_test.cpp
  tests/push_back_test.cpp
  tests/insert_test.cpp
  tests/concat_test.cpp
  tests/from_pack_test.cpp
  tests/map_test.cpp
  tests/filter_test.cpp
  tests/fold_left_test.cpp
  tests/fold_right_test.cpp
  tests/zip_test.cpp
  tests/zip_with_test.cpp
  tests/unzip_test.cpp
  tests/reverse_test.cpp
  tests/flatten_test.cpp
)

examples=(
  examples/types_example.cpp
  examples/type_list_example.cpp
  examples/empty_example.cpp
  examples/size_example.cpp
  examples/front_example.cpp
  examples/back_example.cpp
  examples/pop_front_example.cpp
  examples/pop_back_example.cpp
  examples/push_front_example.cpp
  examples/push_back_example.cpp
  examples/insert_example.cpp
  examples/concat_example.cpp
  examples/from_pack_example.cpp
  examples/map_example.cpp
  examples/filter_example.cpp
  examples/fold_left_example.cpp
  examples/fold_right_example.cpp
  examples/zip_example.cpp
  examples/zip_with_example.cpp
  examples/unzip_example.cpp
  examples/reverse_example.cpp
  examples/flatten_example.cpp
)

entries=("${modules[@]}" "${tests[@]}" "${examples[@]}")

{
  echo '['
  for i in "${!entries[@]}"; do
    file="${entries[$i]}"
    if [[ "${file}" == *.cppm ]]; then
      write_module_entry "${file}"
    else
      write_cpp_entry "${file}"
    fi
    [[ $i -lt $((${#entries[@]} - 1)) ]] && echo ','
  done
  echo ']'
} > compile_commands.json

echo "wrote compile_commands.json"
