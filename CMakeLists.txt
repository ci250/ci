cmake_minimum_required (VERSION 2.6)
project (ci)
add_executable(ci main.cpp)

LIST(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake_modules")
include(CodeCoverage)
APPEND_COVERAGE_COMPILER_FLAGS()
SETUP_TARGET_FOR_COVERAGE_LCOV(NAME coverage
                              EXECUTABLE ci)

add_library(coverage_config INTERFACE)
target_compile_options(coverage_config INTERFACE
  -O0        
  -g         
  --coverage
)
if(CMAKE_VERSION VERSION_GREATER_EQUAL 3.13)
  target_link_options(coverage_config INTERFACE --coverage)
else()
  target_link_libraries(coverage_config INTERFACE --coverage)
endif()

install(TARGETS ${PROJECT_NAME} DESTINATION build)
if(MSVC)
  install(FILES $<TARGET_PDB_FILE:${PROJECT_NAME}> DESTINATION . OPTIONAL)
endif()
