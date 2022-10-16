import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_face_api/face_api.dart';
import 'package:ifin_poc/screens/documents.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  LivenessResponse? livenessResponse;

  _startLiveness()  {
    FaceSDK.startLiveness().then((r) {
      final response = LivenessResponse.fromJson(jsonDecode(r));
      setState(() {
        livenessResponse = response;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (livenessResponse?.liveness == LivenessStatus.PASSED) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const DocumentsReaderPage(title: 'Documents Check',
            // livenessResponse: livenessResponse!
        )));
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: () {
                _startLiveness();
              }, child: const Text('Check documents')),
            ]
        ),
      ),
    );
  }
}