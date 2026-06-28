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
target_sources(type_list PUBLIC FILE_SET CXX_MODULES FILES
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
)
target_include_directories(type_list PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
add_executable(type_list_core_smoke_test "tests/core/smoke_test.cpp")
target_link_libraries(type_list_core_smoke_test PRIVATE type_list)
add_test(NAME type_list_core_smoke_test COMMAND type_list_core_smoke_test)
add_executable(type_list_core_types_test "tests/core/types_test.cpp")
target_link_libraries(type_list_core_types_test PRIVATE type_list)
add_test(NAME type_list_core_types_test COMMAND type_list_core_types_test)
add_executable(type_list_core_type_list_test "tests/core/type_list_test.cpp")
target_link_libraries(type_list_core_type_list_test PRIVATE type_list)
add_test(NAME type_list_core_type_list_test COMMAND type_list_core_type_list_test)
add_executable(type_list_core_empty_test "tests/core/empty_test.cpp")
target_link_libraries(type_list_core_empty_test PRIVATE type_list)
add_test(NAME type_list_core_empty_test COMMAND type_list_core_empty_test)
add_executable(type_list_core_size_test "tests/core/size_test.cpp")
target_link_libraries(type_list_core_size_test PRIVATE type_list)
add_test(NAME type_list_core_size_test COMMAND type_list_core_size_test)
add_executable(type_list_access_front_test "tests/access/front_test.cpp")
target_link_libraries(type_list_access_front_test PRIVATE type_list)
add_test(NAME type_list_access_front_test COMMAND type_list_access_front_test)
add_executable(type_list_access_back_test "tests/access/back_test.cpp")
target_link_libraries(type_list_access_back_test PRIVATE type_list)
add_test(NAME type_list_access_back_test COMMAND type_list_access_back_test)
add_executable(type_list_access_pop_front_test "tests/access/pop_front_test.cpp")
target_link_libraries(type_list_access_pop_front_test PRIVATE type_list)
add_test(NAME type_list_access_pop_front_test COMMAND type_list_access_pop_front_test)
add_executable(type_list_access_pop_back_test "tests/access/pop_back_test.cpp")
target_link_libraries(type_list_access_pop_back_test PRIVATE type_list)
add_test(NAME type_list_access_pop_back_test COMMAND type_list_access_pop_back_test)
add_executable(type_list_access_push_front_test "tests/access/push_front_test.cpp")
target_link_libraries(type_list_access_push_front_test PRIVATE type_list)
add_test(NAME type_list_access_push_front_test COMMAND type_list_access_push_front_test)
add_executable(type_list_access_push_back_test "tests/access/push_back_test.cpp")
target_link_libraries(type_list_access_push_back_test PRIVATE type_list)
add_test(NAME type_list_access_push_back_test COMMAND type_list_access_push_back_test)
add_executable(type_list_build_insert_test "tests/build/insert_test.cpp")
target_link_libraries(type_list_build_insert_test PRIVATE type_list)
add_test(NAME type_list_build_insert_test COMMAND type_list_build_insert_test)
add_executable(type_list_build_concat_test "tests/build/concat_test.cpp")
target_link_libraries(type_list_build_concat_test PRIVATE type_list)
add_test(NAME type_list_build_concat_test COMMAND type_list_build_concat_test)
add_executable(type_list_build_from_pack_test "tests/build/from_pack_test.cpp")
target_link_libraries(type_list_build_from_pack_test PRIVATE type_list)
add_test(NAME type_list_build_from_pack_test COMMAND type_list_build_from_pack_test)
add_executable(type_list_core "examples/core.cpp")
target_link_libraries(type_list_core PRIVATE type_list)
add_executable(type_list_access "examples/access.cpp")
target_link_libraries(type_list_access PRIVATE type_list)
