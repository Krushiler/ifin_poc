import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_face_api/face_api.dart';
import 'package:ifin_poc/screens/documents_screen.dart';

class LivenessScreen extends StatefulWidget {
  const LivenessScreen({super.key});

  @override
  State<LivenessScreen> createState() => _LivenessScreenState();
}

class _LivenessScreenState extends State<LivenessScreen> {
  LivenessResponse? livenessResponse;

  _startLiveness() {
    FaceSDK.startLiveness().then((r) {
      final response = LivenessResponse.fromJson(jsonDecode(r));
      setState(() {
        livenessResponse = response;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextButton(
              onPressed: () {
                _startLiveness();
              },
              child: const Text('Проверить реальность')),
          const SizedBox(height: 16),
          if (livenessResponse != null)
            Text(livenessResponse?.liveness == LivenessStatus.PASSED
                ? 'Проверка пройдена'
                : 'Ошибка проверки')
        ]),
      ),
    );
  }
}

navigateToLivenessScreen(BuildContext buildContext) {
  Navigator.push(buildContext,
      MaterialPageRoute(builder: (context) => const LivenessScreen()));
}
