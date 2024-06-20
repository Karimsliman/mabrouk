import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.indigo[800],
      appBar: AppBar(
        title: const Text('تطابق صورة'),
        backgroundColor: Colors.indigo,
      ),
      body: const ImagePage(),
    ),
  ));
}

class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  int leftImageNumber = 1;
  int rightImageNumber = 2;

  void changeImage() {
    leftImageNumber = Random().nextInt(8) + 1; //0-8
    rightImageNumber = Random().nextInt(8) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          leftImageNumber == rightImageNumber
              ? ('!مبروك لقد نجحت!')
              : 'حاول مرة أخرى',
          style: TextStyle(
            fontSize: 42.0,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            changeImage();
                          });
                        },
                        child:
                            Image.asset('images/image-$leftImageNumber.png'))),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          changeImage();
                        });
                      },
                      child: Image.asset('images/image-$rightImageNumber.png')),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
