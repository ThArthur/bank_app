import 'dart:math';
import 'dart:ui';

Color getRandomCardColor() {
  const predefinedColors = [
    Color(0xFFbd5165),
    Color(0xFF5175bd),
    Color(0xFF51bd94),
    Color(0xFFbd9f51),
    Color(0xFF9451bd),
    Color(0xFF51bdb6),
  ];
  return predefinedColors[Random().nextInt(predefinedColors.length)];
}