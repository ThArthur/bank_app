import 'package:bank_project/models/Transaction.dart';
import 'package:flutter/material.dart';

class TransactionDay {
  final String day;
  final List<Transaction> transactions;

  TransactionDay({
    required this.day,
    required this.transactions,
});
}

final List<TransactionDay> fakeGroupedTransactions = [
  TransactionDay(
    day: "Today",
    transactions: [
      Transaction(
        title: "Dribble Subscription",
        subtitle: "Payment",
        icon: Icons.settings_bluetooth_outlined,
        iconBackground: Colors.pinkAccent,
        amount: "-\$634.23",
        method: "Personal credit card",
      ),
      Transaction(
        title: "Uber Ride",
        subtitle: "Transport",
        icon: Icons.directions_car,
        iconBackground: Colors.deepPurple,
        amount: "-\$15.75",
        method: "PayPal",
      ),
    ],
  ),
  TransactionDay(
    day: "Yesterday",
    transactions: [
      Transaction(
        title: "Spotify Premium",
        subtitle: "Subscription",
        icon: Icons.music_note,
        iconBackground: Colors.green,
        amount: "-\$12.99",
        method: "Visa debit",
      ),
      Transaction(
        title: "Freelance Payment",
        subtitle: "Income",
        icon: Icons.work_outline,
        iconBackground: Colors.blue,
        amount: "+\$1,200.00",
        method: "Bank transfer",
      ),
    ],
  ),
  TransactionDay(
    day: "2 days ago",
    transactions: [
      Transaction(
        title: "Amazon Purchase",
        subtitle: "Shopping",
        icon: Icons.shopping_cart_outlined,
        iconBackground: Colors.orange,
        amount: "-\$89.50",
        method: "Mastercard",
      ),
    ],
  ),
];