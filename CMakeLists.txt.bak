cmake_minimum_required(VERSION 2.8.12)

project(qt_c LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

find_package(Qt5 COMPONENTS Core Widgets Quick Concurrent SerialPort REQUIRED)

include_directories(my_src my_src/adapter)
include(cmake/taoQuick.cmake)

set(SOURCES
    my_src/main.cpp
	)

set(ADAPTER
    my_src/adapter/configadapter.h
    my_src/adapter/configadapter.cpp
	)

add_executable(
    ${PROJECT_NAME}
    ${SOURCES}
	${ADAPTER}
    my_src/qml/qml.qrc)

target_link_libraries(${PROJECT_NAME}
    Qt5::Core
    Qt5::Widgets
    Qt5::Concurrent
    Qt5::SerialPort
    Qt5::Quick)