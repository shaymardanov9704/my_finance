import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_finance/core/generated/codegen_loader.g.dart';

class App extends StatelessWidget {
  final Widget child;
  final bool enabledPreview;

  const App({
    Key? key,
    required this.child,
    this.enabledPreview = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [
        Locale("uz", "UZ"),
        Locale("uz", "CYR"),
        Locale("ru", "RU"),
        Locale("en", "EN"),
      ],
      path: 'assets/tr',
      fallbackLocale: const Locale("uz", "UZ"),
      startLocale: const Locale("uz", "UZ"),
      assetLoader: const CodegenLoader(),
      saveLocale: true,
      child: child,
    );
  }
}
