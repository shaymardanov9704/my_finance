import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_finance/core/utils/app_colors.dart';
import 'package:my_finance/features/debts/presentation/pages/debts_page.dart';
import 'package:my_finance/features/statistics/statistics_page.dart';
import 'package:my_finance/features/expenses/presentation/pages/expenses_page.dart';
import 'package:my_finance/features/skeleton/widgets/custom_bottom_navy_bar.dart';

class Skeleton extends StatefulWidget {
  const Skeleton({Key? key}) : super(key: key);

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton> {
  int _index = 0;

  final List<Widget> _pages = const [
    ExpensesPage(),
    DebtsPage(),
    // StatisticsPage(),
  ];

  changePage(int i) {
    setState(() {
      _index = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: _pages,
      ),
      bottomNavigationBar: CustomBottomNavyBar(
        selectedIndex: _index,
        onItemSelected: changePage,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        items: [
          CustomBottomNavyBarItem(
            path: 'assets/icons/wallet.svg',
            activeColor: AppColors.black,
          ),
          CustomBottomNavyBarItem(
            path: 'assets/icons/card_transfer.svg',
            activeColor: AppColors.black,
          ),
          // CustomBottomNavyBarItem(
          //   path: 'assets/icons/statistics.svg',
          //   activeColor: AppColors.black,
          // ),
        ],
      ),
    );
  }
}
