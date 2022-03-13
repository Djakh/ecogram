import 'dart:io';

import 'package:camera/camera.dart';
import 'package:ecogram/bloc/base/simple_get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class PhotoState extends SimpleGetState<File> {
  Future<void> initial;
  CameraController controller;
  PhotoState(
      {bool fetching = false,
      File file,
      Exception exception,
      this.initial,
      this.controller})
      : super(fetching: fetching, data: file, exception: exception);
}

class PhotoCubit extends Cubit<PhotoState> {
  final client = http.Client();
  File file;
  final picker = ImagePicker();
  PhotoCubit() : super(PhotoState());

  Future<void> takePhoto() async {
    emit(PhotoState(fetching: true));

    try {
      final cameras = await availableCameras();
      final firstCamera = cameras.first;
      CameraController controller = CameraController(
        firstCamera,
        ResolutionPreset.medium,
      );

      Future<void> initializeControllerFuture = controller.initialize();
      final xFile = await controller.takePicture();
      if (xFile != null) {
        file = File(xFile.path);
      }

      emit(PhotoState(file: file, initial: initializeControllerFuture));
    } catch (exp) {
      emit(PhotoState(exception: exp));
    }
  }

  @override
  Future<void> close() {
    client.close();
    return super.close();
  }
}
