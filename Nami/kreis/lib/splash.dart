import 'package:flutter/material.dart';
import 'package:kreis/features/home/presentation/widgets/button_bar.dart';
// import 'package:kreis/features/home/presentation/pages/home.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Lottie.asset('assets/videos/splash.json',
          controller: _controller,
          height: MediaQuery.of(context).size.height * 1,
          animate: true, onLoaded: (composition) {
        _controller
          ..duration = composition.duration
          ..forward().whenComplete(() => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              ));
      }),
    );
  }
}
