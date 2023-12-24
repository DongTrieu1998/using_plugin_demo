cmake_minimum_required(VERSION 3.14)

project(myPlugin LANGUAGES CXX)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Quick Core Qml)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Core Quick Core Qml)

# 'myplugin' resource file.
qt5_add_resources(PLUGIN_RESOURCES ${CMAKE_CURRENT_LIST_DIR}/src.qrc)


add_library(
    myPlugin
    SHARED

    myplugin.h
    myplugin.cpp

    mycustomitem.h
    mycustomitem.cpp

    # It's not important to include 'qmldir' or 'plugin.qmltypes' here,
    # but it will make IDEs (such as Qt Creator) to include them in project tree
    qmldir
    plugin.qmltypes

    ${PLUGIN_RESOURCES}     # Plugin resources file

)

target_link_libraries(
    myPlugin
    PRIVATE
        Qt5::Core
        Qt5::Quick
        Qt5::Qml

)

target_compile_definitions(myPlugin PRIVATE MYPLUGIN_LIBRARY)
