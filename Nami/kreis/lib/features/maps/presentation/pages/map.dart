import 'package:flutter/material.dart';
import 'package:kreis/features/home/presentation/widgets/app_bar.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Appbar(
        page: 'sites',
        arrow: false,
      ),
    );
  }
}
