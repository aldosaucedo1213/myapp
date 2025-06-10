import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final String productName;
  final String productDescription;

  const Details({
    Key? key,
    required this.productName,
    required this.productDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Details"),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ListView(
          children: [
            _buildProductTile(
              icon: Icons.bookmark_added_rounded,
              title: productName,
              subtitle: productDescription,
            ),
            _buildProductTile(
              icon: Icons.shopping_bag_outlined,
              title: "Bag",
              subtitle: "Brown Color Bag with straps",
            ),
            _buildProductTile(
              icon: Icons.chair,
              title: "Chair",
              subtitle: "Wooden swinging Chair",
            ),
            _buildBranchTile(
              icon: Icons.store,
              title: "Sucursal Central",
              subtitle: "ID: 001",
              details: {
                'Dirección': 'Av. Principal 123',
                'Teléfono': '555-1234',
                'Horario': 'L-V 9:00-18:00',
                'Gerente': 'Juan Pérez',
                'Administrador': 'María Gómez',
              },
            ),
            _buildBranchTile(
              icon: Icons.store,
              title: "Sucursal Norte",
              subtitle: "ID: 002",
              details: {
                'Dirección': 'Calle Norte 456',
                'Teléfono': '555-5678',
                'Horario': 'L-S 8:00-17:00',
                'Gerente': 'Carlos Rodríguez',
                'Administrador': 'Ana López',
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductTile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return ListTile(
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1.0, color: Colors.grey.shade300),
      ),
      leading: IconButton(
        icon: Icon(icon, color: Colors.blueAccent),
        onPressed: () {},
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
      subtitle: Text(subtitle),
      trailing: const Icon(
        Icons.delete,
        color: Colors.grey,
      ),
    );
  }

  Widget _buildBranchTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required Map<String, String> details,
  }) {
    return ExpansionTile(
      leading: Icon(icon, color: Colors.green),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
      subtitle: Text(subtitle),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: details.entries.map((entry) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  children: [
                    Text(
                      '${entry.key}: ',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(entry.value),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}