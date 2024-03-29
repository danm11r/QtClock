// DM Feb 2024

import QtQuick 2.15
import QtQuick.Shapes 1.15

Item {

    width: clockRadius*2
    height: clockRadius*2

    // border
    Repeater {

        model: 60

        Rectangle {
            x: clockRadius - arcWidth/2
            y: 0
            width: arcWidth
            height: arcWidth
            radius: 180
            color: "#B4B4B4"
            transform: Rotation { origin.x: arcWidth/2; origin.y: clockRadius; angle: index*6 } 
        }
    }

    // hour marks
    Repeater {

        model: 12

        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            width: arcWidth
            height: arcWidth*2
            radius: 180
            color: "white"
            transform: Rotation { origin.x: arcWidth/2; origin.y: clockRadius; angle: index*30 } 
        }
    }

    // hour text
    Repeater {

        model: 12

        Item {
            x: clockRadius + Math.round(440*Math.cos((index*30-60)* Math.PI / 180))
            y: clockRadius + Math.round(440*Math.sin((index*30-60)* Math.PI / 180))
            
            Text {
                anchors.centerIn: parent
                text: index+1
                font.pixelSize: 100
                color: "white"
            }
        }
    }

    // minute hand
    Rectangle {
        x: clockRadius-arcWidth/4
        y: clockRadius-arcWidth/4
        width: arcWidth/2
        height: 100
        radius: 180
        color: color1

        transform: Rotation { origin.x: arcWidth/4; origin.y: arcWidth/4; angle: hms.min*6 + 180 } 
    }

    Rectangle {
        x: clockRadius-arcWidth
        y: clockRadius-arcWidth + 100
        width: arcWidth*2
        height: clockRadius-120
        radius: 180
        color: color1

        transform: Rotation { origin.x: arcWidth; origin.y: arcWidth-100; angle: hms.min*6 + 180 } 
    }

    // hour hand
    Rectangle {
        x: clockRadius-arcWidth
        y: clockRadius-arcWidth + 100
        width: arcWidth*2
        height: clockRadius-330
        radius: 180
        color: color2

        transform: Rotation { origin.x: arcWidth; origin.y: arcWidth-100; angle: hms.hour*30 + 180 } 
    }

    Rectangle {
        x: clockRadius-arcWidth/4
        y: clockRadius-arcWidth/4
        width: arcWidth/2
        height: 100
        radius: 180
        color: color2

        transform: Rotation { origin.x: arcWidth/4; origin.y: arcWidth/4; angle: hms.hour*30 + 180 } 
    }

    // second hand
    Rectangle {
        x: clockRadius-arcWidth/4
        y: clockRadius-arcWidth/4
        width: arcWidth/2
        height: clockRadius
        radius: 180
        color: accent

        transform: Rotation { origin.x: arcWidth/4; origin.y: arcWidth/4; angle: hms.sec*6 + 180 } 
    }

    Shape {
        ShapePath {
            fillColor: accent
            strokeColor: accent   
            strokeWidth: arcWidth
            capStyle: ShapePath.RoundCap

            PathAngleArc {
                centerX: clockRadius; centerY: clockRadius
                radiusX: 4; radiusY: 4;
                startAngle: 0
                sweepAngle: 360
            }
        } 
    }
}