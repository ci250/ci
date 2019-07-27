cmake_minimum_required (VERSION 2.6)
project (ci)
add_executable(ci main.cpp)

install(TARGETS ${PROJECT_NAME} DESTINATION .
  if(MSVC)
    install(FILES $<TARGET_PDB_FILE:${PROJECT_NAME}> DESTINATION . OPTIONAL)
  endif()
    install(FILES DESTINATION . OPTIONAL)
)
