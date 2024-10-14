import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/skill_items.dart';

class SkillsMobile extends StatelessWidget {
  const SkillsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 500
      ),
      child: Column(
        children: [
          //platforms
          for (int i = 0; i < platformItems.length; i++)
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: CustomColors.bLight2,
                borderRadius: BorderRadius.circular(5),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                leading: Image.asset(platformItems[i]['img'],width: 26,),
                title: Text(platformItems[i]['title']),
              ),
      
            ),
          const SizedBox(height: 50),
          //skills
          Wrap(
            spacing: 10,
            runSpacing: 10,
            alignment: WrapAlignment.center,
            children: [
              for (int i = 0; i < skillItems.length; i++)
                Chip(
                  side: const BorderSide(
                    color: CustomColors.bLight2,
                  ),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                  backgroundColor: CustomColors.bLight2,
                  padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 16),
                  label: Text(skillItems[i]['title']),
                  avatar: Image.asset(skillItems[i]['img']),),
            ],
          )
        ],
      ),
    );
  }
}
