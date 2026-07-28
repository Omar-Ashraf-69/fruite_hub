import 'package:flutter/material.dart';

class AddressControllers {
  final fullName = TextEditingController();
  final email = TextEditingController();
  final address = TextEditingController();
  final city = TextEditingController();
  final floor = TextEditingController();
  final phone = TextEditingController();

  void dispose() {
    fullName.dispose();
    email.dispose();
    address.dispose();
    city.dispose();
    floor.dispose();
    phone.dispose();
  }
}