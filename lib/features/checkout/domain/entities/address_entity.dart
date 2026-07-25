class AddressEntity {
  final String fullName;
  final String email;
  final String address;
  final String city;
  final String floor;
  final String phone;

  const AddressEntity({
    required this.fullName,
    required this.email,
    required this.address,
    required this.city,
    required this.floor,
    required this.phone,
  });

  @override
  String toString() {
    return '$address $floor $city';
  }
}