import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BalanceCard extends StatelessWidget {
  final String title;
  final double balance;
  final VoidCallback? onToggleVisibility;
  final bool isVisible;

  const BalanceCard({
    super.key,
    required this.title,
    required this.balance,
    this.onToggleVisibility,
    required this.isVisible,
  });

  @override
  Widget build(BuildContext context) {
    final formattedBalance = NumberFormat.simpleCurrency().format(balance);

    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
      
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  child: isVisible
                      ? Text(
                    formattedBalance,
                    key: ValueKey('balance'),
                    style: TextStyle(fontSize: 32),
                  )
                      : Text(
                    '••••••',
                    key: ValueKey('hidden'),
                    style: TextStyle(fontSize: 32),
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: onToggleVisibility,
              icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
            ),
          ],
        ),
      ),
    );
  }
}
