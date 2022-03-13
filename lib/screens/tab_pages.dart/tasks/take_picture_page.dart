
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TakePicturePage extends StatefulWidget {
  final CameraDescription camera;

  const TakePicturePage({Key key, this.camera}) : super(key: key);

  @override
  State<TakePicturePage> createState() => _TakePicturePageState();
}

class _TakePicturePageState extends State<TakePicturePage> {
  CameraController _cameraController;
  Future<void> _initializeCameraControllerFuture;

  /// --- Life Cycles ---

  @override
  void initState() {
    super.initState();

    _cameraController = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );

    _initializeCameraControllerFuture = _cameraController.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _cameraController.dispose();
  }

  /// --- Methods ---

  void takePicture() async {
    try {
      await _initializeCameraControllerFuture;

      final image = await _cameraController.takePicture();

      Navigator.pop(context, image);
    } catch (e) {
      print(e);
    }
  }

  /// --- Widgets ---

  Widget get futureView => FutureBuilder<void>(
        future: _initializeCameraControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_cameraController);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: futureView,
        floatingActionButton: FloatingActionButton(onPressed: takePicture));
  }
}
