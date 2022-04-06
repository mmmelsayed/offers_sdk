import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:offers_sdk/offers_sdk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _contact = 'Unknown';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter is Awesome'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text('Picker'),
                onPressed: () => _getAContact(),
              ),
              Text(_contact ?? '')
            ],
          ),
        ),
      ),
    );
  }

  _getAContact() async {
    String contact;
    try {
      contact = await OffersSdk.getAContact();
    } on PlatformException {
      contact = 'Failed to get contact.';
    }
    if (!mounted) return;
    setState(() {
      _contact = contact;
    });
  }
}