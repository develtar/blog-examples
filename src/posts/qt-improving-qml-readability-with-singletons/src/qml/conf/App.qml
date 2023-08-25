/*
 *
 *  Copyright 2023 Leonardo Tarollo (LTDev) <develtar@gmail.com>
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 *
 */

pragma Singleton

import QtQuick 2.0

import "../javascript/strings.js" as ApplicationStrings
import "../javascript/config.js" as ApplicationConfig
import "../javascript/icons.js" as ApplicationIcons

Item {
    // Expose javascript resources via this wrapper.
    // This will avoid to have multiple imports and instances where
    // those js files are needed.
    //
    // @note: importing a js pragma library in qml
    // will create a shared instance of that file
    //
    readonly property var config: ApplicationConfig
    readonly property var strings: ApplicationStrings
    readonly property var icons: ApplicationIcons

    // A flag to know which theme is currently used
    //
    // @note: usually, to persistently store configuration
    // data is used the Setting class, however, for the purpose
    // of this sample, we'll use a simple flag (doing so, the theme
    // flag will be reset at the app start)
    property bool darkTheme: true

    // A property which stores the current theme configuration
    readonly property Theme colors: darkTheme? _internal.themeDark : _internal.themeLight


    QtObject {
        id: _internal

        // Dark theme configuration
        property Theme themeDark: Theme {
            pageBackgroundPrimary: "#414141"
            backgroundPrimary: "#313131"
            textPrimary: "#f1f1f1"

            buttonBackgroundPrimary: "#313131"
            buttonTextPrimary: "#f1f1f1"
        }

        // Light theme configuration
        property Theme themeLight: Theme {
            pageBackgroundPrimary: "#EAEAEA"
            backgroundPrimary: "#C8C8C8"
            textPrimary: "#414141"

            buttonBackgroundPrimary: "#D9D9D9"
            buttonTextPrimary: "#414141"
        }
    }
}
