import 'package:ecogram/theme/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ButtonType { primary, text, delete, border, icon }

class Button extends StatelessWidget {
  final ButtonType type;
  final Function()? onPressed;
  final Color? color;
  final ShapeBorder? shape;
  final Widget? child;
  final String? text;
  final Color? textColor;
  final double? minWidth;
  final EdgeInsets? padding;
  final bool spinner;
  final double? height;
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;
  final TextStyle? style;
  Button.primary({
    Key? key,
    this.color,
    this.child,
    this.text,
    this.textColor,
    @required this.onPressed,
    this.padding,
    this.spinner = false,
    this.height,
    this.style,
  })  : this.type = ButtonType.primary,
        this.shape = null,
        this.minWidth = null,
        this.icon = null,
        this.iconSize = null,
        this.iconColor = null,
        super(key: key);

  const Button.text({
    Key? key,
    this.color,
    this.child,
    this.text,
    this.textColor,
    this.padding,
    @required this.onPressed,
    this.spinner = false,
    this.height,
    this.style,
  })  : this.type = ButtonType.text,
        this.shape = null,
        this.minWidth = null,
        this.icon = null,
        this.iconSize = null,
        this.iconColor = null,
        super(key: key);

  const Button.delete({
    Key? key,
    this.color,
    this.child,
    this.text,
    this.textColor,
    @required this.onPressed,
    this.padding,
    this.spinner = false,
    this.height,
    this.style,
  })  : this.type = ButtonType.delete,
        this.shape = null,
        this.minWidth = null,
        this.icon = null,
        this.iconSize = null,
        this.iconColor = null,
        super(key: key);

  Button.border({
    Key? key,
    this.color,
    this.child,
    this.text,
    this.textColor,
    @required this.onPressed,
    this.padding,
    this.spinner = false,
    this.height,
    this.style,
  })  : this.type = ButtonType.border,
        this.shape = null,
        this.minWidth = null,
        this.icon = null,
        this.iconSize = null,
        this.iconColor = null,
        super(key: key);

  Button.icon({
    Key? key,
    this.color,
    this.child,
    this.text,
    this.textColor,
    @required this.onPressed,
    this.padding,
    this.spinner = false,
    this.height,
    this.icon,
    this.iconSize,
    this.iconColor,
    this.minWidth,
    this.style,
  })  : this.type = ButtonType.icon,
        this.shape = null,
        super(key: key);

  Widget get calculatedChild {
    Widget widget;
    switch (type) {
      case ButtonType.primary:
        widget = Text(
          text!,
          style: Style.body3w5.copyWith(color: textColor ?? Style.colors.white),
        );
        break;

      case ButtonType.text:
        widget = Text(
          text!,
          style: style != null
              ? style
              : Style.bodyw6.copyWith(color: Style.colors.primary),
        );
        break;

      case ButtonType.delete:
        widget = Text(
          text!,
          style: Style.body3w5.copyWith(color: Style.colors.error),
        );
        break;

      case ButtonType.border:
        widget = Text(
          text!,
          style: Style.body3w5.copyWith(color: Style.colors.grey6),
        );
        break;

      case ButtonType.icon:
        widget = Icon(
          icon,
          color: iconColor ?? Style.colors.white,
          size: iconSize,
        );
        break;
    }
    return widget;
  }

  @override
  Widget build(BuildContext context) => MaterialButton(
        elevation: 0,
        highlightElevation: 0,
        minWidth: minWidth,
        height: height ?? 56,
        disabledColor: Style.colors.grey4,
        padding: padding ?? Style.padding12,
        color: color ?? type.color,
        shape: shape ?? type.shape,
        child:
            spinner ? CupertinoActivityIndicator() : child ?? calculatedChild,
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

      case ButtonType.text:
        color = Style.colors.background;
        break;

      case ButtonType.delete:
        color = Style.colors.error.withOpacity(0.2);
        break;
      case ButtonType.border:
        color = Style.colors.white;
        break;
      case ButtonType.icon:
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
          borderRadius: BorderRadius.circular(99.0),
        );
        break;

      case ButtonType.text:
        shape = RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        );
        break;

      case ButtonType.delete:
        shape = RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        );
        break;

      case ButtonType.border:
        shape = RoundedRectangleBorder(
          side: BorderSide(
              color: Style.colors.grey3, width: 0.5, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(12.0),
        );
        break;
      case ButtonType.icon:
        shape = const CircleBorder();
        break;
    }
    return shape;
  }
}
