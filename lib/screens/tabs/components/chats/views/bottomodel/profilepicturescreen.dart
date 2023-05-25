import 'dart:math';
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:chattingapp/common/common.dart';
import 'package:chattingapp/screens/tabs/tabs.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

List<CameraDescription> cameras2 = [];

class PicturePictureScreen extends StatefulWidget {
  const PicturePictureScreen({Key? key}) : super(key: key);

  @override
  State<PicturePictureScreen> createState() => _PicturePictureScreenState();
}

class _PicturePictureScreenState extends State<PicturePictureScreen> {
  late CameraController cameracontroller;
  Future<void>? cameraValue;
  bool flash = false;
  bool iscamerafront = true;
  double transform = 0;

  @override
  void initState() {
    super.initState();
    cameracontroller = CameraController(cameras2[0], ResolutionPreset.high);
    cameraValue = cameracontroller.initialize();
    checkPermissionsAndNavigateBack();
  }

  @override
  void dispose() {
    cameracontroller.dispose();
    super.dispose();
  }

  Future<void> checkPermissionsAndNavigateBack() async {
    PermissionStatus cameraPermissionStatus = await Permission.camera.status;
    PermissionStatus microphonePermissionStatus =
        await Permission.microphone.status;

    if (cameraPermissionStatus.isDenied ||
        microphonePermissionStatus.isDenied) {
          Navigator.pop(context);
    } else if (cameraPermissionStatus.isPermanentlyDenied ||
        microphonePermissionStatus.isPermanentlyDenied) {
      _showSettingsDialog();
    } else {
      // Permissions are granted, continue with your logic
    }
  }

  // Future<void> _requestPermissions() async {
  //   Map<Permission, PermissionStatus> permissionStatus =
  //       await [Permission.camera, Permission.microphone].request();

  //   if (permissionStatus[Permission.camera].isDenied ||
  //       permissionStatus[Permission.microphone].isDenied) {
  //     Navigator.pop(context);
  //   } else {
  //     checkPermissionsAndNavigateBack();
  //   }
  // }


  void _showSettingsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Permissions Required'),
        content: const Text(
          'Please grant camera and microphone permissions in Settings'
        ),
        actions: [
          TextButton(
            child: const Text('CANCEL'),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: const Text('SETTINGS'),
            onPressed: () => openAppSettings(),
          ),
        ],
      ),
    );
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
            },
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
                      Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: iscamerafront
                              ? IconButton(
                                  icon: Icon(
                                      flash ? Icons.flash_on : Icons.flash_off,
                                      color: ThemeConstants.light1Color,
                                      size: 28),
                                  onPressed: () {
                                    setState(() {
                                      flash = !flash;
                                    });
                                    flash
                                        ? cameracontroller
                                            .setFlashMode(FlashMode.torch)
                                        : cameracontroller
                                            .setFlashMode(FlashMode.off);
                                  },
                                )
                              : Container(
                                  padding: const EdgeInsets.all(50),
                                )),
                      InkWell(
                        onTap: () {
                          takePhoto(context);
                        },
                        child: const Icon(
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
                              cameras2[cameraPos], ResolutionPreset.high);
                          cameraValue = cameracontroller.initialize();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    "PHOTO",
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
        builder: (builder) => PicturePictureView(path: file.path),
      ),
    );
  }
}
