import 'package:flutter/material.dart';
import 'package:majd_portfolio/constants/colors.dart';
import 'package:majd_portfolio/constants/size.dart';
import 'package:majd_portfolio/views/widgets/drawer_mobile.dart';
import 'package:majd_portfolio/views/widgets/header_desktop.dart';
import 'package:majd_portfolio/views/widgets/header_mobile.dart';
import 'package:majd_portfolio/views/widgets/main_mobile.dart';

import '../widgets/main_desktop.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return  LayoutBuilder(
      builder: (context,constraints){
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomColors.scaffoldBg,
          endDrawer: constraints.maxWidth>=kMinDesktopWidth?null: const DrawerMobile(),
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              //main
              if(constraints.maxWidth>=kMinDesktopWidth)
              const HeaderDesktop()else
              HeaderMobile(
                onLogoTap: (){},
                onMenuTap: (){
                  scaffoldKey.currentState?.openEndDrawer();
                },
              ),
              //Main Desktop
              if(constraints.maxWidth>=kMinDesktopWidth)
                const MainDesktop()else
              const MainMobile(),

              //SKILLs
              Container(
                height: 500,
                width: double.maxFinite,
                color: Colors.blueGrey,
              ),
              //PROJECTS
              Container(
                height: 500,
                width: double.maxFinite,

              ),
              //CONTACT
              Container(
                height: 500,
                width: double.maxFinite,
                color: Colors.blueGrey,
              ),
              //FOOTER
              Container(
                height: 500,
                width: double.maxFinite,

              ),
            ],
          ),

        );
      }
    );
  }
}
