import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_finance/core/common/words.dart';
import 'package:my_finance/core/constants/constants.dart';
import 'package:my_finance/core/utils/app_colors.dart';
import 'package:my_finance/core/utils/app_text_styles.dart';
import 'package:my_finance/features/debts/data/models/debt.dart';
import 'package:my_finance/features/debts/data/repository/debts_box.dart';
import 'package:my_finance/features/skeleton/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class DebtsInfoWidget extends StatefulWidget {
  const DebtsInfoWidget({Key? key}) : super(key: key);

  @override
  State<DebtsInfoWidget> createState() => _DebtsInfoWidgetState();
}

class _DebtsInfoWidgetState extends State<DebtsInfoWidget> {
  int amount(List<Debt> debts) {
    final amount = debts.fold<int>(
        0,
        (previousValue, debt) =>
            debt.isReturn ? previousValue + 0 : previousValue - debt.amount);
    return amount;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeProvider>().isDark;
    return ValueListenableBuilder(
        valueListenable: DebtsBox.getDebts().listenable(),
        builder: (context, box, _) {
          final debts = box.values.toList().cast<Debt>();
          return Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                tileMode: TileMode.repeated,
                colors: isDark
                    ? [
                        AppColors.darCard,
                        AppColors.darkBackground,
                      ]
                    : [
                        AppColors.card,
                        AppColors.white,
                      ],
              ),
              boxShadow: [
                BoxShadow(
                  color: isDark ? AppColors.green : AppColors.black,
                  offset: const Offset(0.6, 0.6),
                  blurRadius: 0.4,
                  spreadRadius: 0.4,
                )
              ],
            ),
            child: Column(
              children: [
                Text(
                  Words.debtsOffAllTime.tr(),
                  textAlign: TextAlign.center,
                  style: AppTextStyles.style600.copyWith(fontSize: 20),
                ),
                Text(
                  "${amount(debts)} ${Words.som.tr()}",
                  style: AppTextStyles.style600.copyWith(
                    fontSize: 20,
                    color: amount(debts) >= 0 ? AppColors.green : AppColors.red,
                  ),
                )
              ],
            ),
          );
        });
  }
}
