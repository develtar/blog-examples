import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtGraphicalEffects 1.0
import qml 1.0

Rectangle {
    id: root

    signal clicked()

    property alias textView: textView

    property alias icon: image
    property alias mouseArea: mouseArea
    property int padding: 12


    implicitHeight: 65
    implicitWidth: 256
    color: App.colors.buttonBackgroundPrimary
    radius: 12

    RowLayout {
        anchors.fill: parent

        Text {
            id: textView
            visible: text!==""
            verticalAlignment: Text.AlignVCenter
            font.capitalization: Font.AllUppercase
            font.pixelSize: 18
            fontSizeMode: Text.Fit
            font.bold: true
            clip: true
            minimumPixelSize: 10
            wrapMode: Text.WordWrap
            color: App.colors.buttonTextPrimary

            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.leftMargin: 24
            Layout.rightMargin: 24
            Layout.topMargin: 4
            Layout.bottomMargin: 4
        }

        Item {
            Layout.preferredHeight: parent.height-24
            Layout.preferredWidth: parent.height-24
            Layout.alignment: Qt.AlignHCenter
            Layout.rightMargin: 12
            visible: image.source!==""

            Image {
                id: image
                anchors.centerIn: parent
                width: parent.width
                height: parent.height

                onWidthChanged: sourceSize.width = width
                onHeightChanged: sourceSize.height = height
                fillMode: Image.PreserveAspectFit
            }

            ColorOverlay {
                id: colorOverlay
                anchors.fill: image
                source: image
                cached: false
                opacity: image.opacity
                color: textView.color
            }
        }
    }

    MouseArea {
        id: mouseArea

        hoverEnabled: true
        anchors.fill: parent

        onClicked: root.clicked()
    }
}
