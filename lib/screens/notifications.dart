import 'package:ecogram/theme/style.dart';
import 'package:flutter/cupertino.dart';

class NotificationsController extends StatefulWidget {
  const NotificationsController({Key? key}) : super(key: key);

  @override
  State<NotificationsController> createState() =>
      _NotificationsControllerState();
}

class _NotificationsControllerState extends State<NotificationsController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Notification",
          style: Style.body2w5,
        ),
      ),
    );
  }
}
