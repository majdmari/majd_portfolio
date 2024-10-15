import 'package:flutter/material.dart';
import 'package:majd_portfolio/constants/size.dart';
import 'package:majd_portfolio/constants/sns_links.dart';

import '../../constants/colors.dart';
import 'custom_text_field.dart';
import 'dart:js' as js;

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: CustomColors.bgLight1,
      child: Column(
        children: [
          //title
          Text(
            'Get in touch',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: CustomColors.whitePrimary,
            ),
          ),
          const SizedBox(height: 50),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 700,
              maxHeight: 100,
            ),
            child:LayoutBuilder(
                builder: (context,constraints){
                  if (constraints.maxWidth >= kMinDesktopWidth){
return buildNameEmailFieldDesctop();
                  }
                  //else
                  return buildNameEmailFieldMobile();
                },),
          ),
          const SizedBox(height: 15),
          //message
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 700,
            ),
            child: CustomTextField(
              hintText: 'Your Message',
              maxLines: 16,
            ),
          ),
          const SizedBox(height: 20),
          //send button
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 700,
            ),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Get in Touch'),
              ),
            ),
          ),
          const SizedBox(height: 30),
          ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 300,
              ),
              child: const Divider()),
          const SizedBox(height: 15),
          //SNS Icon Button Links
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                    js.context.callMethod('open', [SnsLinks.github]);
                  },
                  child: Image.asset('assets/images/github.png',
                      width: 28)),
              InkWell(
                  onTap: () {
                    js.context.callMethod('open', [SnsLinks.linkedIn]);

                  },
                  child: Image.asset('assets/images/linkedin.png',
                      width: 28)),
              InkWell(
                  onTap: () {
                    js.context.callMethod('open', [SnsLinks.facebook]);

                  },
                  child: Image.asset('assets/images/facebook.png',
                      width: 28)),
              InkWell(
                  onTap: () {
                    js.context.callMethod('open', [SnsLinks.instagram]);

                  },
                  child: Image.asset('assets/images/instagram.png',
                      width: 28)),
              InkWell(
                  onTap: () {
                    js.context.callMethod('open', [SnsLinks.telegram]);

                  },
                  child: Image.asset('assets/images/telegram.png',
                      width: 28)),
            ],
          )
        ],
      ),
    );
  }
  Row buildNameEmailFieldDesctop(){
    return Row(
      children: [
        //name
        Flexible(
          child: CustomTextField(
            hintText: 'Your Name',
          ),
        ),
        const SizedBox(width: 15),
        //email
        Flexible(
          child: CustomTextField(
            hintText: 'Your Email',
          ),
        ),
      ],
    );
  }

  Column buildNameEmailFieldMobile(){
    return Column(
      children: [
        //name
        Flexible(
          child: CustomTextField(
            hintText: 'Your Name',
          ),
        ),
        const SizedBox(height: 15),
        //email
        Flexible(
          child: CustomTextField(
            hintText: 'Your Email',
          ),
        ),
      ],
    );
  }
}
