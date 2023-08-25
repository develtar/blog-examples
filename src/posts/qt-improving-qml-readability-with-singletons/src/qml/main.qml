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

import QtQuick 2.12
import QtQuick.Window 2.12

// To correctly load the custom module (qml), the line
// `engine.addImportPath(":/");` must be added in main.cpp
//
import qml 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: App.strings.TR_APPLICATION_TITLE + " - " + App.config.VERSION

    Rectangle {
        anchors.fill: parent
        color: App.colors.pageBackgroundPrimary

        Button {
            textView.text: App.darkTheme? App.strings.TR_BUTTON_LIGHT_THEME : App.strings.TR_BUTTON_DARK_THEME
            width: 264
            height: 65
            anchors.centerIn: parent
            icon.source: App.darkTheme? App.icons.SUN : App.icons.MOON

            onClicked: {
                App.darkTheme = !App.darkTheme
            }
        }
    }
}
