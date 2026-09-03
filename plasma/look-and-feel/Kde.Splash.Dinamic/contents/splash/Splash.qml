import QtQuick
import org.kde.plasma.plasma5support as Plasma5Support

Image {
    id: root

    property url urlwallpaper: ""
    property string base: "ffffff"
    sourceSize.width: parent.width
    sourceSize.height: parent.height
    fillMode: Image.PreserveAspectCrop
    asynchronous: true

    Plasma5Support.DataSource {

        id: executable
        engine: "executable"
        connectedSources: []
        onNewData: {
            var exitCode = data["exit code"]
            var exitStatus = data["exit status"]
            var stdout = data["stdout"]
            var stderr = data["stderr"]
            exited(exitCode, exitStatus, stdout, stderr)
            disconnectSource(sourceName) // cmd finished
        }
        function exec(cmd) {
            connectSource(cmd)
        }
        signal exited(int exitCode, int exitStatus, string stdout, string stderr)
    }



    Connections {
        target: executable
        onExited: {
            // Limpiamos cualquier espacio en blanco o saltos de línea.
            var output = stdout.trim();

            // Verificamos que el comando se ejecutó correctamente y que la salida contiene una extensión válida
            if (exitCode === 0 && (output.endsWith(".png") || output.endsWith(".jpg") || output.endsWith(".jpeg"))) {
                urlwallpaper = output;
                source = urlwallpaper;
            } else {
                console.error("No se obtuvo una imagen válida o hubo un error en el script:", stderr);
            }
        }
    }

    property int stage

    onStageChanged: {
        if (stage == 1) {
            introAnimation.running = true

        }

    }
    Image {
        id: img1
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.verticalCenter
        anchors.bottomMargin: -50

        source: "images/kde.svgz"
        sourceSize: Qt.size( root.height* 0.15,root.height* 0.15)
    }

    Rectangle {
        radius: 4
        color: "#66" + base
        anchors {
            top: img1.bottom
            topMargin: 48
            horizontalCenter: img1.horizontalCenter
        }
        height: 6
        width: root.width*0.2
        Rectangle {
            radius: 4
            anchors {
                left: parent.left
                top: parent.top
                bottom: parent.bottom
            }
            width: (parent.width / 6) * (stage - 1)
            color: "#" + base
            Behavior on width {
                PropertyAnimation {
                    duration: 250
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }

    SequentialAnimation {
        id: introAnimation
        running: false


        ParallelAnimation {
            loops: Animation.Infinite
            SequentialAnimation{
                PropertyAnimation {
                    property: "scale"
                    target: img1
                    from: 0.9
                    to: 1.1
                    duration: 800
                    easing.type: Easing.InBack
                }

                PropertyAnimation {
                    property: "scale"
                    target: img1
                    from: 1.1
                    to: 0.9
                    duration: 800
                    easing.type:Easing.OutBack
                }

            }
        }
    }
    Component.onCompleted: {
        executable.exec("bash $HOME/.local/share/plasma/look-and-feel/AppleSplash/contents/lib/find.sh")
        //source = "images/background.jpg"
    }
}
