import 'package:testapp/constants.dart';
import 'package:testapp/controllers/DashboardController.dart';
import 'package:testapp/controllers/MedicineController.dart';
import 'package:testapp/controllers/MenuController.dart';
import 'package:testapp/controllers/SharedPrefController.dart';
import 'package:testapp/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'controllers/SidebarController.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Admin Panel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuController(),
          ),
          ChangeNotifierProvider(
              create: (context) => SidebarController(),
          ),
          ChangeNotifierProvider(create: (context) => DashboardController()),
          ChangeNotifierProvider(create: (create) => SharedPrefController()),
          ChangeNotifierProvider(create: (create) => MedicineController()),
        ],
        child: MainScreen(),
      ),
    );
  }
}
