// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageFromUrl extends StatefulWidget {
  @override
  _ImageFromUrlState createState() => _ImageFromUrlState();
}

class _ImageFromUrlState extends State<ImageFromUrl> {
  String imageUrl = '';

  Future<void> sendImageAndGetUrl() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      String fileName = pickedFile.path.split('/').last;

      FormData formData = FormData.fromMap({
        "file":
            await MultipartFile.fromFile(pickedFile.path, filename: fileName),
      });

      Response response = await Dio()
          .post('http://147.45.109.158:9001/upload/', data: formData);

      if (response.statusCode == 200) {
        setState(() {
          String eventImageUrl = response.data;
//         // Handle the received image URL
          print(
              eventImageUrl); // Replace 'imageUrl' with the key where the image URL is stored in the response
        });
      } else {
        // Handle error
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String? eventImageUrl;
    return Scaffold(
      appBar: AppBar(
        title: Text('Image from URL'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: sendImageAndGetUrl,
            child: Text('Select Image'),
          ),
          Center(
              child: eventImageUrl != null
                  ? Image.network(eventImageUrl)
                  : Container(
                      color: Colors.red,
                      height: 50,
                      width: 50,
                    )),
        ],
      ),
    );
  }
}
