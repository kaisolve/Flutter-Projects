import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kreis/presentations/widgets/custom_app_bar/custom_app_bar.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'contact'.tr(), showBackArrow: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: SizedBox(
                width: 196.42,
                height: 150,
                child: Image.asset('assets/images/pngs/contactus.png')),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: TextField(
                decoration: InputDecoration(
              hintText: 'name'.tr(),
              icon: SvgPicture.asset(
                  'assets/images/svgs/person.svg'), //icon at head of input
            )),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
              child: TextField(
                  decoration: InputDecoration(
                hintText: 'email'.tr(),

                icon: SvgPicture.asset(
                    'assets/images/svgs/at.svg'), //icon at head of input
              ))),
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
              child: TextField(
                  decoration: InputDecoration(
                hintText: 'title'.tr(),

                icon: SvgPicture.asset(
                    'assets/images/svgs/mark.svg'), //icon at head of input
              ))),
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
              child: TextField(
                  decoration: InputDecoration(
                hintText: 'message'.tr(),

                icon: SvgPicture.asset(
                    'assets/images/svgs/message.svg'), //icon at head of input
              ))),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: SizedBox(
                width: 341,
                height: 51,
                child:
                    ElevatedButton(onPressed: () {}, child: Text('send'.tr()))),
          )
        ],
      ),
    );
  }
}
