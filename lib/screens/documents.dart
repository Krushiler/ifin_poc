import 'dart:convert';
import 'dart:io' as io;
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart'
    show EventChannel, PlatformException, rootBundle;
import 'package:flutter_document_reader_api/document_reader.dart';
import 'package:image_picker/image_picker.dart';

class DocumentsReaderPage extends StatefulWidget {
  const DocumentsReaderPage({
    super.key,
    required this.title,
    // required this.livenessResponse
  });

  // final fa.LivenessResponse livenessResponse;
  final String title;

  @override
  State<DocumentsReaderPage> createState() => _DocumentsReaderPageState();
}

class _DocumentsReaderPageState extends State<DocumentsReaderPage> {
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
