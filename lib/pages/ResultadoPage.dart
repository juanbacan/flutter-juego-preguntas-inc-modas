import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:preguntas_incomodas/ad_helper.dart';
import 'package:preguntas_incomodas/layout/main_layout2.dart';
import 'package:preguntas_incomodas/providers/info_provider.dart';
import 'package:provider/provider.dart';

import '../shared_preferences/preferences.dart';

class ResultadoPage extends StatefulWidget {
  const ResultadoPage({Key? key}) : super(key: key);

  @override
  State<ResultadoPage> createState() => _ResultadoPageState();
}

class _ResultadoPageState extends State<ResultadoPage> {

  // Publicidad *******************************
  InterstitialAd? _interstitialAd;
  int _numInterstitialLoadAttempts = 2;
  int maxFailedLoadAttempts = 3;
  // ******************************************

  @override
  void dispose() {
    super.dispose();
    _interstitialAd?.dispose();
  }

  @override
  void initState() {
    
    final infoProvider = Provider.of<InfoProvider>(context, listen: false);
    final intentos = infoProvider.intentosCuestionarios1;
    intentos[infoProvider.updateQuestionary] = (int.parse(intentos[infoProvider.updateQuestionary]) + 1).toString();
    Preferences.intentosCuestionarios1 = intentos;
    infoProvider.intentosCuestionarios1 = intentos;

    _createInterstitialAd();    // Publicidad  
    super.initState();
  }

  void _createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
          _numInterstitialLoadAttempts = 0;
          _interstitialAd!.setImmersiveMode(true);
        },
        onAdFailedToLoad: (LoadAdError error) {
          _numInterstitialLoadAttempts += 1;
          _interstitialAd = null;
          if (_numInterstitialLoadAttempts <= maxFailedLoadAttempts) {
            _createInterstitialAd();
          }
        },
        
      )
    );
  }

  void _showInterstitialAd() {
    if (_interstitialAd == null) {
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) => {},

      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        ad.dispose();
        _createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        ad.dispose();
        _createInterstitialAd();
      },
    );
    _interstitialAd!.show();
    _interstitialAd = null;
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout2(
      child: SafeArea(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){_showInterstitialAd();}, child: Text("Mostrar"))
          ],
        )
      )
    );
  }
}