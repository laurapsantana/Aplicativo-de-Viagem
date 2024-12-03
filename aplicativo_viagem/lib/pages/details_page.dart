import 'package:flutter/material.dart';
import '../models/destination.dart';
import 'favorites_page.dart';

class DetailsPage extends StatelessWidget {
  final Destination destination;

  const DetailsPage({Key? key, required this.destination}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(destination.name),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              // Navega para a página de favoritos
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => FavoritesPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Exibe a imagem do destino
            Image.asset(
              destination.imageUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            // Nome do destino
            Text(
              destination.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            // Descrição principal
            Text(
              destination.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            // Descrição detalhada (description2)
            Text(
              destination.description2,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
