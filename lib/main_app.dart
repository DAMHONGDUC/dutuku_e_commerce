import 'package:dutuku_e_commerce/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:system_design_flutter/index.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SdScreenUtil(
      child: MaterialApp.router(
        theme: ThemeData(textTheme: GoogleFonts.latoTextTheme()),
        routerConfig: kAppRouter,
        debugShowCheckedModeBanner: false,
        title: 'GoRouter Demo',
      ),
    );
  }
}
