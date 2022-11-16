import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posto_app/router.dart';
// import 'package:posto_app/screens/home.dart';
import 'package:posto_app/screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Posto',
      theme: ThemeData(
        primaryColor: const Color(0xff252c36),
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: GoogleFonts.pacifico(
            color: Colors.black87,
            fontWeight: FontWeight.w200,
          ),
        ),
      ),
      home: LoginScreen(),
      onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }
}
