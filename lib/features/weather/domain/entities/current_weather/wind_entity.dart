import 'package:equatable/equatable.dart';

class Wind extends Equatable {
  final double? speed;
  final int? deg;
  final double? gust;

  const Wind({this.speed, this.deg, this.gust});

  @override
  List<Object?> get props => [
        speed,
        deg,
        gust,
      ];
}
