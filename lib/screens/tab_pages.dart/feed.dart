import 'package:ecogram/theme/style.dart';
import 'package:flutter/cupertino.dart';

class FeedController extends StatefulWidget {
  const FeedController({Key key}) : super(key: key);

  @override
  State<FeedController> createState() => _FeedControllerState();
}

class _FeedControllerState extends State<FeedController> {
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
