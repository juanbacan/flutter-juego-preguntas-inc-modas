import 'dart:io';

class AdHelper {

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      //return "ca-app-pub-3940256099942544/6300978111";
      return "ca-app-pub-4779141162178342/3207317928";
    } else if (Platform.isIOS) {
      return "ca-app-pub-4779141162178342/3207317928";
      //return "ca-app-pub-3940256099942544/6300978111";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      //return "ca-app-pub-3940256099942544/1033173712";
      return "ca-app-pub-4779141162178342/3015746233";
    } else if (Platform.isIOS) {
      return "ca-app-pub-4779141162178342/3015746233";
      //return "ca-app-pub-3940256099942544/1033173712";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

}