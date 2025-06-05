import 'package:bank_project/models/AnalyticModel.dart';
import 'package:bank_project/widgets/credit_card_carousel.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AnalyticsView extends StatefulWidget {
  const AnalyticsView({super.key});

  @override
  State<AnalyticsView> createState() => _AnalyticsViewState();
}

class _AnalyticsViewState extends State<AnalyticsView> {
  AnalyticModel selectedCard = AnalyticModel.creditCards.first;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CreditCardCarousel(
          onCardChanged: (card) {
            setState(() {
              selectedCard = card;
            });
          },
          creditCards: AnalyticModel.creditCards,
        ),
        const SizedBox(height: 12),
        Text(
          "\$${selectedCard.totalSpendThisWeek.toStringAsFixed(2)}",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          height: 300,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              barGroups: _createBarGroups(selectedCard.weeklySpending),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      const days = [
                        'DOM',
                        'SEG',
                        'TER',
                        'QUA',
                        'QUI',
                        'SEX',
                        'SAB',
                      ];
                      final index = value.toInt();
                      return SideTitleWidget(
                        meta: meta,
                        child: Text(days[index]),
                      );
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              gridData: FlGridData(show: false),
              borderData: FlBorderData(show: false),
              barTouchData: BarTouchData(
                enabled: true,
                touchTooltipData: BarTouchTooltipData(
                  tooltipPadding: const EdgeInsets.all(8),
                  getTooltipItem: (group, groupIndex, rod, rodIndex) {
                    return BarTooltipItem(
                      '\$${rod.toY.toStringAsFixed(2)}',
                      const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<BarChartGroupData> _createBarGroups(List<double> data) {
    return List.generate(7, (index) {
      final isHighlighted = index == 6;
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: data[index],
            width: 20,
            borderRadius: BorderRadius.circular(6),
            color: isHighlighted ? Colors.greenAccent : Colors.white30,
          ),
        ],
      );
    });
  }
}
