import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // Initialize the camera controller
    _controller = CameraController(
      // Get a list of available cameras
      // This code selects the first available camera
      // You can change this to select a specific camera
      CameraDescription(
        name: "0",
        lensDirection: CameraLensDirection.back,
        sensorOrientation: 0,
        //resolution: const Size(1920, 1080),
      ),
      // Set the resolution of the camera preview
      ResolutionPreset.high,
    );

    // Wait until the controller is initialized before updating the UI
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera'),
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the camera preview
            return CameraPreview(_controller);
          } else {
            // Otherwise, display a loading spinner
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            // Wait until the camera is ready before capturing a photo
            await _initializeControllerFuture;

            // Capture a photo and save it to the gallery
            final image = await _controller.takePicture();
            // Use the captured image as you need, for example:
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => ImagePreviewPage(image.path),
            //   ),
            // );
          } catch (e) {
            // If an error occurs, log it and show a toast message
            debugPrint('Error capturing photo: $e');
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Error capturing photo')),
            );
          }
        },
        child: const Icon(Icons.camera),
      ),
    );
  }
}
