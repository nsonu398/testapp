import 'package:testapp/controllers/MenuController.dart';
import 'package:testapp/controllers/SidebarController.dart';
import 'package:testapp/responsive.dart';
import 'package:testapp/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  DashboardScreen dashboardScreen = new DashboardScreen();
  Scaffold scaffold = new Scaffold();
  List<Widget> _widgets = [];
  List<Widget> getWidgets(){
    if(_widgets.length==0){
      _widgets.add(dashboardScreen);
      _widgets.add(scaffold);
      _widgets.add(scaffold);
      _widgets.add(scaffold);
      _widgets.add(scaffold);
      _widgets.add(scaffold);
      _widgets.add(scaffold);
      _widgets.add(scaffold);
    }
    return _widgets;
  }



  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: getWidgets()[context.watch<SidebarController>().position]
            ),
          ],
        ),
      ),
    );
  }
}
