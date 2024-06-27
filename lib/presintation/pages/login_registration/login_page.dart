import 'package:eriell/presintation/pages/dashboard/dashboard.dart';
import 'package:eriell/presintation/pages/login_registration/registration_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../../../utils/app_colors.dart';
import '../../widgets/app_text.dart';
import '../../widgets/app_textfield.dart';
import '../../widgets/main_button.dart';
import '../../widgets/password_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController phoneController = TextEditingController();

  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
    return OrientationBuilder(builder: (context, orientation) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Hero(
                    tag: 'logo',
                    child: Image.asset(
                      'assets/logo.png',
                      height: 80,
                      scale: 4,
                    ),
                  ),
                ),
                Positioned(
                  top: 220,
                  left: 20,
                  right: 20,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    height: 400,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black54,
                              offset: Offset(2, 4),
                              blurRadius: 6)
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: AppText(
                            textAlign: TextAlign.center,
                            'Login',
                            size: 30,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AppText(
                          'user name',
                          size: 20,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w700,
                        ),
                        AppTextField(
                            controller: loginController,
                            maxLength: 20,
                            validation: true,
                            validText: 'validText'),
                        AppText(
                          'password',
                          size: 20,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w700,
                        ),
                        PasswordTextField(
                            controller: passwordController,
                            maxLength: 16,
                            validation: true,
                            validText: 'validText'),
                        SizedBox(
                          height: 20,
                        ),
                        MainButton(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Dashboard()));
                          },
                          color: AppColors.primaryColor,
                          title: 'Login',
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  right: 20,
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistrationPage()));
                        loginController.clear();
                        passwordController.clear();
                      },
                      child: AppText(
                        'Registration',
                        color: AppColors.primaryColor,
                        size: 18,
                      )),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
