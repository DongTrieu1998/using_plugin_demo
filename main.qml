import QtQuick 2.15
import QtQuick.Window 2.15
import myPlugin 1.0

Window {
	width: 640
	height: 480
	visible: true
	title: qsTr("Hello World")


	MyItem {
		id: m_myItem
	}

	Rectangle {
		width: m_myItem.width
		height: m_myItem.height

		anchors.centerIn: parent
		color: "red"
	}
}
