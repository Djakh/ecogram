import 'package:ecogram/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

enum TextInputFieldType { ordinary, obscure, large, phone, smsCode }

class TextInputField extends StatefulWidget {
  final String placeholder;
  final String title;
  final String error;
  final bool obscureText;
  final bool autofocus;
  final bool autocorrect;
  final bool readonly;
  final bool searchText;
  final BorderRadiusGeometry borderRadius;
  final TextEditingController controller;
  final ValueChanged<String> onChange;
  final GestureTapCallback onTap;
  final TextInputType keyboardType;
  final FocusNode focusNode;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final Color color;
  final Color hintColor;
  final int maxLines;
  final int minLines;
  final EdgeInsets contentPadding;
  final TextInputFieldType type;

  const TextInputField.ordinary({
    @required this.controller,
    Key key,
    this.placeholder,
    this.title,
    this.error,
    this.autofocus = false,
    this.autocorrect = false,
    this.readonly = false,
    this.onChange,
    this.onTap,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    this.suffixIcon,
    this.maxLines = 1,
    this.minLines = 1,
    this.prefixIcon,
    this.searchText = false,
    this.borderRadius,
    this.color,
    this.hintColor,
    this.contentPadding,
  })  : this.obscureText = false,
        this.type = TextInputFieldType.ordinary,
        super(key: key);

  const TextInputField.obscure({
    Key key,
    this.placeholder,
    this.title,
    this.error,
    this.autofocus = false,
    this.autocorrect = false,
    this.readonly = false,
    @required this.controller,
    this.onChange,
    this.onTap,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    this.suffixIcon,
    this.maxLines = 1,
    this.minLines = 1,
    this.prefixIcon,
    this.borderRadius,
    this.color,
    this.hintColor,
    this.contentPadding,
  })  : this.obscureText = true,
        this.searchText = false,
        this.type = TextInputFieldType.obscure,
        super(key: key);

  const TextInputField.large({
    @required this.controller,
    Key key,
    this.placeholder,
    this.title,
    this.error,
    this.autofocus = false,
    this.autocorrect = false,
    this.readonly = false,
    this.onChange,
    this.onTap,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    this.suffixIcon,
    this.maxLines,
    this.prefixIcon,
    this.borderRadius,
    this.color,
    this.hintColor,
    this.contentPadding,
  })  : this.obscureText = false,
        this.minLines = 5,
        this.searchText = false,
        this.type = TextInputFieldType.large,
        super(key: key);

  const TextInputField.phone({
    Key key,
    this.placeholder,
    this.title,
    this.error,
    this.autofocus = false,
    this.autocorrect = false,
    this.readonly = false,
    @required this.controller,
    this.onChange,
    this.onTap,
    this.keyboardType = TextInputType.number,
    this.focusNode,
    this.suffixIcon,
    this.maxLines = 1,
    this.minLines = 1,
    this.prefixIcon,
    this.borderRadius,
    this.color,
    this.hintColor,
    this.contentPadding,
    this.obscureText = false,
    this.searchText = false,
  })  : this.type = TextInputFieldType.phone,
        super(key: key);

  const TextInputField.smsCode({
    Key key,
    this.placeholder,
    this.title,
    this.error,
    this.autofocus = false,
    this.autocorrect = false,
    this.readonly = false,
    @required this.controller,
    this.onChange,
    this.onTap,
    this.keyboardType = TextInputType.number,
    this.focusNode,
    this.suffixIcon,
    this.maxLines = 1,
    this.minLines = 1,
    this.prefixIcon,
    this.borderRadius,
    this.color,
    this.hintColor,
    this.contentPadding,
    this.obscureText = false,
    this.searchText = false,
  })  : this.type = TextInputFieldType.smsCode,
        super(key: key);

  @override
  _TextInputFieldState createState() => _TextInputFieldState(
        focusNode ?? FocusNode(),
        obscureText,
        autofocus,
      );
}

class _TextInputFieldState extends State<TextInputField> {
  FocusNode focusNode;
  bool obscureText;
  bool focused;
  bool isObscureTextField;

  _TextInputFieldState(
    this.focusNode,
    this.obscureText,
    this.focused,
  );

  /// --- Life Cycles ---

  @override
  void initState() {
    super.initState();
    isObscureTextField = obscureText;
    focusNode.addListener(onFocusChange);
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  /// --- Methods ---

  get borderColor => widget.error != null
      ? Style.colors.error
      : widget.color ?? (focused ? Style.colors.primary : Style.colors.grey4);

  void onFocusChange() {
    if (!mounted) return;
    setState(() {
      focused = focusNode.hasFocus;
    });
  }

  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  void clearSearchController() {
    if (widget.controller.text.isEmpty) {
      FocusScope.of(context).unfocus();
    } else {
      widget.controller.clear();
    }
  }

  /// --- Widgets ---

  Widget get visibilityIcon => IconButton(
        onPressed: toggle,
        icon: Icon(
          obscureText ? Icons.visibility : Icons.visibility_off,
          color: focused ? Style.colors.primary : Style.colors.grey,
        ),
        padding: EdgeInsets.zero,
      );

  Widget get leading => Icon(
        Icons.search,
        color: focused ? Style.colors.primary : Style.colors.grey,
      );

  Widget get closeIcon => !focused
      ? Container()
      : IconButton(
          onPressed: clearSearchController,
          icon: Icon(Icons.close, color: Style.colors.primary),
          padding: EdgeInsets.zero,
        );

  Widget get errorText => Text(
        widget.error,
        style: Style.bodyw5.copyWith(color: Style.colors.error),
      );

  Widget get textField => Theme(
        data: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            prefixStyle: TextStyle(
              color: focused ? Style.colors.primary : Style.colors.grey,
            ),
            suffixStyle: TextStyle(
              color: focused ? Style.colors.primary : Style.colors.grey,
            ),
            labelStyle: TextStyle(
              color: focused ? Style.colors.primary : Style.colors.grey,
            ),
          ),
          fontFamily: Style.fontFamily,
          hintColor: widget.hintColor ?? Style.colors.grey,
        ),
        child: Material(
          color: Colors.transparent,
          child: TextField(
            style: Style.body2w3,
            maxLength: widget.type.maxLength,
            cursorColor: Style.colors.indigo9,
            keyboardAppearance: Style.appBrightness,
            readOnly: widget.readonly,
            autocorrect: widget.autocorrect,
            autofocus: widget.autofocus,
            controller: widget.controller,
            focusNode: focusNode,
            key: widget.key,
            keyboardType: widget.keyboardType,
            obscureText: obscureText,
            onChanged: widget.onChange,
            onTap: widget.onTap,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            textAlignVertical: TextAlignVertical.center,
            inputFormatters:
                widget.type.mask != null ? [widget.type.mask] : null,
            decoration: InputDecoration(
              alignLabelWithHint: widget.minLines > 1,
              hintText: widget.placeholder,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Style.colors.background),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Style.colors.background),
              ),
              counterText: "",
              contentPadding: widget.contentPadding,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              prefixIcon: widget.searchText ? leading : widget.prefixIcon,
              suffixIcon: !widget.searchText
                  ? (isObscureTextField ? visibilityIcon : widget.suffixIcon)
                  : closeIcon,
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    Column column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        textField,
      ],
    );

    if (widget.error != null) {
      column.children.addAll([
        const SizedBox(height: 4.0),
        errorText,
      ]);
    }

    return column;
  }
}

/// --- Extension ---

extension on TextInputFieldType {
  MaskTextInputFormatter get mask {
    MaskTextInputFormatter mask;
    switch (this) {
      case TextInputFieldType.phone:
        mask = MaskTextInputFormatter(mask: '## ### ## ##');
        break;
      case TextInputFieldType.smsCode:
        mask = MaskTextInputFormatter(mask: '# # # #');
        break;
      default:
        mask = null;
        break;
    }

    return mask;
  }

  int get maxLength {
    int maxLength;
    switch (this) {
      case TextInputFieldType.phone:
        maxLength = 12;
        break;
      case TextInputFieldType.smsCode:
        maxLength = 7;
        break;
      default:
        maxLength = null;
        break;
    }

    return maxLength;
  }
}
