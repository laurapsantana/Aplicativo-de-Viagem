import 'package:equatable/equatable.dart';
import '../models/destination.dart';


abstract class DestinationState extends Equatable {
  const DestinationState();

  @override
  List<Object> get props => [];
}

class Destination {
  final String name;
  final String description;
  final String description2;
  final String imageUrl;

  Destination({
    required this.name,
    required this.description,
    required this.description2,
    required this.imageUrl,
  });
}
