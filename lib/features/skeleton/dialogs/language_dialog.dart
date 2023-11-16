import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_finance/core/utils/app_text_styles.dart';
import 'package:my_finance/core/generated/locale_keys.g.dart';

class LanguageDialog extends StatelessWidget {
  const LanguageDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(LocaleKeys.changeLan.tr(), style: AppTextStyles.style700),
      ),
      content: Container(
        decoration: const BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.setLocale(const Locale("en", "EN"));
                },
                child: Text(LocaleKeys.english.tr(), style: AppTextStyles.style600),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.setLocale(const Locale("ru", "RU"));
                },
                child: Text(LocaleKeys.russian.tr(), style: AppTextStyles.style600),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.setLocale(const Locale("uz", "UZ"));
                },
                child: Text(LocaleKeys.uzbek.tr(), style: AppTextStyles.style600),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.setLocale(const Locale("uz", "CYR"));
                },
                child: Text(LocaleKeys.uzbekCyr.tr(), style: AppTextStyles.style600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
