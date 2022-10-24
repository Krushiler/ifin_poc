import 'package:flutter/material.dart';
import 'package:ifin_poc/screens/documents_screen.dart';
import 'package:ifin_poc/screens/liveness_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LivenessScreen()));
                  },
                  child: const Text('Проверка реальности')),
              const SizedBox(height: 24,),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DocumentsReaderScreen()));
                  },
                  child: const Text('Проверка документов')),
            ],
          ),
        ),
      ),
    );
  }
}
