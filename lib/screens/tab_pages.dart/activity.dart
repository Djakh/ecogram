import 'package:ecogram/theme/style.dart';
import 'package:flutter/cupertino.dart';

class ActivityController extends StatefulWidget {
  const ActivityController({Key key}) : super(key: key);

  @override
  State<ActivityController> createState() => _ActivityControllerState();
}

class _ActivityControllerState extends State<ActivityController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Activity",
          style: Style.body2w5,
        ),
      ),
    );
  }
}
