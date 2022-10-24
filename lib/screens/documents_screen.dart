import 'dart:convert';
import 'dart:io' as io;
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart'
    show EventChannel, PlatformException, rootBundle;
import 'package:flutter_document_reader_api/document_reader.dart';
import 'package:ifin_poc/file_picker_util.dart';
import 'package:image_picker/image_picker.dart';

class DocumentsReaderScreen extends StatefulWidget {
  const DocumentsReaderScreen({
    super.key,
  });

  @override
  State<DocumentsReaderScreen> createState() => _DocumentsReaderScreenState();
}

class _DocumentsReaderScreenState extends State<DocumentsReaderScreen> {
  List<String> results = [];

  @override
  void initState() {
    super.initState();
    _initDocumentReader();
    const EventChannel('flutter_document_reader_api/event/completion')
        .receiveBroadcastStream()
        .listen((jsonString) => _handleCompletion(
            DocumentReaderCompletion.fromJson(json.decode(jsonString))));
  }

  _handleCompletion(DocumentReaderCompletion? completion) {
    if (completion?.action == DocReaderAction.COMPLETE ||
        completion?.action == DocReaderAction.TIMEOUT) {
      setState(() {
        for (int i = 0; i <= 650; i++) {
          final field = completion?.results?.getTextFieldValueByType(i);

          if (field != null) results.add('${EVisualFieldType.getTranslation(i)}: $field');
        }
      });
      print('Это криндж');
      print(completion?.results?.rawResult);
    }
  }

  _initDocumentReader() async {
    ByteData byteData = await rootBundle.load("assets/regula.license");
    await DocumentReader.initializeReader({
      "license": base64.encode(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes))
    });
    await DocumentReader.prepareDatabase("Full");
    DocumentReader.setConfig({
      "processParams": {"scenario": ScenarioIdentifier.SCENARIO_FULL_PROCESS}
    });
  }

  _checkDocument() async {
    await DocumentReader.showScanner();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          ListView.separated(
            shrinkWrap: true,
            itemCount: results.length,
            itemBuilder: (context, index) => Text(results[index]),
            separatorBuilder: (context, index) => const Divider(height: 1),
          ),
          TextButton(
              onPressed: () {
                _checkDocument();
              },
              child: const Text('Проверить документ'))
        ],
      ),
    ));
  }
}

navigateToDocumentsReaderScreen(BuildContext buildContext) {
  Navigator.push(buildContext,
      MaterialPageRoute(builder: (context) => const DocumentsReaderScreen()));
}
