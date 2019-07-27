cmake_minimum_required (VERSION 2.6)
project (ci)
add_executable(ci main.cpp)

if(CMAKE_COMPILER_IS_GNUCXX)
LIST(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake_modules")
include(CodeCoverage)
APPEND_COVERAGE_COMPILER_FLAGS()
SETUP_TARGET_FOR_COVERAGE_LCOV(NAME coverage
                              EXECUTABLE ci)
endif()

install(TARGETS ${PROJECT_NAME} DESTINATION build)
if(MSVC)
  install(FILES $<TARGET_PDB_FILE:${PROJECT_NAME}> DESTINATION . OPTIONAL)
endif()
