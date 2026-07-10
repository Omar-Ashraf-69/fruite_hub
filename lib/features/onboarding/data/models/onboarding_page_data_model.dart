import 'package:flutter/material.dart';

class OnBoardingPageModel {
  final String backgroundImage;
  final String image;
  final Widget title;
  final String description;
  final bool showSkip;

  const OnBoardingPageModel({
    required this.backgroundImage,
    required this.image,
    required this.title,
    required this.description,
    this.showSkip = false,
  });
}

