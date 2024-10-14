import 'package:flutter/material.dart';
import 'package:majd_portfolio/views/widgets/project_card.dart';

import '../../constants/colors.dart';
import '../../utils/project_utils.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return   Container(
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(25, 25, 25, 60),
      child: Column(
        children: [
          //work projects title
          const Text(
            'Work Projects',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColors.whitePrimary,
            ),
          ),
          const SizedBox(height:50 ),
          //hobby projects cards
          ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: 900
            ),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              children: [
                for(int i=0;i<workProjectUtils.length;i++)
                  ProjectCardWidget(project: workProjectUtils[i]),
              ],
            ),
          ),
          const SizedBox(height: 80),
          //hobby projects title
          const Text(
            'Hobby Projects',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColors.whitePrimary,
            ),
          ),
          const SizedBox(height:50 ),
          //work projects cards
          ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: 900
            ),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              children: [
                for(int i=0;i<hobbyProjectUtils.length;i++)
                  ProjectCardWidget(project: hobbyProjectUtils[i]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
