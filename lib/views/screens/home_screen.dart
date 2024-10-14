import 'package:flutter/material.dart';
import 'package:majd_portfolio/constants/colors.dart';
import 'package:majd_portfolio/constants/size.dart';
import 'package:majd_portfolio/constants/skill_items.dart';
import 'package:majd_portfolio/views/widgets/drawer_mobile.dart';
import 'package:majd_portfolio/views/widgets/header_desktop.dart';
import 'package:majd_portfolio/views/widgets/header_mobile.dart';
import 'package:majd_portfolio/views/widgets/main_mobile.dart';
import 'package:majd_portfolio/views/widgets/skills_desktop.dart';
import 'package:majd_portfolio/views/widgets/skills_mobile.dart';

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

                width: screenWidth,
                color: CustomColors.bgLight1,
                padding: const EdgeInsets.fromLTRB(25,20, 25, 60),
                child:  Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //title
                    const Text('What i can do',style: TextStyle(
fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: CustomColors.whitePrimary,
                    ),),
const SizedBox(height: 50),
                    //platforms and skills
                    if(constraints.maxWidth>=kMedDesktopWidth)
                    const SkillsDesktop()else

                    const SkillsMobile(),
                                   ],
                ),
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
