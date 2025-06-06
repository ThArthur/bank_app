import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Transaction {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconBackground;
  final String amount;
  final String method;

  Transaction({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconBackground,
    required this.amount,
    required this.method,
  });
}

final List<Transaction> fakeTransactions = [
  Transaction(
    title: "Dribble Subscription",
    subtitle: "Payment",
    icon: Icons.settings_bluetooth_outlined,
    iconBackground: Colors.pinkAccent,
    amount: "-\$634.23",
    method: "Personal credit card",
  ),
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
  Transaction(
    title: "Amazon Purchase",
    subtitle: "Shopping",
    icon: Icons.shopping_cart_outlined,
    iconBackground: Colors.orange,
    amount: "-\$89.50",
    method: "Mastercard",
  ),
  Transaction(
    title: "Uber Ride",
    subtitle: "Transport",
    icon: Icons.directions_car,
    iconBackground: Colors.deepPurple,
    amount: "-\$15.75",
    method: "PayPal",
  ),
];