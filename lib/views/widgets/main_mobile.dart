import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return  Container(
      height: screenHeight,
      constraints: const BoxConstraints(minHeight: 560),
      margin: const EdgeInsets.symmetric(horizontal: 40,vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //avatar image
          ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(colors: [
                CustomColors.scaffoldBg,
                CustomColors.scaffoldBg.withOpacity(0.6),
              ]).createShader(bounds);
            },
            blendMode: BlendMode.srcATop,

            child: Image.asset('assets/images/my_flutter_avatar.png',width: screenWidth,),
          ),
          const SizedBox(height: 30),
          //intro text
          const Text("Hi,\nI'm Majd Mari\nA Flutter Developer",
            style: TextStyle(
              fontSize: 24,
              height: 1.5,
              fontWeight: FontWeight.bold,
              color: CustomColors.whitePrimary,
            ),),
          const SizedBox(height: 15),
          SizedBox(width: 190,
            child: ElevatedButton(onPressed: (){}, child: const Text('Get in touch'),
            ),
          ),

        ],
      ),
    );
  }
}
