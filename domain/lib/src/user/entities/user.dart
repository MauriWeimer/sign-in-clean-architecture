import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({required this.id, required this.avatar});

  final int id;
  final String avatar;

  @override
  List<Object?> get props => [id];
}
