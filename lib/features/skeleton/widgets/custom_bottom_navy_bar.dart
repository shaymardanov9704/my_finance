import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_finance/core/utils/app_colors.dart';
import 'package:my_finance/core/utils/app_text_styles.dart';

class CustomBottomNavyBar extends StatelessWidget {
  const CustomBottomNavyBar({
    Key? key,
    this.selectedIndex = 0,
    this.iconSize = 24,
    this.backgroundColor,
    this.animationDuration = const Duration(milliseconds: 270),
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    required this.items,
    required this.onItemSelected,
    this.curve = Curves.linear,
  })  : assert(items.length >= 2 && items.length <= 5),
        super(key: key);

  final int selectedIndex;
  final double iconSize;
  final Color? backgroundColor;

  final Duration animationDuration;
  final List<CustomBottomNavyBarItem> items;
  final ValueChanged<int> onItemSelected;
  final MainAxisAlignment mainAxisAlignment;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor;

    return SafeArea(
      child: BottomAppBar(
        padding: EdgeInsets.zero,
        child: Container(
          height: 80,
          padding: const EdgeInsets.only(top: 12),
          child: Center(
            child: Row(
              mainAxisAlignment: mainAxisAlignment,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: items.map(
                (item) {
                  var index = items.indexOf(item);
                  return GestureDetector(
                    onTap: () => onItemSelected(index),
                    child: _ItemWidget(
                      item: item,
                      iconSize: iconSize,
                      isSelected: index == selectedIndex,
                      backgroundColor: bgColor ?? Colors.blue,
                      animationDuration: animationDuration,
                      curve: curve,
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  final double iconSize;
  final bool isSelected;
  final CustomBottomNavyBarItem item;
  final Color backgroundColor;
  final Duration animationDuration;
  final Curve curve;

  const _ItemWidget({
    Key? key,
    required this.item,
    required this.isSelected,
    required this.backgroundColor,
    required this.animationDuration,
    required this.iconSize,
    this.curve = Curves.linear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      selected: isSelected,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedContainer(
            width: isSelected ? 120 : 45,
            height: 45,
            duration: animationDuration,
            curve: curve,
            padding: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              color: item.activeColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: isSelected
                    ? MainAxisAlignment.spaceAround
                    : MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    item.path,
                    width: isSelected ? 32 : 28,
                    color: AppColors.white,
                    //:AppColors.black,//context.watch<ThemeProvider>().isDark?
                  ),
                  Text(
                    isSelected ? item.title : "",
                    style: AppTextStyles.style600.copyWith(
                      color: AppColors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomBottomNavyBarItem {
  CustomBottomNavyBarItem({
    required this.path,
    required this.title,
    this.activeColor = Colors.blue,
    this.inactiveColor,
  });

  final String path;
  final String title;
  final Color activeColor;
  final Color? inactiveColor;
}
