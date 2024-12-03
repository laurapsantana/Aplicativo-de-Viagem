import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/destination.dart';

// Estados
abstract class DestinationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DestinationInitial extends DestinationState {}

class DestinationLoaded extends DestinationState {
  final List<Destination> destinations;

  DestinationLoaded(this.destinations);

  @override
  List<Object?> get props => [destinations];
}

// Cubit
class DestinationCubit extends Cubit<DestinationState> {
  DestinationCubit() : super(DestinationInitial());

  void loadDestinations() {
    final destinations = [
      Destination(
        name: 'Paris',
        description: 'A Cidade Luz, famosa pela Torre Eiffel.',
        description2: 'Paris, a capital da França, '
            'é uma importante cidade europeia e um centro mundial de arte,'
            ' moda, gastronomia e cultura. Sua paisagem urbana do século XIX'
            ' é cortada por avenidas largas e pelo rio Sena. '
            'A cidade é conhecida por monumentos como a Torre Eiffel e a '
            'Catedral de Notre-Dame, uma construção gótica do século XII,'
            ' sendo famosa também pela cultura dos cafés e por lojas '
            ' estilistas famosos na Rue du Faubourg Saint-Honoré.',
        imageUrl: 'assets/paris.jpeg',
        isFavorite: false,
      ),
      Destination(
        name: 'Nova York',
        description: 'A cidade que nunca dorme.',
        description2: 'A cidade de Nova York compreende 5 distritos situados'
            ' no encontro do rio Hudson com o Oceano Atlântico. '
            'No centro da cidade fica Manhattan, um distrito com alta'
            ' densidade demográfica que está entre os principais centros comerciais,'
            ' financeiros e culturais do mundo. Entre seus pontos emblemáticos,'
            ' destacam-se arranha-céus, como o Empire State Building, e o enorme'
            ' Central Park. O teatro da Broadway fica em meio às luzes de neon'
            ' da Times Square.',
        imageUrl: 'assets/nova_york.jpeg',
        isFavorite: false,
      ),
      Destination(
        name: 'Tóquio',
        description: 'Uma mistura de tradição e tecnologia.',
        description2: 'Tóquio, a movimentada capital do Japão, combina'
            ' o estilo ultramoderno com o tradicional, desde arranha-céus'
            ' iluminados por neon a templos históricos.'
            ' O opulento santuário xintoísta Meiji é conhecido por seu '
            'altíssimo portão e pelas florestas circundantes.'
            ' O Palácio Imperial fica localizado em meio a jardins públicos.'
            ' Os muitos museus da cidade oferecem exposições que variam de arte'
            ' clássica (no Museu Nacional de Tóquio) a um teatro kabuki'
            ' reconstruído (no Museu Edo-Tokyo)',
        imageUrl: 'assets/tokyo.jpeg',
        isFavorite: false,
      ),
      Destination(
        name: 'Machu Picchu',
        description: 'Uma jóia dos Andes peruanos, repleta de mistérios históricos e vistas deslumbrantes.',
        description2: 'Machu Picchu é uma cidadela inca que fica no alto'
            ' da Cordilheira dos Andes no Peru, acima do vale do rio Urubamba.'
            ' Construída no século XV e posteriormente abandonada, ela é'
            ' conhecida pelas sofisticadas muralhas de pedra contínuas, '
            'cujos imensos blocos foram unidos sem o uso de argamassa, '
            'pelas construções intrigantes que levam em conta o alinhamento'
            ' dos astros e pelas vistas panorâmicas.',
        imageUrl: 'assets/machu_picchu.jpeg',
        isFavorite: false,
      ),
      Destination(
        name: 'Londres',
        description: 'A vibrante capital inglesa que mistura a tradição de sua realeza com a modernidade cosmopolita..',
        description2: 'Londres, capital da Inglaterra e do Reino Unido,'
            ' é uma cidade do século 21 com uma história que remonta à era '
            'romana. Seu centro abriga as sedes imponentes do Parlamento, '
            'a famosa torre do relógio do Big Ben e a Abadia de Westminster,'
            ' local de coroação dos monarcas britânicos. Do outro lado do'
            ' rio Tâmisa, a roda gigante London Eye tem vista panorâmica '
            'do complexo cultural da margem sul e de toda a cidade.',
        imageUrl: 'assets/londres.jpeg',
        isFavorite: false,
      ),
      Destination(
        name: 'Italia',
        description: 'O coração do Renascimento europeu, com paisagens de tirar o fôlego e uma cultura gastronômica inigualável.',
        description2: 'A Itália, país europeu com uma longa costa mediterrânea,'
            ' deixou uma marca poderosa na culinária e na cultura ocidentais.'
            ' A capital, Roma, é sede do Vaticano e abriga obras de arte'
            ' monumentais e ruínas antigas. Outra cidade importante é Florença,'
            ' com obras-primas do Renascimento, como o "Davi", de Michelangelo,'
            ' e o Domo de Brunelleschi. Destacam-se também Veneza, a cidade dos'
            ' canais, e Milão, capital da moda italiana.',
        imageUrl: 'assets/italia.jpg',
        isFavorite: false,
      ),
      Destination(
        name: 'Dubai',
        description: 'Oásis futurista do deserto, conhecido por sua arquitetura inovadora e luxo incomparável.',
        description2: 'Dubai é uma cidade e um emirado dos Emirados Árabes Unidos'
            ' conhecida pelos shoppings de luxo, pela arquitetura ultramoderna'
            ' e pela animada vida noturna. Burj Khalifa, uma torre de 830 metros'
            ' de altura, domina a linha do horizonte repleta de arranha-céus. '
            'Na base, há a Fonte de Dubai, com jatos de água e luzes coreografados'
            ' ao som de música. Nas ilhas artificiais próximas à costa, fica o '
            'Hotel Atlantis, um resort com parques aquáticos e de animais marinhos.',
        imageUrl: 'assets/dubai.jpeg',
        isFavorite: false,
      ),
      Destination(
        name: 'Bali',
        description: 'Um paraíso tropical na Indonésia, famoso por suas praias, templos e retiros de tranquilidade.',
        description2: 'Bali é uma ilha da Indonésia conhecida por suas montanhas'
            ' vulcânicas repletas de florestas, seus arrozais, suas praias e '
            'seus recifes de coral. A ilha abriga locais religiosos, como o '
            'templo Uluwatu, localizado na beira de um penhasco. Ao sul, '
            'a cidade litorânea de Kuta tem bares animados, enquanto Seminyak,'
            ' Sanur e Nusa Dua são cidades turísticas bastante procuradas.'
            ' A ilha também é conhecida por seus retiros de ioga e meditação.',
        imageUrl: 'assets/bali.jpg',
        isFavorite: false,
      ),
      Destination(
        name: 'Alemanha',
        description: 'Terra de castelos medievais e florestas encantadas, com uma rica história cultural e moderna.',
        description2: 'A Alemanha é um país situado na Europa Ocidental '
            'com uma paisagem de florestas, rios, cordilheiras e praias do Mar'
            ' do Norte. A nação tem mais de 2 milênios de história.'
            ' Berlim, a capital, abriga cenários artísticos e de vida noturna,'
            ' o Portão de Brandemburgo e muitos locais relacionados à Segunda'
            ' Guerra Mundial. Munique é conhecida pela Oktoberfest e pelos'
            ' beer halls, entre eles o Hofbräuhaus, do século XVI. Frankfurt,'
            ' com seus arranha-céus, abriga o Banco Central Europeu.',
        imageUrl: 'assets/alemanha.jpg',
        isFavorite: false,
      ),
      Destination(
        name: 'Cancún',
        description: 'O Caribe mexicano em sua essência, com praias paradisíacas e uma vida noturna eletrizante.',
        description2: 'Cancún, uma cidade mexicana situada na Península de '
            'Iucatã, na costa do Mar do Caribe, é conhecida por suas praias, '
            'seus vários resorts e sua vida noturna. Ela é composta por duas '
            'áreas distintas: a área mais tradicional do centro da cidade, '
            'El Centro, e a Zona Hotelera, uma longa faixa à beira-mar com '
            'grandes hotéis, casas noturnas, lojas e restaurantes. '
            'Cancún também é um famoso destino para estudantes durante o '
            'período de férias de primavera das universidades.',
        imageUrl: 'assets/cancun.jpg',
        isFavorite: false,
      ),
    ];

    emit(DestinationLoaded(destinations));
  }

  List<Destination> getFavorites() {
    if (state is DestinationLoaded) {
      return (state as DestinationLoaded).destinations
          .where((destination) => destination.isFavorite)
          .toList();
    }
    return [];
  }

  void toggleFavorite(Destination destination) {
    if (state is DestinationLoaded) {
      final currentDestinations = (state as DestinationLoaded).destinations;

      // Cria uma cópia do destino com o novo estado de 'isFavorite'
      final updatedDestinations = currentDestinations.map((dest) {
        if (dest == destination) {
          return Destination(
            name: dest.name,
            description: dest.description,
            description2: dest.description2,
            imageUrl: dest.imageUrl,
            isFavorite: !dest.isFavorite, // Alteração do estado 'isFavorite'
          );
        }
        return dest; // Mantém o destino original
      }).toList();

      // Emite o estado com a lista de destinos atualizada
      emit(DestinationLoaded(updatedDestinations));
    }
  }


}
