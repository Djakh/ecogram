import 'package:ecogram/theme/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ButtonType { primary, icon, text}

class Button extends StatelessWidget {
  final ButtonType type;
  final Function onPressed;
  final Color iconColor;
  final Color color;
  final ShapeBorder shape;
  final Widget child;
  final String text;
  final IconData icon;
  final double iconSize;
  final double minWidth;
  final EdgeInsets padding;
  final bool spinner;
  final double height;
  final TextStyle style;

  const Button.primary({
    Key key,
    this.color,
    this.child,
    this.text,
    @required this.onPressed,
    this.padding,
    this.spinner = false,
    this.height,
    this.shape,
    this.style,
  })  : this.type = ButtonType.primary,
        this.icon = null,
        this.iconColor = null,
        this.minWidth = null,
        this.iconSize = null,
        super(key: key);

  const Button.text({
    Key key,
    this.color,
    this.child,
    this.text,
    this.padding,
    @required this.onPressed,
    this.spinner = false,
    this.height,
    this.style,
  })  : this.type = ButtonType.text,
        this.shape = null,
        this.icon = null,
        this.iconColor = null,
        this.minWidth = null,
        this.iconSize = null,
        super(key: key);

  const Button.icon({
    Key key,
    this.color,
    this.child,
    this.icon,
    this.iconColor,
    this.minWidth,
    this.padding,
    this.iconSize,
    @required this.onPressed,
    this.spinner = false,
    this.height,
    this.style,
  })  : this.type = ButtonType.icon,
        this.shape = null,
        this.text = null,
        super(key: key);

  Widget get calculatedChild {
    Widget widget;
    switch (type) {
      case ButtonType.primary:
        widget = Center(
          child: Text(
            text,
            style: style ?? Style.body2w5.copyWith(color: Style.colors.white),
          ),
        );
        break;
      case ButtonType.icon:
        widget = Icon(
          icon,
          color: iconColor ?? Style.colors.white,
          size: iconSize,
        );
        break;
      case ButtonType.text:
        widget = Text(
          text,
          style: style ?? Style.bodyw5.copyWith(color: Style.colors.white),
        );
        break;
    }
    return widget;
  }

  @override
  Widget build(BuildContext context) => MaterialButton(
        height: height ?? 56,
        padding: padding ?? Style.padding0,
        elevation: 0,
        highlightElevation: 0,
        disabledColor: Style.colors.grey4,
        color: color ?? type.color,
        shape: shape ?? type.shape,
        child:
            spinner ? Center(child: CupertinoActivityIndicator()) : child ?? calculatedChild,
        onPressed: onPressed,
      );
}

extension on ButtonType {
  Color get color {
    Color color;
    switch (this) {
      case ButtonType.primary:
        color = Style.colors.primary;
        break;
      case ButtonType.icon:
        color = Style.colors.primary;
        break;
      case ButtonType.text:
        color = Style.colors.transparent;
        break;
      default:
        color = Style.colors.primary;
        break;
    }

    return color;
  }

  ShapeBorder get shape {
    ShapeBorder shape;
    switch (this) {
      case ButtonType.primary:
        shape = RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        );
        break;
      case ButtonType.icon:
        shape = const CircleBorder();
        break;
      case ButtonType.text:
        shape = RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        );
        break;
    }
    return shape;
  }
}
