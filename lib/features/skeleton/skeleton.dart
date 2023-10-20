import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_finance/features/debts/presentation/pages/debts_page.dart';
import 'package:my_finance/features/profile/profile_page.dart';
import 'package:my_finance/features/expenses/presentation/pages/expenses_page.dart';

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
    ProfilePage(),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: changePage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.doc),
            label: "Expenses",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.arrow_down_right_arrow_up_left),
            label: "Debts",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            label: "Profile",
          ),
        ],
      ),

      //AppBottomNavyBar(
      //         selectedIndex: _index,
      //         onItemSelected: changePage,
      //         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //         items:  [
      //           AppBottomNavyBarItem(),
      //           AppBottomNavyBarItem(),
      //           AppBottomNavyBarItem(),
      //         ],
      //       ),
    );
  }
}
