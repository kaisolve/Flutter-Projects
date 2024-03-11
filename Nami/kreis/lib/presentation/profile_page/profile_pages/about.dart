import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        // appBar: CustomAppbar(page: 'about'.tr(), arrow: true),
        // body: Column(
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
        //       child: SizedBox(
        //         width: 134.73,
        //         height: 120.21,
        //         child: Image.asset('assets/images/pngs/circle.png'),
        //       ),
        //     ),
        //     Row(
        //       children: [
        //         // Padding(
        //         // padding: const EdgeInsets.fromLTRB),
        //         Padding(
        //           padding: const EdgeInsets.all(16),
        //           child: SvgPicture.asset('assets/images/svgs/who.svg'),
        //         ),

        //         Text('who'.tr()),
        //       ],
        //     ),
        //     FutureBuilder(
        //       future: client
        //           .getData('https://ecommerce.project-nami.xyz/api/setting'),
        //       builder: (context, snapshot) {
        //         if (snapshot.connectionState == ConnectionState.done) {
        //           return Text(client.jsonlist['about_us']);
        //         } else if (snapshot.hasError) {
        //           return Text('Error: ${snapshot.error}');
        //         } else {
        //           return const CircularProgressIndicator();
        //         }
        //       },
        //     )
        //   ],
        // )
        );
  }
}
