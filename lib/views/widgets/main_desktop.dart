import 'package:flutter/material.dart';

import '../../constants/colors.dart';



class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key, required this.onNavItemTap});
  final Function(int) onNavItemTap;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return  Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: screenHeight / 1.2,
      constraints: const BoxConstraints(minHeight: 350),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Hi,\nI'm Majd Mari\nA Flutter Developer",
                style: TextStyle(
                  fontSize: 30,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                  color: CustomColors.whitePrimary,
                ),),
              const SizedBox(height: 15),
              SizedBox(width: 250,
                  child: ElevatedButton(onPressed: (){
                    onNavItemTap(3);
                  }, child: const Text('Get in touch'),)),
            ],
          ),
          Image.asset('assets/images/my_flutter_avatar.png',width: screenWidth/2.5,)
        ],
      ),
    );
  }
}
