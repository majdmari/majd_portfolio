import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/skill_items.dart';

class SkillsDesktop extends StatelessWidget {
  const SkillsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //platforms
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth:450,

          ),
          child: Wrap(
            spacing: 5,
            runSpacing: 5,
            children: [
              for (int i = 0; i < platformItems.length; i++)
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: CustomColors.bLight2,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    leading: Image.asset(platformItems[i]['img'],width: 26,),
                    title:  Text(platformItems[i]['title']),
                  ),
                )
            ],
          ),
        ),
        const SizedBox(width: 50),

        //skills
        Flexible(
          //Flexible when we dont have a space the item be in new line
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 500,
            ),
            child: Wrap(
              spacing: 10,

              runSpacing: 10,
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
            ),
          ),
        )
      ],
    )
    ;
  }
}
