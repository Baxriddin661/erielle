import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/app_colors.dart';
import 'app_text.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../utils/app_colors.dart';
import 'app_text.dart';

class PasswordTextField extends StatefulWidget {
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

  PasswordTextField({
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
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  var maskFormatter = new MaskTextInputFormatter(
      mask: '## ### ## ##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _obscureText = !_obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 70,
        child: Stack(children: [
          Container(
              height: 62,
              alignment: Alignment(-0.94, -0.39),
              child: AppText(
                widget.labelText,
                size: 18,
                color: AppColors.blacBlue,
                fontWeight: FontWeight.w500,
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
              obscuringCharacter: '*',
              obscureText: _obscureText,
              keyboardType: TextInputType.visiblePassword,
              style: TextStyle(fontSize: 22, decoration: TextDecoration.none),
              decoration: InputDecoration(
                hintText: widget.hintText,
                  hintStyle: TextStyle(color: AppColors.borderColor, fontSize: 22),
                counterText: '',
                contentPadding: EdgeInsets.only(
                    left: widget.leftPadding, top: 10, bottom: 15),
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
                suffixIcon: GestureDetector(
                  onTap: _togglePasswordVisibility,
                  child: Container(
                    height: 15,
                    width: 15,
                    padding: const EdgeInsets.all(10),
                    child: SvgPicture.asset(
                      'assets/icon/${_obscureText ? 'eye' : 'eye_off'}.svg',
                      color: AppColors.blacBlue3,
                      width: 15,
                      height: 15,
                    ),
                  ),
                ),
              )),
        ]));
  }
}

