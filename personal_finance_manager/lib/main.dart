import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/expense_log_screen.dart';
import 'screens/analytics_screen.dart';

void main() {
  runApp(PersonalFinanceManagerApp());
}

class PersonalFinanceManagerApp extends StatefulWidget {
  @override
  _PersonalFinanceManagerAppState createState() => _PersonalFinanceManagerAppState();
}

class _PersonalFinanceManagerAppState extends State<PersonalFinanceManagerApp> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    ExpenseLogScreen(),
    AnalyticsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Finance Manager',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personal Finance Manager'),
        ),
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Expenses'),
            BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'Analytics'),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
