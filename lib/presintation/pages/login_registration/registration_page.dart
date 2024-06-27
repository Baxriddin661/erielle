import 'dart:io';

import 'package:eriell/presintation/pages/login_registration/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/app_colors.dart';
import '../../widgets/app_text.dart';
import '../../../utils/app_text_style.dart';
import '../../widgets/app_textfield.dart';
import '../../widgets/main_button.dart';
import '../../widgets/password_textfield.dart';
import '../dashboard/dashboard.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final name = TextEditingController();
  final lastName = TextEditingController();
  final phone = TextEditingController();
  final telegram = TextEditingController();
  final group = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ;

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        title: AppText(
          'Registration',
          size: 25,
          color: AppColors.white3,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.primaryColor,
          margin: EdgeInsets.only(top: 50),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all( Radius.circular(20))),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        SizedBox(
                          height: 26,
                        ),
                        AppTextField(
                          validation: name.text.length < 3,
                          onChange: (val) {
                            setState(() {});
                          },
                          validText: 'Name',
                          hintText: 'Name',
                          controller: name,
                          maxLength: 20,
                        ),
                        AppTextField(
                          validation: lastName.text.length < 3,
                          validText: 'Last name',
                          hintText: 'Last name',
                          controller: lastName,
                          maxLength: 20,
                          onChange: (val) {
                            setState(() {});
                          },
                        ),
                        AppTextField(
                          validation: phone.text.length < 12,
                          validText: 'Telefon nemeringizni to`liq kiriting!',
                          // formKey: formKey,
                          labelText: '+998',
                          controller: phone,
                          hintText: '00 123 45 67',
                          leftPadding: 65,
                          onChange: (val) {
                            setState(() {});
                          },
                          keyboardType: TextInputType.phone,
                          maxLength: 12,
                          isPhone: true,
                        ),
                        AppTextField(
                          validation: true,
                          validText: 'O`xshadi',
                          labelText: '@',
                          leftPadding: 29,
                          hintText: 'Telegram user name',
                          controller: telegram,
                          maxLength: 26,
                        ),
                        PasswordTextField(
                          controller: password,
                          maxLength: 16,
                          validation: true,
                          validText: 'validText',
                          hintText: 'Password',
                        ),
                        PasswordTextField(
                          controller: confirmPassword,
                          maxLength: 16,
                          validation: true,
                          validText: 'validText',
                          hintText: 'Confirm password',
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                    alignment: Alignment.bottomCenter,
                    child: MainButton(
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));

                        setState(() {});
                      },
                      title: 'Save',
                      isMain: true,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
