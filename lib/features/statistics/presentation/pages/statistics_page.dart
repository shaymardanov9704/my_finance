import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_finance/core/utils/app_text_styles.dart';
import 'package:my_finance/features/debts/presentation/widgets/top_widget.dart';
import 'package:my_finance/features/expenses/data/models/expense.dart';
import 'package:my_finance/features/expenses/presentation/widgets/top_widget.dart';
import 'package:my_finance/features/skeleton/widgets/custom_empty_screen.dart';
import 'package:my_finance/features/statistics/data/repository/statistic_repository.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  List<_PieData> calculate(List<Expense> expenses) {
    Map<String, int> totalAmountByType = {};

    for (var expense in expenses) {
      if (totalAmountByType.containsKey(expense.type)) {
        totalAmountByType[expense.type] =
            totalAmountByType[expense.type]! + expense.amount;
      } else {
        totalAmountByType[expense.type] = expense.amount;
      }
    }

    List<_PieData> results = totalAmountByType.entries
        .map((entry) => _PieData(entry.key, entry.value))
        .toList();
    return results;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: StatisticRepository.getExpenses().listenable(),
      builder: (context, box, _) {
        final expenses = box.values.toList();

        if (expenses.isEmpty) {
          return const Center(
            child: CustomEmptyScreen(
              title: "Empty",
              iconPath: "assets/icons/empty_wallet.svg",
            ),
          );
        }
        return Scaffold(
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: <Widget>[
              const SizedBox(height: 24),
              const DebtsInfoWidget(),
              const Divider(),
              const ExpensesInfoWidget(),
              const Divider(),
              Center(
                child: SfCircularChart(
                  title: ChartTitle(text: 'Xarajatlar diagram'),
                  legend: const Legend(
                    isVisible: true,
                    position: LegendPosition.bottom,
                    shouldAlwaysShowScrollbar: true,
                  ),
                  margin: EdgeInsets.zero,
                  series: <PieSeries<_PieData, String>>[
                    PieSeries<_PieData, String>(
                      explode: false,
                      dataSource: calculate(expenses),
                      xValueMapper: (_PieData data, _) => data.title,
                      yValueMapper: (_PieData data, _) => data.amount,
                      dataLabelSettings: DataLabelSettings(
                        isVisible: true,
                        labelPosition: ChartDataLabelPosition.outside,
                        builder: (data, point, series, int p, int s) => Text(
                          "${(data as _PieData).amount} ming",
                          style: AppTextStyles.style600.copyWith(fontSize: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider()
            ],
          ),
        );
      },
    );
  }
}

class _PieData {
  _PieData(this.title, this.amount);

  String title;
  int amount;

  void setAmount(int amountT) {
    amount += amountT;
  }
}