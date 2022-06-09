import 'package:testapp/controllers/SidebarController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo.png"),
          ),
          DrawerListTile(
            title: "Dashboard",
            svgSrc: "assets/icons/menu_dashbord.svg",
            clicked: context.watch<SidebarController>().position==0?true:false,
            press: () => context.read<SidebarController>().clicked(0),
            iconData: Icons.space_dashboard_outlined,
          ),
          DrawerListTile(
            title: "Medicine",
            svgSrc: "assets/icons/menu_tran.svg",
            clicked: context.watch<SidebarController>().position==1?true:false,
            press: () => context.read<SidebarController>().clicked(1),
            iconData: Icons.local_hospital_outlined,
          ),
          DrawerListTile(
            title: "Customer",
            svgSrc: "assets/icons/menu_task.svg",
            clicked: context.watch<SidebarController>().position==2?true:false,
            press: () => context.read<SidebarController>().clicked(2),
            iconData: Icons.shopping_cart_outlined,
          ),
          DrawerListTile(
            title: "Inventory",
            svgSrc: "assets/icons/menu_doc.svg",
            clicked: context.watch<SidebarController>().position==3?true:false,
            press: () => context.read<SidebarController>().clicked(3),
            iconData: Icons.inventory_2_outlined,
          ),
          DrawerListTile(
            title: "Invoice",
            svgSrc: "assets/icons/menu_store.svg",
            clicked: context.watch<SidebarController>().position==4?true:false,
            press: () => context.read<SidebarController>().clicked(4),
            iconData: Icons.receipt_outlined,
          ),
          DrawerListTile(
            title: "Accounts",
            svgSrc: "assets/icons/account_circle_black_24dp.svg",
            clicked: context.watch<SidebarController>().position==5?true:false,
            press: () => context.read<SidebarController>().clicked(5),
            iconData: Icons.account_circle_outlined,
          ),
          DrawerListTile(
            title: "Settings",
            svgSrc: "assets/icons/menu_setting.svg",
            clicked: context.watch<SidebarController>().position==6?true:false,
            press: () => context.read<SidebarController>().clicked(6),
            iconData: Icons.settings_outlined,
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
    this.clicked = false,
    required this.iconData,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;
  final bool clicked;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: /*SvgPicture.asset(
        svgSrc,
        color: clicked?Colors.blue :Colors.white54,
        height: 16,
      ),*/
        Icon(
          iconData,
          color: clicked?Colors.blue :Colors.white54,
        ),
      title: Text(
        title,
        style: TextStyle(color: clicked ? Colors.blue :Colors.white54),
      ),
    );
  }
}
