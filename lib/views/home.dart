import 'package:bank_project/views/analytics_view.dart';
import 'package:bank_project/views/credit_card_view.dart';
import 'package:bank_project/views/home_view.dart';
import 'package:bank_project/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeViewState();
}

class _HomeViewState extends State<Home> {
  int _selectedIndex = 1;

  final List<IconData> _icons = [
    Icons.credit_card,
    Icons.home,
    Icons.analytics,
  ];

  final List<Widget> _pages = [
    const CreditCardView(),
    const HomeView(),
    AnalyticsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 1 ? const AppBarWidget() : null,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.grey.shade600,
        items:
            _icons
                .map(
                  (icon) =>
                      BottomNavigationBarItem(icon: Icon(icon), label: ''),
                )
                .toList(),
      ),
    );
  }
}
