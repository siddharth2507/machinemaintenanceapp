import 'dart:io';

import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/my_theme_button.dart';

class NkFilePickerWithCameraWidget extends StatefulWidget {
  const NkFilePickerWithCameraWidget({super.key});
  @override
  State<NkFilePickerWithCameraWidget> createState() =>
      _NkFilePickerWithCameraWidgetState();
}

class _NkFilePickerWithCameraWidgetState
    extends State<NkFilePickerWithCameraWidget> {
  late CameraController _cameraController;
  List<CameraDescription>? cameras;
  File? cameraCaptureData;
  File? filePickData;

  Future loadCamera() async {
    cameras = await availableCameras();
    setState(() {
      cameras;
      final firstCamera = cameras!.first;
      _cameraController = CameraController(
        firstCamera,
        ResolutionPreset.high,
      )..initialize();
    });
  }

  Widget pickImageFromCamera(CameraController cameraController) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          Flexible(child: CameraPreview(cameraController)),
          const SizedBox(
            width: 10.0,
          ),
          MyThemeButton(
            buttonText: "Take Photo",
            width: 100,
            onPressed: () async {
              cameraController.takePicture().then((value) {
                if (value.path.isNotEmpty) {
                  setState(() {
                    filePickData = null;
                    cameraCaptureData = File(value.path);
                  });
                  Navigator.pop(context, cameraCaptureData);
                }
              });
            },
          ),
          const SizedBox(
            width: 10.0,
          ),
        ],
      ),
    );
    /* FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
      allowCompression: true,
      withData: false,
      withReadStream: true,
    );

    if (result != null && result.files.isNotEmpty) {
      return File(result.files.single.path!);
    }

    return null;*/
  }

  Future<File?> pickImageFromGallery() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
      allowCompression: true,
      withData: false,
      withReadStream: true,
    );

    if (result != null && result.files.isNotEmpty) {
      return File(result.files.single.path!);
    }

    return null;
  }

  @override
  void initState() {
    loadCamera();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: <Widget>[
        imagePreview(filePickData ?? cameraCaptureData),
        ListTile(
          leading: const Icon(Icons.camera_alt),
          title: const Text('Camera'),
          onTap: () async {
            Get.dialog(pickImageFromCamera(_cameraController));
            //Navigator.pop(context, cameraCaptureData);
          },
        ),
        ListTile(
          leading: const Icon(Icons.photo_library),
          title: const Text('Gallery'),
          onTap: () async {
            File? image = await pickImageFromGallery();

            setState(() {
              image != null ? cameraCaptureData = null : null;
              filePickData = image;
            });
            // Handle the selected image file from the gallery
            //Navigator.pop(context, image);
          },
        ),
        const SizedBox(
          height: 10.0,
        ),
        ListTile(
          leading: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.redAccent),
              )),
          trailing: cameraCaptureData != null || filePickData != null
              ? ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pop(cameraCaptureData ?? filePickData);
                  },
                  child: const Text('Done'),
                )
              : const SizedBox(),
        ),
      ],
    );
  }

  Widget imagePreview(File? image) {
    return image != null
        ? Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                image: DecorationImage(
                  image: FileImage(image),
                )),
          )
        : const SizedBox();
  }
}
