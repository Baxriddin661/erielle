import 'dart:async';
import 'package:eriell/presintation/pages/login_registration/login_page.dart';
import 'package:eriell/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:vertical_percent_indicator/vertical_percent_indicator.dart';
import '../widgets/app_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double percent = 2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      setState(() {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.bottomCenter,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            GestureDetector(
              onTap: () {
                MaterialPageRoute(builder: (context) => LoginPage());
              },
              child: Center(
                child: Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Hero(
                    // transitionOnUserGestures: true,
                    tag: 'logo',
                    child: Image.asset(
                      'assets/logo.png',
                      height: 100,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: AppText(
                textAlign: TextAlign.center,
                'Welcome to Eriell mobile application!',
                color: AppColors.primaryColor,
                size: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Transform.rotate(
              angle: 1.57,
              child: VerticalBarIndicator(
                color: [AppColors.primaryColor, AppColors.primaryColor],
                height: 100,
                percent: percent,
              ),
            ),
            Spacer(),

            SizedBox(

            ),
          ],
        ),
      ),
    );
  }
}
