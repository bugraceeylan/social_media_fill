import 'package:fill_store_bb/app/constant/color.dart';
import 'package:flutter/material.dart';

class KvkScreen extends StatelessWidget {
  const KvkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      appBar: AppBar(
        backgroundColor: cWhite,
        title: const Text('KVKK Metni'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'KVKK METNİ',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
