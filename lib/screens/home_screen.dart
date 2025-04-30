import 'package:esquema_vacunacion_app/screens/info.dart';
import 'package:esquema_vacunacion_app/screens/inmunidad.dart';
import 'package:flutter/material.dart';
import 'esquema_vacunacion_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Vacunación en Cuba"),
          backgroundColor: Colors.blue,
        ),
        drawer: _buildDrawer(context), // Menú lateral
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            children: [
              _buildGridItem(context, "Esquema de Vacunación", Icons.calendar_month, EsquemaVacunacionScreen()),
              _buildGridItem(context, "Clasificación de Vacunas", Icons.type_specimen, ClasificacionVacunas()),
               _buildGridItem(context, "Inmunidad", Icons.vaccines_rounded,InmunidadScreen()),
            ],
          ),
        ),
      ),
    );
  }

  /// Método para construir el Drawer (menú lateral)
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.vaccines, size: 50, color: Colors.white),
                SizedBox(height: 10),
                Text(
                  "Vacunación en Cuba",
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          _buildDrawerItem(context, "Esquema de Vacunación", Icons.calendar_month, EsquemaVacunacionScreen()),
          _buildDrawerItem(context, "Clasificación de Vacunas", Icons.type_specimen, ClasificacionVacunas()),
           _buildDrawerItem(context, "Inmunidad", Icons.vaccines, InmunidadScreen()),
        ],
      ),
    );
  }

  /// Método para crear un ítem del Drawer
  Widget _buildDrawerItem(BuildContext context, String title, IconData icon, Widget screen) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      onTap: () {
        Navigator.pop(context); // Cerrar el Drawer
        Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
      },
    );
  }

  /// Método para crear un ítem del GridView
  Widget _buildGridItem(BuildContext context, String title, IconData icon, Widget screen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.blue),
            SizedBox(height: 10),
            Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
