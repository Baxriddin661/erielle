import 'package:eriell/presintation/pages/login_registration/login_page.dart';
import 'package:eriell/presintation/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        color: Colors.white,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home:
            // LoginOrSignUpPage()
            // LoginPage()
        // OnboardingPage(),
        SplashScreen()
        // OnBoardingPage()

        // Dashboard()
        // NewsPage()

        );
  }
}
