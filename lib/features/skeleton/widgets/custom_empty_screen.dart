import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_finance/core/utils/app_text_styles.dart';

class CustomEmptyScreen extends StatelessWidget {
  final String title;

  const CustomEmptyScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/icons/empty_wallet.svg'),
        Text(
          title,
          style: AppTextStyles.style600.copyWith(fontSize: 24),
        ),
      ],
    );
  }
}
