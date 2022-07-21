import 'package:flutter/material.dart';
import 'package:preguntas_incomodas/ads/banner_ad.dart';

class MainLayout extends StatelessWidget {

  final Widget child;
  final bool showAds;

  const MainLayout({
    Key? key,
    required this.child,
    this.showAds = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.0, 0.15, 0.5, 0.8],
          colors: [
          Color.fromRGBO(71, 112, 227, 1),
          Color.fromRGBO(117, 171, 246, 1),
          Color.fromRGBO(74, 114, 228, 1),
          Color.fromRGBO(62, 47, 159, 1)
          ],
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Expanded(child: child),
              showAds ? const BannerAdGoogle() : const SizedBox.shrink()
            ],
          )
        ),
      ),
    );
  }
}