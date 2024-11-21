import 'package:d_11_genrator_app/Utils/colors.dart';
import 'package:d_11_genrator_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Genrrartor App',
        theme: ThemeData(
          scaffoldBackgroundColor: bgcolor,
          appBarTheme: AppBarTheme(
            backgroundColor: appbarcolor,
            titleTextStyle: const TextStyle(color: Colors.white),
            
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
           style: ElevatedButton.styleFrom(backgroundColor: btncolor,textStyle: const TextStyle(color: Colors.white))
          )
        ),
        home: const LoginScreen());
  }
}
