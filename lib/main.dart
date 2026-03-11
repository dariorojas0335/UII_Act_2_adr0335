import 'package:flutter/material.dart';

// 1. Definición de la clase Producto
class Producto {
  final String titulo;
  final String subtitulo;
  final String imgUrl;

  Producto({
    required this.titulo,
    required this.subtitulo,
    required this.imgUrl,
  });
}

void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 2. Lista de diccionarios (datos crudos)
    final List<Map<String, String>> datosRaw = [
      {
        'titulo': 'Cámara Vintage',
        'subtitulo': 'Captura momentos clásicos.',
        'url': 'https://raw.githubusercontent.com/dariorojas0335/act_11_imgs/refs/heads/main/proy_1.jpg'
      },
      {
        'titulo': 'Laptop Pro',
        'subtitulo': 'Potencia para tus proyectos.',
        'url': 'https://raw.githubusercontent.com/dariorojas0335/act_11_imgs/refs/heads/main/proy_2.jpg'
      },
      {
        'titulo': 'Reloj Inteligente',
        'subtitulo': 'Estilo y salud en tu muñeca.',
        'url': 'https://raw.githubusercontent.com/dariorojas0335/act_11_imgs/refs/heads/main/proy_3.jpg'
      },
    ];

    // 3. Convertimos la lista de diccionarios a una lista de objetos Producto
    final List<Producto> productos = datosRaw.map((item) {
      return Producto(
        titulo: item['titulo']!,
        subtitulo: item['subtitulo']!,
        imgUrl: item['url']!,
      );
    }).toList();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text('Catálogo de Productos'),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          // COLUMNA PRINCIPAL
          child: Column(
            children: productos.map((prod) => TarjetaProducto(producto: prod)).toList(),
          ),
        ),
      ),
    );
  }
}

// Widget personalizado para la Tarjeta
class TarjetaProducto extends StatelessWidget {
  final Producto producto;

  const TarjetaProducto({super.key, required this.producto});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5, // Sombreado
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        // FILA PRINCIPAL DE LA TARJETA
        child: Row(
          children: [
            // Imagen a la izquierda
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                producto.imgUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16), // Espacio entre imagen y texto
            // Columna a la derecha con textos
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Alineación a la izquierda
                children: [
                  Text(
                    producto.titulo,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    producto.subtitulo,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
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