import 'package:ecogram/cells/button.dart';
import 'package:ecogram/theme/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class YesOrNoBottomSheet extends StatelessWidget {
  const YesOrNoBottomSheet(
      {Key key,
      @required this.yesFunction,
      @required this.noFunction,
      @required this.mainText,
      @required this.subText})
      : super(key: key);
  final Function yesFunction;
  final Function noFunction;
  final String mainText;
  final String subText;

  /// --- Widgets ---

  Widget get yesOrNoButtons => Row(
        children: [
          Expanded(
            child: Button.primary(
                text: "No",
                style: Style.bodyw5.copyWith(color: Style.colors.primary),
                color: Style.colors.queueLightBlue,
                onPressed: noFunction),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Button.primary(text: "Yes", onPressed: yesFunction),
          ),
        ],
      );

  Widget get bottomSheetView => Material(
      color: Style.colors.white,
      child: Padding(
        padding: Style.padding20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 4.0),
            Text(mainText,
                style: Style.body2w5.copyWith(color: Style.colors.primary)),
            const SizedBox(height: 12.0),
            Text(subText,
                style: Style.bodyw3.copyWith(color: Style.colors.grey)),
            const SizedBox(height: 32.0),
            yesOrNoButtons,
            const SizedBox(height: 32.0),
          ],
        ),
      ));

  @override
  Widget build(BuildContext context) {
    return bottomSheetView;
  }
}
