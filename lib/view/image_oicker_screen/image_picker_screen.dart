import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  String? Imagepath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Imagepath != null
                  ? Image.file(File(Imagepath!))
                  : Text("No image uploaded"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    InkWell(
                        onTap: () async {
                          final ImagePicker picker = ImagePicker();

                          final XFile? uploadimage = await picker.pickImage(
                              source: ImageSource.gallery);
                          if (uploadimage != null) {
                            print(uploadimage.path.toString());
                            Imagepath = uploadimage.path;
                          }
                          setState(() {});
                        },
                        child: Container(
                          height: 50,
                          width: 150,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text("Upload Image"),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () async {
                        final ImagePicker picker = ImagePicker();

                        final XFile? uploadimage =
                            await picker.pickImage(source: ImageSource.camera);
                        if (uploadimage != null) {
                          print(uploadimage.path.toString());
                          Imagepath = uploadimage.path;
                        }
                        setState(() {});
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text("capture image"),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
