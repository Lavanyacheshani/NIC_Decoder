import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NIC Decoder',
      initialRoute: '/',
      getPages: AppRoutes.routes,
      theme: ThemeData(
        primaryColor: Color(0xFF004BA0), 
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: Color(0xFFFFC107)), 
        scaffoldBackgroundColor: Color(0xFFF1F1F1), 
        textTheme: TextTheme(
          headlineLarge: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF004BA0)),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF004BA0), 
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
          iconTheme: IconThemeData(color: Colors.white), 
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Color(0xFFFFC107), 
          textTheme: ButtonTextTheme.primary,
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xFF004BA0)),
          ),
        ),
      ),
    );
  }
}
