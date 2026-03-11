import 'package:flutter/material.dart';

// 1. Clase Proyecto
class Proyecto {
  final String nombre;
  final String descripcionDelProyecto;
  final String imgUrl;

  Proyecto({
    required this.nombre,
    required this.descripcionDelProyecto,
    required this.imgUrl,
  });
}

void main() {
  runApp(const EmpresaConstruccionApp());
}

class EmpresaConstruccionApp extends StatelessWidget {
  const EmpresaConstruccionApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 2. Lista de diccionarios (Datos)
    final List<Map<String, String>> datosProyectos = [
      {
        'nombre': 'Residencial Olivo',
        'descripcion': 'Complejo de casas autosustentables con jardín.',
        'url': 'https://raw.githubusercontent.com/dariorojas0335/act_11_imgs/refs/heads/main/proy_1.jpg'
      },
      {
        'nombre': 'Centro Logístico',
        'descripcion': 'Bodegas industriales de alta resistencia.',
        'url': 'https://raw.githubusercontent.com/dariorojas0335/act_11_imgs/refs/heads/main/proy_2.jpg'
      },
      {
        'nombre': 'Parque Industrial',
        'descripcion': 'Diseño urbano con pavimentos permeables.',
        'url': 'https://raw.githubusercontent.com/dariorojas0335/act_11_imgs/refs/heads/main/proy_3.jpg'
      },
    ];

    final List<Proyecto> listaProyectos = datosProyectos.map((p) {
      return Proyecto(
        nombre: p['nombre']!,
        descripcionDelProyecto: p['descripcion']!,
        imgUrl: p['url']!,
      );
    }).toList();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFF1F8E9), // Fondo verde muy pálido
        appBar: AppBar(
          title: const Text('Constructora Eco-Build', 
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          backgroundColor: Colors.green[800],
          centerTitle: true,
          elevation: 0, // Quitamos sombra para que el rectángulo gris se pegue bien
        ),
        body: Column(
          children: [
            // 3. RECTÁNGULO GRIS CLARO DEBAJO DEL ENCABEZADO
            Container(
              height: 50,
              color: Colors.grey[300],
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: const [
                  Icon(Icons.menu, color: Colors.black54), // Símbolo menú desplegable
                  SizedBox(width: 10),
                  Text('Filtros / Opciones de visualización', 
                    style: TextStyle(color: Colors.black54)),
                ],
              ),
            ),
            
            // 4. SUBTÍTULO CENTRADO "PROYECTOS"
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: Text(
                  'Proyectos',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2E7D32),
                  ),
                ),
              ),
            ),

            // 5. LISTA DE CARDS (Usamos Expanded + ListView para que sea scrolleable)
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: listaProyectos.map((proy) => TarjetaProyecto(proyecto: proy)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget de la Tarjeta con 2 columnas de texto
class TarjetaProyecto extends StatelessWidget {
  final Proyecto proyecto;
  const TarjetaProyecto({super.key, required this.proyecto});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // Imagen a la izquierda
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                proyecto.imgUrl,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            // Fila con dos columnas de texto
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Columna 1: Título
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('TÍTULO', style: TextStyle(fontSize: 9, color: Colors.green)),
                        Text(
                          proyecto.nombre,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Columna 2: Descripción
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('DETALLES', style: TextStyle(fontSize: 9, color: Colors.grey)),
                        Text(
                          proyecto.descripcionDelProyecto,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}