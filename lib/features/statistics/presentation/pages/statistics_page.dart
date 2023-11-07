import 'package:flutter/material.dart';
import 'package:my_finance/features/skeleton/widgets/custom_empty_screen.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CustomEmptyScreen(
          title: "Empty",
        ),
      ),
    );
  }
}
