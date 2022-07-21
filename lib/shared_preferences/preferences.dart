import 'package:shared_preferences/shared_preferences.dart';

class Preferences {

  static late SharedPreferences _prefs;

  // *********************************************
  static bool _ready = false;

  static String _jugador1 = "";
  static String _jugador2 = "";

  static List<String> _intentosCuestionarios1 = ["0", "0", "0", "0", "0", "0", "0", "0", "0", "0"];

  static Future init() async{
    _prefs = await SharedPreferences.getInstance();
  }

  // Obtiene el nombre del Jugador 1
  static String get jugador1 {
    return _prefs.getString("jugador1") ?? _jugador1;
  }

  static set jugador1( String jugador ) {
    _jugador1 = jugador;
    _prefs.setString('jugador1', jugador);
  }

  // Obtiene el nombre del Jugador 2
  static String get jugador2 {
    return _prefs.getString("jugador2") ?? _jugador2;
  }

  static set jugador2( String jugador ) {
    _jugador2 = jugador;
    _prefs.setString('jugador2', jugador);
  }

  // Obtiene el número de intento de cada cuestionario
  static List<String> get intentosCuestionarios1 {
    return _prefs.getStringList("intentosCuestionarios1") ?? _intentosCuestionarios1;
  }

  static set intentosCuestionarios1 ( List<String> lista ){
    _intentosCuestionarios1 = lista;
    _prefs.setStringList("intentosCuestionarios1", lista);
  }

  // Obtiene s esta lista la BD
  static bool get ready {
    return _prefs.getBool('ready') ?? _ready;
  }

  static set ready( bool ready ) {
    _ready = ready;
    _prefs.setBool('ready', ready);
  }
} 