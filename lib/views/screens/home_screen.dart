import 'package:flutter/material.dart';
import 'package:majd_portfolio/constants/size.dart';
import 'package:majd_portfolio/constants/sns_links.dart';
import 'package:majd_portfolio/utils/project_utils.dart';
import 'package:majd_portfolio/views/widgets/contact_section.dart';
import 'package:majd_portfolio/views/widgets/custom_text_field.dart';
import 'package:majd_portfolio/views/widgets/footer.dart';
import 'package:majd_portfolio/views/widgets/header_desktop.dart';
import 'package:majd_portfolio/views/widgets/main_mobile.dart';

import '../../constants/colors.dart';
import '../widgets/drawer_mobile.dart';
import '../widgets/header_mobile.dart';
import '../widgets/main_desktop.dart';
import '../widgets/project_card.dart';
import '../widgets/project_section.dart';
import '../widgets/skills_desktop.dart';
import '../widgets/skills_mobile.dart';
import 'dart:js' as js;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navBarKeys = List.generate(4, (index) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: scaffoldKey,
        backgroundColor: CustomColors.scaffoldBg,
        endDrawer: constraints.maxWidth >= kMinDesktopWidth
            ? null
            : DrawerMobile(
                onNavItemTap: (int navIndex) {
                  //call funcation
                  scaffoldKey.currentState?.closeEndDrawer();
                  scrollToSection(navIndex);
                },
              ),
        body: SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                key: navBarKeys.first,
              ),
              // main
              if (constraints.maxWidth >= kMinDesktopWidth)
                HeaderDesktop(
                  onNavMenuTap: (int navIndex) {
                    //call funcation
                    scrollToSection(navIndex);

                  },
                )
              else
                HeaderMobile(
                  onLogoTap: () {},
                  onMenuTap: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                ),
              //Main Desktop
              if (constraints.maxWidth >= kMinDesktopWidth)
                const MainDesktop()
              else
                const MainMobile(),

              //SKILLs
              Container(
                key: navBarKeys[1],
                width: screenWidth,
                color: CustomColors.bgLight1,
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //title
                    const Text(
                      'What i can do',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: CustomColors.whitePrimary,
                      ),
                    ),
                    const SizedBox(height: 50),
                    //platforms and skills
                    if (constraints.maxWidth >= kMedDesktopWidth)
                      const SkillsDesktop()
                    else
                      const SkillsMobile(),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              //PROJECTS
              ProjectsSection(
                key: navBarKeys[2],
              ),
              const SizedBox(height: 30),

              //CONTACT
              ContactSection(
                key: navBarKeys[3],
              ),
              //FOOTER
              const Footer(),
            ],
          ),
        ),
      );
    });
  }

  void scrollToSection(int navIndex) {
    if (navIndex == 4) {
      //open a blog page
      js.context.callMethod('open', [SnsLinks.github]);
      return;
    }
    final key = navBarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(
        milliseconds: 500,
      ),
      curve: Curves.easeInOut,
    );
  }
}
