import 'dart:math';
import 'dart:ui';

import 'package:bank_project/models/TransactionDay.dart';

class AnalyticModel {
  final double cardBalance;
  final int lastFourNumbers;
  final double totalSpendThisWeek;
  final Color color;
  final List<double> weeklySpending;
  final List<TransactionDay> transactions;

  AnalyticModel({
    required this.cardBalance,
    required this.lastFourNumbers,
    required this.totalSpendThisWeek,
    required this.color,
    required this.weeklySpending,
    required this.transactions,
  });

  static final List<Color> _colors = [
    Color(0xFFbd5165),
    Color(0xFF5175bd),
    Color(0xFF51bd94),
    Color(0xFFbd9f51),
    Color(0xFF9451bd),
    Color(0xFF51bdb6),
  ];

  static final List<AnalyticModel> creditCards = List.generate(3, (index) {
    final random = Random(index);
    return AnalyticModel(
      cardBalance: [3453.55, 7745.55, 4556.32][index],
      lastFourNumbers: [2352, 7862, 8931][index],
      totalSpendThisWeek: [224.53, 4777.21, 2234.53][index],
      color: _colors[random.nextInt(_colors.length)],
      weeklySpending: List.generate(7, (_) => random.nextDouble() * 100),
      transactions: fakeGroupedTransactions,
    );
  });
}
