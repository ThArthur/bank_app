import 'package:bank_project/widgets/credit_card.dart';
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
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.supervised_user_circle),
        ),
        title: Text("Credit Card"),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Cards",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Text(
                    "ADD NEW +",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            CreditCardWidget(
              cardNumber: "**** **** **** 1234",
              cardHolder: "João da Silva",
              expiryDate: "12/26",
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Transactions",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
                ],
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 18,
                    children: [
                      transactionItem(
                        context,
                        true,
                        Icons.ac_unit,
                        "Ar Condicionado",
                        "Energia da cidade",
                        "July 14, 2022",
                        12.55,
                      ),
                      transactionItem(
                        context,
                        false,
                        Icons.currency_bitcoin,
                        "Bitcoin",
                        "Rico Ltda.",
                        "July 14, 2022",
                        1836.55,
                      ),
                      transactionItem(
                        context,
                        true,
                        Icons.access_alarm,
                        "Alarme",
                        "Aplicativo de alarme",
                        "October 14, 2022",
                        9.99,
                      ),
                      transactionItem(
                        context,
                        false,
                        Icons.shopping_cart,
                        "Mercado Livre",
                        "Compra online",
                        "August 2, 2022",
                        259.90,
                      ),
                      transactionItem(
                        context,
                        true,
                        Icons.local_gas_station,
                        "Posto Shell",
                        "Combustível",
                        "September 10, 2022",
                        199.80,
                      ),
                      transactionItem(
                        context,
                        true,
                        Icons.wifi,
                        "Internet",
                        "Conta mensal",
                        "September 28, 2022",
                        120.00,
                      ),
                      transactionItem(
                        context,
                        false,
                        Icons.attach_money,
                        "Salário",
                        "Empresa XPTO",
                        "September 30, 2022",
                        5000.00,
                      ),
                      transactionItem(
                        context,
                        true,
                        Icons.fastfood,
                        "iFood",
                        "Pizza Hut",
                        "October 1, 2022",
                        48.90,
                      ),
                      transactionItem(
                        context,
                        true,
                        Icons.coffee,
                        "Starbucks",
                        "Café da manhã",
                        "October 2, 2022",
                        22.50,
                      ),
                      transactionItem(
                        context,
                        true,
                        Icons.movie,
                        "Netflix",
                        "Assinatura mensal",
                        "October 5, 2022",
                        39.90,
                      ),
                      transactionItem(
                        context,
                        true,
                        Icons.healing,
                        "Farmácia",
                        "Remédios",
                        "October 6, 2022",
                        89.30,
                      ),
                      transactionItem(
                        context,
                        false,
                        Icons.payment,
                        "Cashback Nubank",
                        "Reembolso",
                        "October 7, 2022",
                        25.00,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget transactionItem(
    BuildContext context,
    bool negative,
    IconData icon,
    String transactionName,
    String transactionDescription,
    String date,
    double price,
  ) {
    return Row(
      children: [
        Card(
          shape: const CircleBorder(),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(icon),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transactionName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                transactionDescription,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "R\$ ${price.toStringAsFixed(2).replaceAll('.', ',')}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: negative ? Colors.red : Colors.green,
              ),
            ),
            Text(date, style: TextStyle(color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}
