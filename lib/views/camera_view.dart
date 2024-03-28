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
                ? Stack(children: [
                    CameraPreview(controller.cameraController),
                    Positioned(
                      top: (controller.y) * 700,
                      right: (controller.x) * 500,
                      child: Container(
                        height: (controller.w * 100 * context.height / 100),
                        width: (controller.h * 100 * context.width / 100),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border:
                                Border.all(color: Colors.green, width: 4.0)),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                  color: Colors.white,
                                  child: const Text("Label of object"))
                            ]),
                      ),
                    )
                  ])
                : const Center(child: Text("Loading Preview ..."));
          }),
    );
  }
}
