import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../utils/app_colors.dart';
import 'app_text.dart';

class AppTextField extends StatefulWidget {
  int maxLength;
  Widget? label;
  TextStyle? labelStyle;
  TextStyle? hintStyle;
  String? labelText;
  String? hintText;
  double leftPadding;
  dynamic onChange;
  TextEditingController controller;
  FocusNode? focusNode;
  bool isPhone;
  TextInputType keyboardType;
  int? maxLines;

  // GlobalKey<FormState> formKey;
  bool validation;
  String validText;

  AppTextField({
    this.label,
    this.labelText,
    this.hintText,
    this.hintStyle,
    this.leftPadding = 15,
    this.labelStyle,
    this.onChange,
    required this.controller,
    this.focusNode,
    required this.maxLength,
    this.keyboardType = TextInputType.text,
    this.isPhone = false,
    required this.validation,
    required this.validText,
    this.maxLines,
    // required this.formKey,
    Key? key,
  }) : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  var maskFormatter = new MaskTextInputFormatter(
      mask: '## ### ## ##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 70,
        child: Stack(children: [
          Container(
              height: 62,
              alignment: Alignment(-0.94, -0.30),
              child: AppText(
                widget.labelText,
                size: 22,
                color: AppColors.blacBlue,
                // fontWeight: FontWeight.w500,
              )),
          TextFormField(
            validator: (text) {
              if (text!.isEmpty) {
                return widget.validText;
              } else if (widget.validation) {
                return widget.validText;
              } else {
                return null;
              }
            },
            inputFormatters: widget.isPhone ? [maskFormatter] : [],
            maxLength: widget.maxLength,
            controller: widget.controller,
            onChanged: widget.onChange,
            maxLines: widget.maxLines,
            keyboardType: widget.keyboardType,
            decoration: InputDecoration(
              label: widget.label,
              labelStyle: widget.labelStyle,
              hintText: widget.hintText,
              hintStyle: widget.hintStyle ??
                  TextStyle(color: AppColors.borderColor, fontSize: 20),
              counter: SizedBox(),
              contentPadding: EdgeInsets.only(
                  left: widget.leftPadding, top: 17, bottom: 15),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                    color: AppColors.red,
                    width: 2,
                  )),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                    color: AppColors.red,
                    width: 2,
                  )),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                    color: AppColors.borderColor,
                    width: 2,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                      color: AppColors.blue3.withAlpha(150), width: 3)),
            ),
            style: TextStyle(
                height: 1, fontSize: 22, decoration: TextDecoration.none),
          ),
        ]));
  }
}
