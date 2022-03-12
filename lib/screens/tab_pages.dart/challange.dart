import 'package:ecogram/theme/style.dart';
import 'package:flutter/cupertino.dart';

class ChallangeController extends StatefulWidget {
  const ChallangeController({ Key key }) : super(key: key);

  @override
  State<ChallangeController> createState() => _ChallangeControllerState();
}

class _ChallangeControllerState extends State<ChallangeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Challange",
          style: Style.body2w5,
        ),
      ),
    );
  }
}