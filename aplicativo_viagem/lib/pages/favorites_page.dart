import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/destination_cubit.dart';
import 'details_page.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favoritos')),
      body: BlocBuilder<DestinationCubit, DestinationState>(
        builder: (context, state) {
          if (state is DestinationLoaded) {
            // Filtra os destinos favoritos
            final favoriteDestinations = state.destinations
                .where((destination) => destination.isFavorite)
                .toList();

            if (favoriteDestinations.isEmpty) {
              return const Center(child: Text('Nenhum destino favorito ainda.'));
            }

            return ListView.builder(
              itemCount: favoriteDestinations.length,
              itemBuilder: (context, index) {
                final destination = favoriteDestinations[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: Image.asset(
                      destination.imageUrl,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                    title: Text(destination.name),
                    subtitle: Text(destination.description),
                    trailing: IconButton(
                      icon: Icon(
                        destination.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: destination.isFavorite ? Colors.red : null,
                      ),
                      onPressed: () {
                        // Alterna o estado de favorito
                        context.read<DestinationCubit>().toggleFavorite(destination);
                      },
                    ),
                    onTap: () {
                      // Navega para a página de detalhes
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailsPage(destination: destination),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
