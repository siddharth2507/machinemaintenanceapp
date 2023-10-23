import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/my_regular_text.dart';

class NkFilePicker extends StatefulWidget {
  final FileType? fileType;
  final bool? allowMultipleFileSelect;
  final String? dialogTitle;
  final dynamic Function(FilePickerStatus)? onFileLoading;
  final List<String>? allowedExtensions;
  final Function(File? file)? onFileSelected;
  const NkFilePicker(
      {super.key,
      this.fileType,
      this.allowMultipleFileSelect,
      this.dialogTitle,
      this.onFileLoading,
      this.onFileSelected,
      this.allowedExtensions});

  @override
  State<NkFilePicker> createState() => _NkFilePickerState();
}

class _NkFilePickerState extends State<NkFilePicker> {
  File? filePickData;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: <Widget>[
        imagePreview(filePickData),
        ListTile(
          leading: const Icon(CupertinoIcons.folder_fill),
          title: const Text('File'),
          onTap: () async {
            File? fileData = await pickFile();

            setState(() {
              fileData != null ? filePickData = null : null;
              filePickData = fileData;
              widget.onFileSelected?.call(filePickData);
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
          trailing: filePickData != null
              ? ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(filePickData ?? filePickData);
                  },
                  child: const Text('Done'),
                )
              : const SizedBox(),
        ),
      ],
    );
  }

  Widget imagePreview(File? fileData) {
    return fileData != null
        ? MyRegularText(
            label: fileData.path,
            align: TextAlign.center,
          )
        : const SizedBox();
  }

  Future<File?> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: widget.fileType ?? FileType.any,
        allowMultiple: widget.allowMultipleFileSelect ?? false,
        allowCompression: true,
        allowedExtensions: widget.allowedExtensions,
        withData: false,
        withReadStream: true,
        dialogTitle: widget.dialogTitle,
        onFileLoading: widget.onFileLoading);

    if (result != null && result.files.isNotEmpty) {
      return File(result.files.single.path!);
    }

    return null;
  }
}
