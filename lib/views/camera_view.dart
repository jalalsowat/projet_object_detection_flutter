import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_object_detection_tensorflow/controller/scan_cotroller.dart';
import 'package:get/get.dart';

class CameraView extends StatelessWidget {
  const CameraView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<Scancontroller>(
          init: Scancontroller(),
          builder: (controller) {
            return controller.isCameraInitialized.value
                ? CameraPreview(controller.cameraController)
                : const Center(child: Text("Loading Preview ..."));
          }),
    );
  }
}
