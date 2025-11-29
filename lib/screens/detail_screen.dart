import "package:flutter/material.dart";

class DetailScreen extends StatefulWidget {
  final String title;
  final Color color;

  const DetailScreen({super.key, required this.title, required this.color});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool esCombo = false;
  bool extraQueso = false;
  bool extraTocino = false;
  int salsaSeleccionada = 1;

  @override
  Widget build(BuildContext context) {
    // WIDGET 1: Scaffold (Otra vez, estructura base)
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: widget.color,
          foregroundColor: Colors.white,
        ),

        // WIDGET 10: ListView (Permite scroll si el contenido es largo)
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Icon(Icons.fastfood, size: 100, color: Colors.white54),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Personaliza tu orden",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const Divider(),

            // WIDGET 13: Switch (Interruptor)
            ListTile(
              title: const Text("¿Hacerlo combo? (Papas + Bebida)"),
              subtitle: const Text("Adiciona \$1.50"),
              trailing: Switch(
                value: esCombo,
                activeColor: Colors.orange,
                onChanged: (bool value) {
                  setState(() {
                    esCombo = value;
                  });
                },
              ),
            ),

            const Divider(),
            const Text("Extras: ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

            // WIDGET 13: Checkbox (Casilla de verificación)
            CheckboxListTile(
              title: const Text("Extra Queso (+\$0.50)"),
              value: extraQueso,
              onChanged: (bool? value) {
                setState(() {
                  extraQueso = value!;
                });
              },
            ),

            CheckboxListTile(
              title: const Text("Extra Tocino (+\$0.50)"),
              value: extraTocino,
              onChanged: (bool? value) {
                setState(() {
                  extraTocino = value!;
                });
              },
            ),

            const Divider(),
            const Text("Selecciona tu salsa: ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

            // WIDGET 14: RadioListTile (Opciones de selección única)
            RadioListTile<int>(
              title: const Text("Salsa de tomate"),
              value: 1,
              groupValue: salsaSeleccionada,
              onChanged: (int? value) {
                setState(() {
                  salsaSeleccionada = value!;
                });
              },
            ),

            RadioListTile<int>(
              title: const Text("Mostaza"),
              value: 2,
              groupValue: salsaSeleccionada,
              onChanged: (int? value) {
                setState(() {
                  salsaSeleccionada = value!;
                });
              },
            ),

            const SizedBox(height: 30),

            // WIDGET 4: Row (Alinear botones horizontalmente)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // WIDGET 12: OutlinedButton (Botón con borde)
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancelar"),
                ),

                // WIDGET 12: ElevatedButton (Botón principal)
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("¡Pedido Agregado!")),
                    );
                  },
                  icon: const Icon(Icons.check),
                  label: const Text("Pedir Ahora"),
                ),
              ],
            ),

            const SizedBox(height: 10),
            // WIDGET 12: TextButton (Botón solo texto)
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text("Ver Información Nutricional",
                    style: TextStyle(decoration: TextDecoration.underline)),
              ),
            )
          ],
        ));
  }
}
