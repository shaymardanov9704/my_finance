import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_finance/core/constants/constants.dart';
import 'package:my_finance/core/extentions/string_extension.dart';
import 'package:my_finance/core/utils/app_colors.dart';
import 'package:my_finance/features/debts/presentation/pages/debts_page.dart';
import 'package:my_finance/features/skeleton/provider/theme_provider.dart';
import 'package:my_finance/features/expenses/presentation/pages/expenses_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

class Skeleton extends StatefulWidget {
  const Skeleton({Key? key}) : super(key: key);

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton> {
  final _controller = PersistentTabController();
  final List<Widget> _pages = const [
    ExpensesPage(),
    DebtsPage(),
    // StatisticsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final color = context.watch<ThemeProvider>().isDark
        ? AppColors.green
        : AppColors.primary;
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _pages,
      items: [
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            'assets/icons/wallet.svg',
            color: color,
          ),
          title: kExpenses.toCamelCase(),
          activeColorPrimary: color,
          inactiveColorPrimary: color,
        ),
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            'assets/icons/card_transfer.svg',
            color: color,
          ),
          title: kDebts.toCamelCase(),
          activeColorPrimary: color,
          inactiveColorPrimary: color,
        ),
      ],
      confineInSafeArea: true,
      backgroundColor: context.watch<ThemeProvider>().isDark
          ? AppColors.darkBackground
          : AppColors.background,
      resizeToAvoidBottomInset: true,
      hideNavigationBarWhenKeyboardShows: true,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.bounceIn,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style9,
    );
  }
}
