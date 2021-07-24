import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perfil_page/config.dart';
import 'package:perfil_page/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeChanger>(
          create: (_) => ThemeChanger(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool darkThemeEnabled = Provider.of<ThemeChanger>(context).isDark();

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.orange,
        accentColor: Colors.grey[800],
        textTheme: TextTheme(
          headline1: GoogleFonts.nunitoSans(
            textStyle: TextStyle(
              color: Colors.grey,
            ),
          ),
          headline3: GoogleFonts.nunitoSans(
            textStyle: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
          headline6: GoogleFonts.nunitoSans(
            textStyle: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
        accentColor: Colors.grey,
        textTheme: TextTheme(
          headline1: GoogleFonts.nunitoSans(
            textStyle: TextStyle(
              color: Colors.white,
            ),
          ),
          headline3: GoogleFonts.nunitoSans(
            textStyle: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          headline6: GoogleFonts.nunitoSans(
            textStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      themeMode: darkThemeEnabled ? ThemeMode.dark : ThemeMode.light,
      home: HomePage(),
    );
  }
}
