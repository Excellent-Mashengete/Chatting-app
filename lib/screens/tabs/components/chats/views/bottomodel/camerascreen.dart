import 'dart:math';
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:chattingapp/common/common.dart';
import 'package:chattingapp/screens/tabs/tabs.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

List<CameraDescription> cameras = [];

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController cameracontroller;
  Future<void>? cameraValue;
  bool isRecording = false;
  bool flash = false;
  bool iscamerafront = true;
  double transform = 0;
  Timer? _timer;
  int _elapsedSeconds = 0;

  @override
  void initState() {
    super.initState();
    cameracontroller = CameraController(cameras[0], ResolutionPreset.high);
    cameraValue = cameracontroller.initialize();
  }

  @override
  void dispose() {
    cameracontroller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        ),
      ),
      body: Stack(
        children: [
          FutureBuilder(
              future: cameraValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // return CameraPreview(cameracontroller);
                  final screenAspectRatio =
                      MediaQuery.of(context).size.aspectRatio;
                  final cameraAspectRatio = cameracontroller.value.aspectRatio;
                  final aspectRatio = cameraAspectRatio / screenAspectRatio;

                  return SafeArea(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.height * aspectRatio,
                      height: MediaQuery.of(context).size.width * aspectRatio,
                      child: CameraPreview(cameracontroller),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
          Positioned(
            top: 5,
            right: 10,
            child: Text(_elapsedSeconds.toString(),
              style: const TextStyle(
                color: ThemeConstants.light1Color,
                fontSize: 25
              ),
            ),
          ),

          Positioned(
            bottom: 0.0,
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      IconButton(
                        icon: Icon(flash ? Icons.flash_on : Icons.flash_off,
                            color: ThemeConstants.light1Color, size: 28),
                        onPressed: () {
                          setState(() {
                            flash = !flash;
                          });
                          flash
                              ? cameracontroller.setFlashMode(FlashMode.torch)
                              : cameracontroller.setFlashMode(FlashMode.off);
                        },
                      ),
                      GestureDetector(
                        onLongPress: () async {
                          await cameracontroller.startVideoRecording();
                          _elapsedSeconds = 0;
                          _timer = Timer.periodic(const Duration(seconds: 1),
                              (timer) {
                            setState(() {
                              _elapsedSeconds++;
                            });
                          });
                          setState(() {
                            isRecording = true;
                          });
                        },
                        onLongPressUp: () async {
                          XFile videopath =
                              await cameracontroller.stopVideoRecording();
                          setState(() {
                            isRecording = false;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builder) => VideoViewPage(
                                path: videopath.path,
                              ),
                            ),
                          );
                        },
                        onTap: () {
                          if (!isRecording) takePhoto(context);
                        },
                        child: isRecording
                            ? const Icon(
                                Icons.radio_button_on,
                                color: Colors.red,
                                size: 80,
                              )
                            : const Icon(
                                Icons.panorama_fish_eye,
                                color: ThemeConstants.light1Color,
                                size: 70,
                              ),
                      ),
                      IconButton(
                        icon: Transform.rotate(
                          angle: transform,
                          child: const Icon(Icons.flip_camera_ios,
                              color: ThemeConstants.light1Color, size: 28),
                        ),
                        onPressed: () {
                          setState(() {
                            iscamerafront = !iscamerafront;
                            transform = transform + pi;
                          });
                          int cameraPos = iscamerafront ? 0 : 1;
                          cameracontroller = CameraController(
                              cameras[cameraPos], ResolutionPreset.high);
                          cameraValue = cameracontroller.initialize();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    "Hold for video, tap for photo",
                    style: TextStyle(color: ThemeConstants.light1Color),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void takePhoto(context) async {
    XFile file = await cameracontroller.takePicture();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (builder) => CameraView(path: file.path),
      ),
    );
  }
}
