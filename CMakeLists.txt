if(CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
    cmake_minimum_required(VERSION 3.28)
    include(cmake/CppModules.cmake)
    cpp_detect_toolchain()
    project(type_list LANGUAGES CXX)
    set(CMAKE_CXX_STANDARD 23)
    set(CMAKE_CXX_STANDARD_REQUIRED ON)
    set(CMAKE_CXX_EXTENSIONS OFF)
    set(CMAKE_CXX_MODULE_STD ON)
    set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
    cpp_apply_linux_rpath()
    cpp_require_ninja_or_vs()
    include(CTest)
    enable_testing()
endif()

add_library(type_list)
target_sources(type_list
    PUBLIC
        FILE_SET CXX_MODULES FILES
            src/type_list.cppm
            src/core/core.cppm
            src/core/types.cppm
            src/core/type_list.cppm
            src/core/empty.cppm
            src/core/non_empty.cppm
            src/core/size.cppm
            src/access/access.cppm
            src/access/front.cppm
            src/access/back.cppm
            src/access/pop_front.cppm
            src/access/pop_back.cppm
            src/access/push_front.cppm
            src/access/push_back.cppm
            src/build/build.cppm
            src/build/insert.cppm
            src/build/concat.cppm
            src/build/from_pack.cppm
            src/transform/transform.cppm
            src/transform/map.cppm
            src/transform/filter.cppm
            src/transform/fold_left.cppm
            src/transform/fold_right.cppm
            src/combine/combine.cppm
            src/combine/zip.cppm
            src/combine/zip_with.cppm
            src/combine/unzip.cppm
            src/combine/reverse.cppm
            src/combine/flatten.cppm
)
target_include_directories(type_list PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

set(TYPE_LIST_CORE_TESTS
    core/smoke_test
    core/types_test
    core/type_list_test
    core/empty_test
    core/size_test
)

foreach(rel_path IN LISTS TYPE_LIST_CORE_TESTS)
    string(REPLACE "/" "_" stem "${rel_path}")
    set(target "type_list_${stem}")
    add_executable(${target} "tests/${rel_path}.cpp")
    target_link_libraries(${target} PRIVATE type_list)
    add_test(NAME ${target} COMMAND ${target})
endforeach()

set(TYPE_LIST_ACCESS_TESTS
    access/front_test
    access/back_test
    access/pop_front_test
    access/pop_back_test
    access/push_front_test
    access/push_back_test
)

foreach(rel_path IN LISTS TYPE_LIST_ACCESS_TESTS)
    string(REPLACE "/" "_" stem "${rel_path}")
    set(target "type_list_${stem}")
    add_executable(${target} "tests/${rel_path}.cpp")
    target_link_libraries(${target} PRIVATE type_list)
    add_test(NAME ${target} COMMAND ${target})
endforeach()

set(TYPE_LIST_BUILD_TESTS
    build/insert_test
    build/concat_test
    build/from_pack_test
)

foreach(rel_path IN LISTS TYPE_LIST_BUILD_TESTS)
    string(REPLACE "/" "_" stem "${rel_path}")
    set(target "type_list_${stem}")
    add_executable(${target} "tests/${rel_path}.cpp")
    target_link_libraries(${target} PRIVATE type_list)
    add_test(NAME ${target} COMMAND ${target})
endforeach()

set(TYPE_LIST_TRANSFORM_TESTS
    transform/map_test
    transform/filter_test
    transform/fold_left_test
    transform/fold_right_test
)

foreach(rel_path IN LISTS TYPE_LIST_TRANSFORM_TESTS)
    string(REPLACE "/" "_" stem "${rel_path}")
    set(target "type_list_${stem}")
    add_executable(${target} "tests/${rel_path}.cpp")
    target_link_libraries(${target} PRIVATE type_list)
    add_test(NAME ${target} COMMAND ${target})
endforeach()

set(TYPE_LIST_COMBINE_TESTS
    combine/zip_test
    combine/zip_with_test
    combine/unzip_test
    combine/reverse_test
    combine/flatten_test
)

foreach(rel_path IN LISTS TYPE_LIST_COMBINE_TESTS)
    string(REPLACE "/" "_" stem "${rel_path}")
    set(target "type_list_${stem}")
    add_executable(${target} "tests/${rel_path}.cpp")
    target_link_libraries(${target} PRIVATE type_list)
    add_test(NAME ${target} COMMAND ${target})
endforeach()

set(TYPE_LIST_EXAMPLES
    core
    access
    transform
    combine
)

foreach(rel_path IN LISTS TYPE_LIST_EXAMPLES)
    set(target "type_list_${rel_path}")
    add_executable(${target} "examples/${rel_path}.cpp")
    target_link_libraries(${target} PRIVATE type_list)
endforeach()
