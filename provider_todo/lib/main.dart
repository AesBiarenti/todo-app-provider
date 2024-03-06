import 'package:bolum_30_provider_todo/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.deepPurple.shade100,
        appBarTheme: AppBarTheme(
          shadowColor: Colors.black,
          backgroundColor: Colors.deepPurple.shade300,
          centerTitle: true,
          titleTextStyle: GoogleFonts.viga(
              fontSize: 30,
              color: Colors.deepPurple.shade50,
              fontWeight: FontWeight.w700),
        ),
        textTheme: TextTheme(
          bodyMedium: GoogleFonts.viga(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: const MaterialStatePropertyAll(Colors.white),
            textStyle: MaterialStatePropertyAll(
              GoogleFonts.viga(fontWeight: FontWeight.w600),
            ),
          ),
        ),
        listTileTheme: ListTileThemeData(
          titleTextStyle: GoogleFonts.viga(
            fontWeight: FontWeight.w600,
            color: Colors.deepPurple.shade50,
          ),
          subtitleTextStyle: GoogleFonts.viga(
            fontWeight: FontWeight.w600,
            color: Colors.deepPurple.shade50,
          ),
          leadingAndTrailingTextStyle: GoogleFonts.viga(
            fontWeight: FontWeight.w600,
            color: Colors.deepPurple.shade50,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
