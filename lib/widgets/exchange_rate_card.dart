import 'package:bank_project/models/CurrencyInfo.dart';
import 'package:flutter/material.dart';

class ExchangeRateCard extends StatelessWidget {
  final String title;
  final String seeMoreText;
  final List<CurrencyInfo> currencies;
  final VoidCallback? onSeeMorePressed;

  const ExchangeRateCard({
    super.key,
    this.title = "Exchange rate",
    this.seeMoreText = "See more",
    required this.currencies,
    this.onSeeMorePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title.toUpperCase(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: onSeeMorePressed,
                  child: Text(
                    seeMoreText.toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFE94B77),
                    ),
                  ),
                ),
              ],
            ),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: currencies.length,
              itemBuilder: (context, index) {
                final currency = currencies[index];
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Image.network(
                                  currency.flagUrl,
                                  height: 18,
                                  width: 32,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                currency.currencyCode.toUpperCase(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            currency.currencyName,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),

                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "\$${currency.buyValue.toStringAsFixed(4)}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                Icon(
                                  currency.isBuyTrendingUp
                                      ? Icons.trending_up_sharp
                                      : Icons.trending_down_sharp,
                                  size: 16,
                                  color: currency.isBuyTrendingUp
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              ],
                            ),
                            const SizedBox(width: 40),
                            Row(
                              children: [
                                Text(
                                  "\$${currency.sellValue.toStringAsFixed(4)}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                Icon(
                                  currency.isSellTrendingUp
                                      ? Icons.trending_up_sharp
                                      : Icons.trending_down_sharp,
                                  size: 16,
                                  color: currency.isSellTrendingUp
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
