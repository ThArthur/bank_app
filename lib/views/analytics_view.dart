import 'package:bank_project/models/AnalyticModel.dart';
import 'package:bank_project/models/Transaction.dart';
import 'package:bank_project/models/TransactionDay.dart';
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
  final List<String> filters = [
    "Expenses",
    "Income",
    "Money transfers",
    "Bills",
    "Subscriptions",
    "Loans",
    "Investments",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12),
            CreditCardCarousel(
              onCardChanged: (card) {
                setState(() {
                  selectedCard = card;
                });
              },
              creditCards: AnalyticModel.creditCards,
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "\$${selectedCard.totalSpendThisWeek.toStringAsFixed(2)}",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
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
            Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _filterItems(filters),
                    SizedBox(height: 8),
                    ...fakeGroupedTransactions.expand(
                      (el) => [
                        Text(el.day),
                        SizedBox(height: 8),
                        ...el.transactions.expand(
                          (transaction) => {
                            _paymentItem(transaction),
                            SizedBox(height: 12),
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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

  Widget _filterItems(List<String> filterList) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF49454F),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Icon(Icons.settings_bluetooth_outlined, size: 14),
            ),
          ),
          SizedBox(width: 6),
          ...filterList.expand(
            (el) => [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF49454F),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(el),
                ),
              ),
              SizedBox(width: 6),
            ],
          ),
        ],
      ),
    );
  }

  Widget _paymentItem(Transaction transaction) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: transaction.iconBackground,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Icon(transaction.icon),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(transaction.title), Text(transaction.subtitle)],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [Text(transaction.amount), Text(transaction.method)],
        ),
      ],
    );
  }
}
