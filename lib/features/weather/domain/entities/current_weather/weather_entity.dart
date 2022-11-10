import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  const Weather({this.id, this.main, this.description, this.icon});

  @override
  List<Object?> get props => [
        id,
        main,
        description,
        icon,
      ];
}
