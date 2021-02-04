cmake_minimum_required(VERSION 3.12)
project(tinyspline)

# Turn on folders
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

option(TINYSPLINE_BUILD_EXAMPLES "Build TinySpline examples." OFF)
option(TINYSPLINE_BUILD_TESTS "Build TinySpline tests." OFF)
option(TINYSPLINE_BUILD_DOCS "Build TinySpline documentation." OFF)

set(MODULE_NAME tinyspline)
set(TINYSPLINE_SOURCE_DIR ${CMAKE_SOURCE_DIR})

if(NOT DEFINED TINYSPLINE_OUTPUT_DIRECTORY)
	set(TINYSPLINE_OUTPUT_DIRECTORY
		${CMAKE_CURRENT_BINARY_DIR}/lib CACHE INTERNAL "")
endif()

set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${TINYSPLINE_OUTPUT_DIRECTORY})

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/${MODULE_NAME}.config.h.in
  ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}/${MODULE_NAME}.config.h @ONLY)

add_subdirectory(src)
if(TINYSPLINE_BUILD_EXAMPLES)
	add_subdirectory(examples)
endif()
if(TINYSPLINE_BUILD_TESTS)
	enable_testing()
	add_subdirectory(test)
endif()
if(TINYSPLINE_BUILD_DOCS)
	add_subdirectory(docs)
endif()
