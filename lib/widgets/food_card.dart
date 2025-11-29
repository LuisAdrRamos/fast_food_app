import "package:flutter/material.dart";

class FoodCard extends StatelessWidget {
  final String title;
  final String price;
  final Color color;

  const FoodCard({
    super.key,
    required this.title,
    required this.price,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    
    // WIDGET 7: Container (Caja decorada)
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            offset: const Offset(0, 3),
          )
        ],
      ),

      // WIDGET 4: Column (Organizar elementos verticalmente: Imagen, Titulo, Precio)
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // WIDGET 6: Expanded (Para que la imagen ocupe el espacio disponible arriba)
          Expanded(
            // WIDGET 5: Stack (Para poner elementos uno encima de otro)
            child: Stack(
              children: [

                Container(
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(15))
                  ),
                ),
                // WIDGET 8: Align (Alinear el corazón en la esquina)
                const Align(
                  alignment: Alignment.topRight,
                  // WIDGET 9: Padding (Espacio interno)
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.favorite_border, size: 18, color: Colors.red),
                    )
                  ),
                )
              ],
            )
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                // WIDGET 10: SizedBox (Espacio vertical fijo)
                const SizedBox(height: 5),
                Text(
                  price,
                  style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
          
        ],
      ),
    );
  }
}
