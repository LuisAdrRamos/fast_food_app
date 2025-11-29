import 'package:flutter/material.dart';
import '../widgets/food_card.dart'; // Importamos la tarjeta
import 'detail_screen.dart'; // Importamos la pantalla de detalle (NUEVO)

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // WIDGET 1: Scaffold (Estructura base)
    return Scaffold(
        // WIDGET 2: AppBar (Barra superior)
        appBar: AppBar(
          title: const Text("Policomida Rapida"),
          centerTitle: true,
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                // Acción al presionar el ícono del carrito
              },
            )
          ],
        ),
        // WIDGET 3: Drawer (Menú lateral)
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.orange,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.fastfood, size: 50, color: Colors.white),
                    SizedBox(height: 10),
                    Text(
                      "Menú Principal",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Inicio"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Configuración"),
                onTap: () {},
              )
            ],
          ),
        ),
        body: Column(
          children: [
            // WIDGET 7: Container (Fondo para el buscador)
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.orange,
              child: TextField(
                // WIDGET 14: TextField
                decoration: InputDecoration(
                  hintText: "Buscar Comida",
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                ),
              ),
            ),

            // WIDGET 6: Expanded (Ocupar el resto de la pantalla)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                // WIDGET 11: GridView (Cuadrícula de productos)
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.8,
                  // NOTA: Quitamos 'const' aquí porque los GestureDetector no son constantes
                  children: [
                    // ITEM 1: CON NAVEGACIÓN
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DetailScreen(
                                title: "Hamburgesa doble", color: Colors.brown),
                          ),
                        );
                      },
                      child: const FoodCard(
                          title: "Hamburgesa doble",
                          price: "\$2.50",
                          color: Colors.brown),
                    ),

                    // ITEM 2: CON NAVEGACIÓN
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DetailScreen(
                                title: "Hot Dog", color: Colors.red),
                          ),
                        );
                      },
                      child: const FoodCard(
                          title: "Hot Dog", price: "\$1.50", color: Colors.red),
                    ),

                    // RESTO DE ITEMS (Sin navegación por ahora, solo visuales)
                    const FoodCard(
                        title: "Papas Fritas",
                        price: "\$1.00",
                        color: Colors.yellow),
                    const FoodCard(
                        title: "Nuggets x10",
                        price: "\$2.00",
                        color: Colors.orangeAccent),
                    const FoodCard(
                        title: "Cola Grande",
                        price: "\$1.00",
                        color: Colors.black45),
                    const FoodCard(
                        title: "Helado Mix",
                        price: "\$1.50",
                        color: Colors.pinkAccent),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
