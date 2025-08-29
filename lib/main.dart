import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 923),
      builder: (context, child) {
        return MaterialApp(
          title: 'Pokedex',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.dark(
              surface: Colors.grey.shade900,
            ),
            textTheme: GoogleFonts.latoTextTheme(),
          ),
          home: HomePage(),
        );
      },
    );
  }
}
