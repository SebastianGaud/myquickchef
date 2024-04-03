import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraBox extends StatelessWidget {
  const CameraBox({
    super.key,
    required Future<void> initializeControllerFuture,
    required CameraController controller,
  })  : _initializeControllerFuture = initializeControllerFuture,
        _controller = controller;

  final Future<void> _initializeControllerFuture;
  final CameraController _controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        height: 500,
        width: 330,
        child: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CameraPreview(_controller);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
