import 'package:firebase_auth/firebase_auth.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contact_dto.g.dart';

@JsonSerializable()
class ContactDTO {
  const ContactDTO({required this.id});

  final String id;

  factory ContactDTO.fromFirebase(User user) => ContactDTO(id: user.uid);
  factory ContactDTO.fromJson(Map<String, dynamic> json) => _$ContactDTOFromJson(json);
  Map<String, dynamic> toJson() => _$ContactDTOToJson(this);
}
