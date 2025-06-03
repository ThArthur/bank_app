import 'package:bank_project/models/CurrencyInfo.dart';
import 'package:bank_project/models/UsersTransfers.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hey George!", style: TextStyle(fontSize: 16)),
            Text(
              "Arthur Rocha",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                balanceContainer(),
                SizedBox(height: 10),
                operationsCards(),
                SizedBox(height: 10),
                quickMoneyTransfer(),
                SizedBox(height: 10),
                exchangeRateCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget balanceContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total Balance",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).hintColor,
                  fontSize: 18,
                ),
              ),
              Text(
                '\$19,549.96',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w500),
              ),
            ],
          ),

          IconButton(onPressed: () {}, icon: Icon(Icons.visibility)),
        ],
      ),
    );
  }

  Widget operationsCards() {
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
                        color: Theme.of(context).hintColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.wallet_rounded),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "All operations".toUpperCase(),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Expenses in Dec, 2023",
                      style: TextStyle(color: Theme.of(context).hintColor),
                    ),
                    Text(
                      "\$2,432.34",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6),
                    Container(
                      height: 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).hintColor,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Row(
                          children: [
                            Expanded(
                              flex: (0.7 * 1000).toInt(),
                              child: Container(color: Colors.amber),
                            ),
                            Expanded(
                              flex: (0.15 * 1000).toInt(),
                              child: Container(color: Colors.purple),
                            ),
                            Expanded(
                              flex: (0.1 * 1000).toInt(),
                              child: Container(color: Colors.lightBlue),
                            ),
                            Expanded(
                              flex: (0.05 * 1000).toInt(),
                              child: Container(color: Colors.redAccent),
                            ),
                          ],
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
                        color: Theme.of(context).hintColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.wallet_rounded),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Consumer Loan".toUpperCase(),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "- \$2,432.34",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.greenAccent.shade100,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          "Next payment in 6 days",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.green.shade900,
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

  Widget quickMoneyTransfer() {
    return Card(
      elevation: 0,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Quick money transfers".toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "See more".toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFE94B77),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: UsersTransfers.usersTransfersItems.length,
                itemBuilder: (context, index) {
                  final item = UsersTransfers.usersTransfersItems[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Stack(
                      clipBehavior: Clip.hardEdge,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            item.imageUrl,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        if (item.isOnline)
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                color: const Color(0xFFE94B77),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Theme.of(context).cardColor,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget exchangeRateCard() {
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
                  "Exchange rate".toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "See more".toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFE94B77),
                  ),
                ),
              ],
            ),

            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: CurrencyInfo.currencies.length,
              itemBuilder: (context, index) {
                final currency = CurrencyInfo.currencies[index];
                return Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
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
                              SizedBox(width: 5),
                              Text(
                                currency.currencyCode.toUpperCase(),
                                style: TextStyle(
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
                              color: Theme.of(context).hintColor,
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
                                    color: Theme.of(context).hintColor,
                                  ),
                                ),
                                Icon(
                                  currency.isBuyTrendingUp
                                      ? Icons.trending_up_sharp
                                      : Icons.trending_down_sharp,
                                  size: 16,
                                  color:
                                      currency.isBuyTrendingUp
                                          ? Colors.green
                                          : Colors.red,
                                ),
                              ],
                            ),
                            SizedBox(width: 40),
                            Row(
                              children: [
                                Text(
                                  "\$${currency.sellValue.toStringAsFixed(4)}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Theme.of(context).hintColor,
                                  ),
                                ),
                                Icon(
                                  currency.isSellTrendingUp
                                      ? Icons.trending_up_sharp
                                      : Icons.trending_down_sharp,
                                  size: 16,
                                  color:
                                      currency.isSellTrendingUp
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
