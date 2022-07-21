import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:preguntas_incomodas/models/preguntas_model.dart';
import 'package:preguntas_incomodas/pages/HomePage.dart';
import 'package:preguntas_incomodas/providers/info_provider.dart';
import 'package:preguntas_incomodas/shared_preferences/preferences.dart';
import 'package:preguntas_incomodas/utils/my_colors.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  // Preferencias de Usuario
  await Preferences.init();

  // Base de Datos de Preguntas
  await Hive.initFlutter();

  // flutter packages pub run build_runner build
  Hive.registerAdapter(PreguntaAdapter());
  await Hive.openBox<Pregunta>('preguntas');

  // Admob Google
  MobileAds.instance.initialize();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ( _ ) => InfoProvider(
            player1: Preferences.jugador1, 
            player2: Preferences.jugador2,
            intentosCuestionariosList: Preferences.intentosCuestionarios1
          )
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '¿En verdad me conoces?',
        theme: ThemeData(
          primaryColor: const Color.fromRGBO(79, 131, 234, 1),
          primarySwatch: Colors.blue,
          fontFamily: 'SecularOne',
          textTheme: TextTheme(
            headline1: const TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white, height: 1, letterSpacing: -1, fontFamily: "Coiny"),
            headline3: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white, height: 1, letterSpacing: -1, fontFamily: "Coiny"),
            headline2: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: MyColors.secondary, height: 1, letterSpacing: -1.5, fontFamily: "Coiny"),
            headline5: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            headline6: TextStyle(color: MyColors.secondary, fontWeight: FontWeight.bold),
            bodyText2: const TextStyle(fontSize: 18),
          )
        ),
        home: const HomePage(),
      ),
    );
  }
}

