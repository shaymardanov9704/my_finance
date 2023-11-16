import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_finance/core/utils/app_colors.dart';
import 'package:my_finance/features/debts/data/models/debt.dart';
import 'package:my_finance/features/debts/data/repository/debts_box.dart';
import 'package:my_finance/features/debts/presentation/dialogs/debt_dialog.dart';
import 'package:my_finance/features/debts/presentation/widgets/debt_widget.dart';
import 'package:my_finance/features/skeleton/provider/theme_provider.dart';
import 'package:my_finance/features/skeleton/widgets/custom_empty_screen.dart';
import 'package:my_finance/core/generated/locale_keys.g.dart';
import 'package:provider/provider.dart';

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
        body: ValueListenableBuilder<Box<Debt>>(
          valueListenable: DebtsBox.getDebts().listenable(),
          builder: (context, box, _) {
            final debts = box.values.toList().cast<Debt>();
            if (debts.isEmpty) {
              return  Center(
                child: CustomEmptyScreen(
                  title: LocaleKeys.noDebtsYet.tr(),
                  iconPath: "assets/icons/empty_debts.svg",
                ),
              );
            } else {
              return Column(
                children: [
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
          onPressed: () => showDialog(
            context: context,
            builder: (context) => const DebtDialog(),
          ),
          child: Icon(
            Icons.add,
            color: context.watch<ThemeProvider>().isDark
                ? AppColors.green
                : AppColors.primary,
          ),
        ),
      );
}
