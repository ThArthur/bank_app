import 'package:bank_project/models/CurrencyInfo.dart';
import 'package:bank_project/models/UsersTransfers.dart';
import 'package:bank_project/widgets/balance_card.dart';
import 'package:bank_project/widgets/exchange_rate_card.dart';
import 'package:bank_project/widgets/operations_cards.dart';
import 'package:bank_project/widgets/quick_money_transfer_card.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomePageState();
}

class _HomePageState extends State<HomeView> {
  bool isBalanceVisible = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            BalanceCard(
              title: "Total Balance",
              balance: 19549.26,
              onToggleVisibility: () {
                setState(() {
                  isBalanceVisible = !isBalanceVisible;
                });
              },
              isVisible: isBalanceVisible,
            ),
            SizedBox(height: 10),
            OperationsCards(
              firstTitle: "All operations",
              firstSubtitle: "Expenses in Dec, 2023",
              firstAmount: 2432.34,
              firstProgressColors: [
                Colors.amber,
                Colors.purple,
                Colors.lightBlue,
                Colors.redAccent,
              ],
              firstProgressFlexes: [0.7, 0.15, 0.1, 0.05],
              secondTitle: "Consumer Loan",
              secondAmount: -2432.34,
              secondInfoText: "Next payment in 6 days",
              secondInfoBackground: Colors.greenAccent.shade100,
              secondInfoTextColor: Colors.green.shade900,
            ),
            SizedBox(height: 10),
            QuickMoneyTransferCard(
              transferItems: UsersTransfers.usersTransfersItems,
              onSeeMorePressed: () {
                print("See more pressed");
              },
            ),
            SizedBox(height: 10),
            ExchangeRateCard(
              currencies: CurrencyInfo.currencies,
              onSeeMorePressed: () {
                print("See more pressed");
              },
            ),
          ],
        ),
      ),
    );
  }
}
