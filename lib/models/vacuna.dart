import 'dart:convert';

class ListVacuna {
  final List<Vacuna> results;

  ListVacuna({required this.results});

  factory ListVacuna.fromJson(String str) => ListVacuna.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListVacuna.fromMap(Map<String, dynamic> json) => ListVacuna(
        results: List<Vacuna>.from(json["results"].map((x) => Vacuna.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
      };
}

class Vacuna {
  final String clasificacion;
  final String nombre;
  final String descripcion;
  final String paraQueEs;
  final String efectosSecundarios;
  final String reaccionesAdversas;
  final int cantidadDosis;
  final List<String> fechasAplicacion;

  Vacuna({
    required this.clasificacion,
    required this.nombre,
    required this.descripcion,
    required this.paraQueEs,
    required this.efectosSecundarios,
    required this.reaccionesAdversas,
    required this.cantidadDosis,
    required this.fechasAplicacion,
  });

  factory Vacuna.fromJson(String str) => Vacuna.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Vacuna.fromMap(Map<String, dynamic> json) => Vacuna(
        clasificacion: json["clasificacion"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        paraQueEs: json["paraQueEs"],
        efectosSecundarios: json["efectosSecundarios"],
        reaccionesAdversas: json["reaccionesAdversas"],
        cantidadDosis: json["cantidadDosis"],
        fechasAplicacion: _parseFechas(json["fechasAplicacion"]),
      );

  Map<String, dynamic> toMap() => {
        "clasificacion": clasificacion,
        "nombre": nombre,
        "descripcion": descripcion,
        "paraQueEs": paraQueEs,
        "efectosSecundarios": efectosSecundarios,
        "reaccionesAdversas": reaccionesAdversas,
        "cantidadDosis": cantidadDosis,
        "fechasAplicacion": jsonEncode(fechasAplicacion),
      };

  /// Método para manejar correctamente la conversión de fechas
  static List<String> _parseFechas(dynamic value) {
    if (value is List) {
      return List<String>.from(value);
    } else if (value is String) {
      try {
        return List<String>.from(jsonDecode(value));
      } catch (_) {
        return value.split(',').map((e) => e.trim()).toList();
      }
    }
    return [];
  }
}
