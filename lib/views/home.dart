import 'package:bank_project/views/analytics_view.dart';
import 'package:bank_project/views/chat_view.dart';
import 'package:bank_project/views/credit_card_view.dart';
import 'package:bank_project/views/history_view.dart';
import 'package:bank_project/views/home_view.dart';
import 'package:bank_project/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeViewState();
}

class _HomeViewState extends State<Home> {
  int _selectedIndex = 0;

  final List<IconData> _icons = [
    Icons.home,
    Icons.credit_card,
    Icons.analytics,
    Icons.chat_bubble_outline,
    Icons.history,
  ];

  final List<Widget> _pages = [
    const HomeView(),
    const CreditCardView(),
    AnalyticsView(),
    const ChatView(),
    const HistoryView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
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
