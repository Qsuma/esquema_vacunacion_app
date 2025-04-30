import 'package:flutter/material.dart';

class InmunidadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inmunidad y Vacunación"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("📌 Inmunidad"),
            _buildParagraph(
                "Son los mecanismos fisiológicos que permiten al organismo reconocer sustancias ajenas y eliminarlas."),
            
            _buildSectionTitle("📌 Tipos de Inmunidad"),
            _buildBulletPoint("🔹 **Inmunidad innata o natural**: Presente desde el nacimiento. "
                "Incluye barreras físicas y células como granulocitos, monocitos y linfocitos naturales asesinos."),
            _buildBulletPoint("🔹 **Inmunidad adaptativa**: Específica, con memoria inmunológica. "
                "Mediada por anticuerpos y células T."),

            _buildSectionTitle("📌 Según la producción de respuesta"),
            _buildBulletPoint("✅ **Inmunidad activa**: Generada por infecciones o vacunas."),
            _buildBulletPoint("✅ **Inmunidad pasiva**: Se adquiere al recibir anticuerpos ya formados (ejemplo: vía trasplacentaria o gammaglobulinas)."),

            _buildSectionTitle("📌 Según los componentes del sistema inmune"),
            _buildBulletPoint("🔹 **Inmunidad humoral**: Mediada por inmunoglobulinas en la sangre."),
            _buildBulletPoint("🔹 **Inmunidad celular**: Mediada por linfocitos T."),

            _buildSectionTitle("📌 Vacunación"),
            _buildParagraph(
                "Se refiere al acto físico de aplicar una vacuna en un ser humano para generar inmunidad."),
            
            _buildSectionTitle("📌 Tipos de Vacunas"),
            _buildBulletPoint("✅ **Monovalentes**: Contienen un solo antígeno (Ejemplo: Antitifoídica)."),
            _buildBulletPoint("✅ **Polivalentes**: Contienen múltiples variantes del mismo patógeno (Ejemplo: Antimeningocócica B y C)."),
            _buildBulletPoint("✅ **Combinadas**: Contienen varios antígenos de distinta naturaleza (Ejemplo: DPT, PRS)."),

            _buildSectionTitle("📌 Según sus componentes biológicos"),
            _buildBulletPoint("🔹 **Germen vivos atenuados**: Microorganismos debilitados que mantienen su poder antigénico."),
            _buildBulletPoint("🔹 **Vacunas muertas**: Fracciones de microorganismos que mantienen el poder antigénico."),
            _buildBulletPoint("🔹 **Toxoides**: Contienen toxinas modificadas."),
            _buildBulletPoint("🔹 **Polisacáridos conjugados**: Unen polisacáridos con proteínas para mejorar la respuesta inmune."),
            _buildBulletPoint("🔹 **Recombinación genética**: Uso de biotecnología para generar respuesta inmune."),

            _buildSectionTitle("📌 Componentes de las Vacunas"),
            _buildBulletPoint("💉 **Líquido de suspensión (diluente)**."),
            _buildBulletPoint("💉 **Preservativos y antibióticos**."),
            _buildBulletPoint("💉 **Estabilizadores**."),
            _buildBulletPoint("💉 **Adyuvantes** (potencian la respuesta inmune)."),

            _buildSectionTitle("📌 Contraindicaciones de las Vacunas"),
            _buildBulletPoint("❌ **Contraindicaciones permanentes:**"),
            _buildIndentedBulletPoint("• Reacción anafiláctica a una vacuna específica."),
            _buildIndentedBulletPoint("• Encefalitis antes de una semana de la vacunación."),

            _buildBulletPoint("⚠ **Contraindicaciones transitorias:**"),
            _buildIndentedBulletPoint("• Embarazo."),
            _buildIndentedBulletPoint("• Inmunosupresión."),

            _buildSectionTitle("📌 Precauciones"),
            _buildBulletPoint("⚠ **Precauciones permanentes:**"),
            _buildIndentedBulletPoint("• Hipotonía hiporesponsiva."),
            _buildIndentedBulletPoint("• Fiebre de 40°C o más."),
            _buildIndentedBulletPoint("• Convulsiones."),
            _buildIndentedBulletPoint("• Llanto súbito."),
            
            _buildBulletPoint("⚠ **Precauciones transitorias:**"),
            _buildIndentedBulletPoint("• Uso de quimioprofilaxis."),
            _buildIndentedBulletPoint("• Enfermedades activas."),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
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
}
