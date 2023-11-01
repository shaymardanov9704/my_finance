import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_finance/core/utils/app_themes.dart';
import 'package:provider/provider.dart';
import 'package:my_finance/features/debts/data/models/debt.dart';
import 'package:my_finance/features/expenses/data/models/expense.dart';
import 'package:my_finance/features/skeleton/skeleton.dart';
import 'package:my_finance/provider/theme_provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(ExpenseAdapter());
  await Hive.openBox<Expense>('expenses');

  Hive.registerAdapter(DebtAdapter());
  await Hive.openBox<Debt>('debts');

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Economic App',
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeProvider>().currentTheme,
      darkTheme: AppThemes.dark(),
      home: const Skeleton(),
    );
  }
}

class ThemeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return ElevatedButton(
      onPressed: () {
        themeProvider.currentTheme == AppThemes.dark()
            ? themeProvider.setTheme(0)
            : themeProvider.setTheme(1); // Set dark theme
      },
      child: Text('Set Dark Theme'),
    );
  }
}
