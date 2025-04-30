import 'dart:convert';

import 'package:esquema_vacunacion_app/models/vacuna.dart';

List<Vacuna> getListaVacunasDesdeJson() {
  String jsonString = ''' {
  "results":[
  {
    "clasificacion": "Muerta",
    "nombre": "Hepatitis B",
    "descripcion": "Vacuna contra la hepatitis B, primera vacuna que se aplica a todos los niños.",
    "paraQueEs": "Protege contra la hepatitis B.",
    "efectosSecundarios": "No tiene,No tiene",
    "reaccionesAdversas": "No tiene,No tiene",
    "cantidadDosis": 4,
    "fechasAplicacion": [
      "al nacer",
      "1 mes",
      "2 meses",
      "1 año"
    ]
  },
  {
    "clasificacion": "Viva",
    "nombre": "BCG",
    "descripcion": "Vacuna contra la tuberculosis aplicada al nacer.",
    "paraQueEs": "Protección contra tuberculosis.",
    "efectosSecundarios": "No tiene,No tiene,No tiene,No tiene",
    "reaccionesAdversas": "No tiene,No tiene,No tiene,No tiene",
    "cantidadDosis": 1,
    "fechasAplicacion": ["al nacer"]
  },
  {
    "clasificacion": "Muerta",
    "nombre": "Pentavalente",
    "descripcion": "Combina DPT (difteria, tosferina, tétanos), Hepatitis B y Haemophilus influenzae tipo B.",
    "paraQueEs": "Protege contra 5 enfermedades.",
    "efectosSecundarios": "No tiene,No tiene",
    "reaccionesAdversas": "No tiene,No tiene",
    "cantidadDosis": 3,
    "fechasAplicacion": [
      "2 meses",
      "4 meses",
      "6 meses"
    ]
  },
  {
    "clasificacion": "Muerta",
    "nombre": "Antimeningocócica",
    "descripcion": "Vacuna contra meningococo aplicada en dos dosis.",
    "paraQueEs": "Protección contra meningococo.",
    "efectosSecundarios": "No tiene,No tiene",
    "reaccionesAdversas": "No tiene,No tiene",
    "cantidadDosis": 2,
    "fechasAplicacion": [
      "3 meses",
      "5 meses"
    ]
  },
  {
    "clasificacion": "Viva",
    "nombre": "PRS",
    "descripcion": "Vacuna triple viral contra parotiditis, rubéola y sarampión.",
    "paraQueEs": "Protección contra parotiditis, rubéola y sarampión.",
    "efectosSecundarios": "No tiene,No tiene",
    "reaccionesAdversas": "No tiene,No tiene",
    "cantidadDosis": 2,
    "fechasAplicacion": [
      "1 año",
      "6 años"
    ]
  },
  {
    "clasificacion": "Muerta",
    "nombre": "DT",
    "descripcion": "Vacuna contra difteria y tétanos, aplicada en una reactivación.",
    "paraQueEs": "Protección contra difteria y tétanos.",
    "efectosSecundarios": "No tiene,No tiene",
    "reaccionesAdversas": "No tiene,No tiene",
    "cantidadDosis": 1,
    "fechasAplicacion": [
      "6 años"
    ]
  },
  {
    "clasificacion": "Muerta",
    "nombre": "AT (vi)",
    "descripcion": "Vacuna contra fiebre tifoidea aplicada en tres dosis.",
    "paraQueEs": "Protección contra fiebre tifoidea.",
    "efectosSecundarios": "No tiene,No tiene",
    "reaccionesAdversas": "No tiene,No tiene",
    "cantidadDosis": 3,
    "fechasAplicacion": [
      "10 años",
      "13 años",
      "16 años"
    ]
  },
  {
    "clasificacion": "Muerta",
    "nombre": "TT",
    "descripcion": "Vacuna contra el tétanos aplicada en varias dosis y reactivaciones.",
    "paraQueEs": "Protección contra el tétanos.",
    "efectosSecundarios": "No tiene,No tiene",
    "reaccionesAdversas": "No tiene,No tiene",
    "cantidadDosis": 7,
    "fechasAplicacion": [
      "2 meses",
      "4 meses",
      "6 meses",
      "18 meses",
      "6 años",
      "14 años",
      "cada 10 años después de los 25"
    ]
  },
  {
    "clasificacion": "Viva",
    "nombre": "OPV",
    "descripcion": "Vacuna oral contra la poliomielitis.",
    "paraQueEs": "Protección contra la poliomielitis.",
    "efectosSecundarios": "No tiene,No tiene",
    "reaccionesAdversas": "No tiene,No tiene",
    "cantidadDosis": 2,
    "fechasAplicacion":[
      "Febrero",
      "Abril"
    ]
  },
  {
      "clasificacion": "Muerta",
      "nombre": "Neumococo",
      "descripcion": "Protege contra infecciones por neumococo.",
      "paraQueEs": "Prevención de neumonía y meningitis.",
      "efectosSecundarios": "Dolor en la zona de aplicación, Fiebre",
      "reaccionesAdversas": "Reacción alérgica rara",
      "cantidadDosis": 3,
      "fechasAplicacion": ["2 meses", "4 meses", "12 meses"]
    },
    {
      "clasificacion": "Muerta",
      "nombre": "Haemophilus influenzae tipo B (Hib)",
      "descripcion": "Protege contra infecciones por Haemophilus influenzae tipo B.",
      "paraQueEs": "Prevención de meningitis bacteriana.",
      "efectosSecundarios": "Fiebre, Irritabilidad",
      "reaccionesAdversas": "No tiene",
      "cantidadDosis": 3,
      "fechasAplicacion": [
      "2 meses",
      "4 meses",
      "6 meses"]
    },
    {
      "clasificacion": "Muerta",
      "nombre": "VPH",
      "descripcion": "Vacuna contra el virus del papiloma humano.",
      "paraQueEs": "Prevención del cáncer cervical.",
      "efectosSecundarios": "Dolor en la zona de aplicación, Fiebre",
      "reaccionesAdversas": "Desmayo (raro)",
      "cantidadDosis": 2,
      "fechasAplicacion": [
      "9 años",
      "11 años"]
    }
]

}''';

  var jsonData = json.decode(jsonString);
  return ListVacuna.fromMap(jsonData).results;
}
