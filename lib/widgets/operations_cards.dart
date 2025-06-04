import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OperationsCards extends StatelessWidget {
  final String firstTitle;
  final String firstSubtitle;
  final double firstAmount;
  final List<Color> firstProgressColors;
  final List<double> firstProgressFlexes;

  final String secondTitle;
  final double secondAmount;
  final String secondInfoText;
  final Color secondInfoBackground;
  final Color secondInfoTextColor;

  const OperationsCards({
    super.key,
    required this.firstTitle,
    required this.firstSubtitle,
    required this.firstAmount,
    required this.firstProgressColors,
    required this.firstProgressFlexes,
    required this.secondTitle,
    required this.secondAmount,
    required this.secondInfoText,
    required this.secondInfoBackground,
    required this.secondInfoTextColor,
  });

  String formatCurrency(double value) {
    final formatter = NumberFormat.simpleCurrency(locale: 'en_US');
    return formatter.format(value);
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.wallet_rounded),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      firstTitle.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      firstSubtitle,
                    ),
                    Text(
                      formatCurrency(firstAmount),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      height: 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Row(
                          children: List.generate(firstProgressColors.length,
                                  (index) {
                                int flex =
                                (firstProgressFlexes[index] * 1000).toInt();
                                return Expanded(
                                  flex: flex,
                                  child: Container(color: firstProgressColors[index]),
                                );
                              }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.wallet_rounded),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      secondTitle.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      formatCurrency(secondAmount),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: secondInfoBackground,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          secondInfoText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: secondInfoTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
