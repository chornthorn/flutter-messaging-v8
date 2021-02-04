import 'package:equatable/equatable.dart';

class UserResEntity extends Equatable {
  final String uid;
  final String name;
  final String email;

  UserResEntity({this.uid, this.name, this.email});

  @override
  List<Object> get props => [uid, name, email];
}
