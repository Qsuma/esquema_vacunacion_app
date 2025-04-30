import 'package:flutter/material.dart';

class ClasificacionVacunas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clasificación de las Vacunas"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("Clasificación de las Vacunas"),
            _buildParagraph(
                "En la actualidad, las vacunas se clasifican en dos grupos principales:"),
            _buildBulletPoint("✅ Vivas atenuadas (también llamadas replicativas)."),
            _buildBulletPoint("✅ Muertas."),

            SizedBox(height: 16),
            _buildSectionTitle("📌 Vacunas Vivas Atenuadas"),
            _buildBulletPoint("🔹 Bacterianas: Ejemplo → BCG."),
            _buildBulletPoint("🔹 Virales: Ejemplo → Parotiditis, rubéola, sarampión, fiebre amarilla."),

            SizedBox(height: 16),
            _buildSectionTitle("📌 Vacunas Muertas"),
            _buildBulletPoint("🔹 De células enteras:"),
            _buildIndentedBulletPoint("• Virales: Ejemplo → Polio, Influenza."),
            _buildIndentedBulletPoint("• Bacterianas: Ejemplo → Tosferina, Fiebre tifoidea."),

            _buildBulletPoint("🔹 De fracciones:"),
            _buildIndentedBulletPoint("• Subunidades: Ejemplo → Hepatitis B, VPH."),
            _buildIndentedBulletPoint("• Toxoides: Ejemplo → Diftérico y Tetánico."),
            _buildIndentedBulletPoint("• Polisacáridos:"),
            _buildIndentedBulletPoint("  ◦ Puros: Ejemplo → Neumococo, Meningococo."),
            _buildIndentedBulletPoint("  ◦ Conjugados: Ejemplo → Hib, Streptococcus pneumoniae."),

            SizedBox(height: 16),
            _buildSectionTitle("📌 Diferencias entre vacunas vivas atenuadas y muertas"),
            _buildTable(),
             _buildSectionTitle("📌 Concepto de Cadena de Frío"),
            _buildParagraph(
                "La cadena de frío es el proceso dinámico de conservación, almacenamiento, transportación y distribución de las vacunas desde su origen hasta el centro de salud donde serán aplicadas."),
            _buildBulletPoint("✅ Objetivo: Garantizar que las vacunas mantengan su alta calidad."),

            SizedBox(height: 16),
            _buildSectionTitle("📌 Termoestabilidad de las Vacunas"),
            _buildParagraph("Todas las vacunas son sensibles al calor, pero en diferente intensidad:"),
            _buildBulletPoint("🌡 Las vacunas vivas son más sensibles y requieren mayor cuidado."),
            _buildBulletPoint("❄ Las vacunas muertas son menos sensibles al calor."),

            SizedBox(height: 16),
            _buildSectionTitle("📌 Reglas Generales de Almacenamiento"),
            _buildBulletPoint("✅ Vacunas vivas: Se deben conservar congeladas entre -10 °C y -20 °C por largos períodos."),
            _buildBulletPoint("✅ Vacunas muertas: Se pueden almacenar entre 4 °C y 8 °C."),

            SizedBox(height: 16),
            _buildSectionTitle("📌 Excepción"),
            _buildParagraph(
                "Las vacunas vivas pueden almacenarse entre 4 °C y 8 °C en refrigeradores de centros de salud por hasta 3 a 4 meses, sin perder potencia."),
          
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
    );
  }

  Widget _buildParagraph(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Text(text, style: TextStyle(fontSize: 16)),
    );
  }

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

  Widget _buildIndentedBulletPoint(String text) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0, top: 4.0),
      child: _buildBulletPoint(text),
    );
  }

  Widget _buildTable() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Table(
        border: TableBorder.all(color: Colors.grey),
        columnWidths: {
          0: FlexColumnWidth(2),
          1: FlexColumnWidth(2),
          2: FlexColumnWidth(2),
        },
        children: [
          _buildTableRow(["Característica", "Vacunas Vivas Atenuadas", "Vacunas Muertas"],
              isHeader: true),
          _buildTableRow(["Cantidad de antígeno", "Pequeña (se replica)", "Grande"]),
          _buildTableRow(["Dosis", "Una sola", "2-3 más reactivaciones"]),
          _buildTableRow(["Reactivaciones", "No necesarias", "Sí necesarias"]),
        ],
      ),
    );
  }

  TableRow _buildTableRow(List<String> cells, {bool isHeader = false}) {
    return TableRow(
      decoration: isHeader ? BoxDecoration(color: Colors.blue.shade100) : null,
      children: cells.map((cell) {
        return Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            cell,
            style: TextStyle(fontSize: 16, fontWeight: isHeader ? FontWeight.bold : FontWeight.normal),
            textAlign: TextAlign.center,
          ),
        );
      }).toList(),
    );
  }
}
