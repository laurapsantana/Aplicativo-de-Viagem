import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/destination_cubit.dart';
import 'details_page.dart';
import 'favorites_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Chama o método de carregar destinos quando a página for aberta
    context.read<DestinationCubit>().loadDestinations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Destinos de Viagem'),
        centerTitle: true,
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
      body: Column(
        children: [
          // Cabeçalho com imagem
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/paris.jpeg'), // Imagem de cabeçalho
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Corpo da página com a lista de destinos
          Expanded(
            child: BlocBuilder<DestinationCubit, DestinationState>(
              builder: (context, state) {
                if (state is DestinationInitial) {
                  // Exibe um indicador de carregamento enquanto o estado está inicial
                  return const Center(child: CircularProgressIndicator());
                } else if (state is DestinationLoaded) {
                  final destinations = state.destinations;
                  return ListView.builder(
                    itemCount: destinations.length,
                    itemBuilder: (context, index) {
                      final destination = destinations[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              destination.imageUrl,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.broken_image, size: 80);
                              },
                            ),
                          ),
                          title: Text(destination.name, style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(
                            destination.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              destination.isFavorite ? Icons.favorite : Icons.favorite_border,
                              color: destination.isFavorite ? Colors.red : null,
                            ),
                            onPressed: () {
                              context.read<DestinationCubit>().toggleFavorite(destination);
                            },
                          ),
                          onTap: () {
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
                  return const Center(child: Text('Erro ao carregar destinos.'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
