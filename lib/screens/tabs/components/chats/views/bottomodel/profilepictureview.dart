import 'dart:io';
import 'package:chattingapp/common/common.dart';
import 'package:flutter/material.dart';

class PicturePictureView extends StatelessWidget {
  const PicturePictureView({Key? key, this.path}) : super(key: key);
  final path;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConstants.dark1Color,
      appBar: AppBar(
        backgroundColor: ThemeConstants.dark1Color,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: IconButton(
              icon: const Icon(
                Icons.check,
                size: 30,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 150,
              child: Image.file(
                File(path!),
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
