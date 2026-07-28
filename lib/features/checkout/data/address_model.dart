import 'package:fruit_hub/features/checkout/domain/entities/address_entity.dart';

class AddressModel {
  final String fullName;
  final String email;
  final String address;
  final String city;
  final String floor;
  final String phone;

  const AddressModel({
    required this.fullName,
    required this.email,
    required this.address,
    required this.city,
    required this.floor,
    required this.phone,
  });

  factory AddressModel.fromEntity(AddressEntity entity) {
    return AddressModel(
      fullName: entity.fullName,
      email: entity.email,
      address: entity.address,
      city: entity.city,
      floor: entity.floor,
      phone: entity.phone,
    );
  }

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      fullName: json['fullName'],
      email: json['email'],
      address: json['address'],
      city: json['city'],
      floor: json['floor'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'address': address,
      'city': city,
      'floor': floor,
      'phone': phone,
    };
  }
}