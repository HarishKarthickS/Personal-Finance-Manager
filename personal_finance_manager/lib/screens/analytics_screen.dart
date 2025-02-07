import 'package:flutter/material.dart';

class AnalyticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Future implementation: Integrate charts and spending trend visualizations.
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          'Analytics coming soon!\n\nThis section will provide visual insights into your spending habits and budget trends.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
