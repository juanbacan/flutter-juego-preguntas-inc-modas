import 'package:flutter/material.dart';
import 'package:preguntas_incomodas/ads/banner_ad.dart';

class MainLayout2 extends StatelessWidget {

  final Widget child;
  final bool showAds;

  const MainLayout2({
    Key? key,
    required this.child,
    this.showAds =  true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0, 0.45, 0.6, 0.8],
          colors: [
          Color.fromARGB(255, 209, 217, 241),
          Color.fromARGB(255, 255, 255, 255),
          Color.fromARGB(255, 255, 255, 255),
          Color.fromARGB(255, 209, 217, 241),
          ],
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Expanded(child: child),
                showAds ? const BannerAdGoogle() : const SizedBox.shrink()
                
              ],
            ),
          )
        ),
      ),
    );
  }
}