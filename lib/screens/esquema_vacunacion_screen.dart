import 'package:esquema_vacunacion_app/services/sqliteDb.dart';
import 'package:flutter/material.dart';
import 'package:esquema_vacunacion_app/models/vacuna.dart';

class EsquemaVacunacionScreen extends StatefulWidget {
  @override
  State<EsquemaVacunacionScreen> createState() => _EsquemaVacunacionScreenState();
}

class _EsquemaVacunacionScreenState extends State<EsquemaVacunacionScreen> {
  late Future<List<Vacuna>> _vacunasFuture;

  @override
  void initState() {
    super.initState();
    // Asegurarse de que la BD ya tenga las vacunas insertadas.
    _vacunasFuture = VacunaDatabase().getVacunas();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Esquema de Vacunación en Cuba'),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildIntroduction(),
            Expanded(child: _buildVacunasTable()),
          ],
        ),
      ),
    );
  }

  /// Introducción sobre el esquema de vacunación
  Widget _buildIntroduction() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "📌 Esquema oficial de vacunación en la República de Cuba",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          SizedBox(height: 8),
          Text(
            "En Cuba se aplican actualmente 11 vacunas, de ellas 8 son inactivadas (muertas) y 3 son atenuadas (vivas)."
            " El esquema de vacunación está diseñado para garantizar la inmunización contra diversas enfermedades "
            "desde los primeros días de vida hasta la adultez.",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 12),
          Text(
            "📌 Clasificación de las vacunas en Cuba:",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          _buildBulletPoint("✅ Vacunas muertas: DPT, DT, TT, AM-BC, AT, HB, Hib, Pentavalente."),
          _buildBulletPoint("✅ Vacunas vivas: BCG, OPV, PRS."),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  /// Tabla con las vacunas obtenidas de la base de datos
  Widget _buildVacunasTable() {
    return FutureBuilder<List<Vacuna>>(
      future: _vacunasFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No hay vacunas disponibles'));
        } else {
          List<Vacuna> vacunas = snapshot.data!;
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                border: TableBorder.all(),
                headingRowColor: MaterialStateProperty.all(Colors.green.shade200),
                columns: const [
                  DataColumn(label: Text('Vacuna', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Clasificación', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Dosis', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Fechas de Aplicación', style: TextStyle(fontWeight: FontWeight.bold))),
                ],
                rows: vacunas.map((vacuna) {
                  String fechas = vacuna.fechasAplicacion.join(', ');
                  return DataRow(cells: [
                    DataCell(Text(vacuna.nombre)),
                    DataCell(Text(vacuna.clasificacion)),
                    DataCell(Text(vacuna.cantidadDosis.toString())),
                    DataCell(Text(fechas)),
                  ]);
                }).toList(),
              ),
            ),
          );
        }
      },
    );
  }

  /// Método auxiliar para mostrar viñetas
  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("• ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Expanded(child: Text(text, style: TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
