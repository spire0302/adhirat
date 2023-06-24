import 'dart:core';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:icalendar_parser/icalendar_parser.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class Callender extends StatefulWidget {
  @override
  _CallenderState createState() => _CallenderState();
}

class _CallenderState extends State<Callender> {
  ICalendar? _iCalendar;
  bool _isLoading = false;

  Future<void> _getAssetsFile() async {
    setState(() => _isLoading = true);
    try {
      final directory = await getTemporaryDirectory();
      // final path = p.join(directory.path, "assets/file/cellander.ics");
      final data = await rootBundle.load('assets/file/cellander.ics');
      final bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      final file = await File('assets/file/cellander.ics');
      final lines = await file.readAsLines();
      setState(() {
        _iCalendar = ICalendar.fromLines(lines);
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      throw 'Error: $e';
    }
  }

  Widget _generateTextContent() {
    final style = const TextStyle(color: Colors.black);
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: 'VERSION:',
              style: style.copyWith(fontWeight: FontWeight.bold)),
          TextSpan(
              text: 'PRODID: ',
              style: style.copyWith(fontWeight: FontWeight.bold)),
          TextSpan(
              children: _iCalendar!.data
                  .map((e) => TextSpan(
                        children: e.keys
                            .map((f) => TextSpan(children: [
                                  TextSpan(
                                      text: '${f.toUpperCase()}: ',
                                      style: style.copyWith(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(text: '${e[f]}\n')
                                ]))
                            .toList(),
                      ))
                  .toList()),
        ],
        style: style,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Callander"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (_isLoading || _iCalendar == null)
              const Center(child: CircularProgressIndicator())
            else
              _generateTextContent(),
            FloatingActionButton(
              child: const Text('Load File 1'),
              onPressed: () => _getAssetsFile(),
            ),
            FloatingActionButton(
              child: const Text('Load File 2'),
              onPressed: () => _getAssetsFile(),
            ),
          ],
        ),
      ),
    );
  }
}
