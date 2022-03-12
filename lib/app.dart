import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EcogramApp extends StatefulWidget {
  const EcogramApp({Key? key}) : super(key: key);

  @override
  State<EcogramApp> createState() => _EcogramAppState();
}

class _EcogramAppState extends State<EcogramApp> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: Colors.white,
        child: Center(child: Text("Hello world")));
  }
}
