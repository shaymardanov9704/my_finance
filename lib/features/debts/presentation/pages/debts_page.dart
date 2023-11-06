import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_finance/core/constants/constants.dart';
import 'package:my_finance/features/debts/data/models/debt.dart';
import 'package:my_finance/features/debts/data/repository/debts_box.dart';
import 'package:my_finance/features/debts/presentation/dialogs/debt_dialog.dart';
import 'package:my_finance/features/debts/presentation/widgets/debt_widget.dart';
import 'package:my_finance/features/debts/presentation/widgets/top_widget.dart';

import '../../../skeleton/widgets/custom_theme_switch_button.dart';

class DebtsPage extends StatefulWidget {
  const DebtsPage({super.key});

  @override
  State<DebtsPage> createState() => _DebtsPageState();
}

class _DebtsPageState extends State<DebtsPage> {
  int allDebts(List<Debt> debts) {
    final allDebts = debts.fold<int>(
      0,
      (previousValue, transaction) => transaction.isReturn
          ? previousValue + 0
          : previousValue - transaction.amount,
    );
    return allDebts;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(kDebtsPage),
          centerTitle: true,
          actions: const [
            CustomSwitchThemeWidget(),
          ],
        ),
        body: ValueListenableBuilder<Box<Debt>>(
          valueListenable: DebtsBox.getDebts().listenable(),
          builder: (context, box, _) {
            final debts = box.values.toList().cast<Debt>();
            if (debts.isEmpty) {
              return const Center(
                child: Text(
                  kNotExpenses,
                  style: TextStyle(fontSize: 24),
                ),
              );
            } else {
              return Column(
                children: [
                  const SizedBox(height: 24),
                  TopWidget(amount: allDebts(debts)),
                  const SizedBox(height: 24),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: debts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return DebtWidget(
                          debt: debts[index],
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => showDialog(
            context: context,
            builder: (context) => const DebtDialog(),
          ),
        ),
      );
}
