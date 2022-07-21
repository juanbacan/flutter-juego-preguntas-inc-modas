import 'package:hive/hive.dart';
part 'preguntas_model.g.dart';


@HiveType(typeId: 0)
class Pregunta extends HiveObject{
  //final String enunciado;
  //final List<String> respuestas;
  //final int correcta;
  @HiveField(0)
  late String enunciado;
  @HiveField(1)
  late List<String> respuestas;
  @HiveField(2)
  late int correcta;

  //Pregunta(this.enunciado, this.respuestas, this.correcta);
}