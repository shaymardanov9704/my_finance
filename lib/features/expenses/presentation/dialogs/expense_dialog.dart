import 'package:flutter/material.dart';
import 'package:my_finance/core/common/words.dart';
import 'package:my_finance/core/constants/constants.dart';
import 'package:my_finance/core/constants/enums.dart';
import 'package:my_finance/core/extentions/string_extension.dart';
import 'package:my_finance/core/utils/app_colors.dart';
import 'package:my_finance/core/utils/app_text_styles.dart';
import 'package:my_finance/features/expenses/data/models/expense.dart';
import 'package:my_finance/features/expenses/data/repository/expenses_box.dart';
import 'package:my_finance/features/skeleton/provider/theme_provider.dart';
import 'package:my_finance/features/skeleton/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class ExpenseDialog extends StatefulWidget {
  final Expense? expense;

  const ExpenseDialog({
    Key? key,
    this.expense,
  }) : super(key: key);

  @override
  State<ExpenseDialog> createState() => _ExpenseDialogState();
}

class _ExpenseDialogState extends State<ExpenseDialog> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final amountController = TextEditingController();
  String type = ExpenseType.other.name;
  bool refundable = false;
  final box = ExpensesBox.getExpenses();

  @override
  void initState() {
    super.initState();
    if (widget.expense != null) {
      final expense = widget.expense!;
      nameController.text = expense.name;
      amountController.text = expense.amount.toString();
      refundable = expense.refundable;
      type = expense.type;
    }
  }

  void addExpense(String name, int amount, bool refundable, String type) {
    final expense = Expense(
      name: name,
      amount: amount,
      refundable: refundable,
      createdDate: DateTime.now(),
      type: type,
    );
    box.add(expense);
  }

  void editExpense(Expense expense, String? name, int? amount, bool? refundable,
      String? type) {
    final editedExpense = Expense(
      name: name ?? expense.name,
      amount: amount ?? expense.amount,
      refundable: refundable ?? expense.refundable,
      createdDate: expense.createdDate,
      type: type ?? expense.type,
    );

    box.add(editedExpense);
    expense.delete();
  }

  @override
  void dispose() {
    nameController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.expense != null;
    return AlertDialog(
      title: Text(
        isEditing ? Words.edit.tr() : Words.add.tr(),
        textAlign: TextAlign.center,
      ),
      scrollable: true,
      content: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomTextField(
                controller: nameController,
                title: Words.title.tr(),
                validator: (name) =>
                    name != null && name.isEmpty ? kEnterName : null,
              ),
              CustomTextField(
                controller: amountController,
                title: Words.amount.tr(),
                keyboardType: TextInputType.number,
                validator: (amount) =>
                    amount != null && double.tryParse(amount) == null
                        ? kEnterAmount
                        : null,
              ),
              Wrap(
                spacing: 3,
                runSpacing: 0,
                children: ExpenseType.values
                    .map(
                      (e) => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  type == e.name ? Colors.lightGreen : null,
                            ),
                            onPressed: () => setState(() => type = e.name),
                            child: Center(
                              child: Text(
                                e.name.toString().toCamelCase(),
                                style: AppTextStyles.style500.copyWith(
                                  color: context.watch<ThemeProvider>().isDark
                                      ? AppColors.white
                                      : AppColors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
              CheckboxListTile(
                value: refundable,
                title: Text(Words.returnDate.tr()),
                onChanged: (_) {
                  setState(() => refundable = !refundable);
                },
              ),
            ],
          ),
        ),
      ),
      // actionsAlignment: MainAxisAlignment.center,
      actions: <Widget>[
        TextButton(
          child: Text(
            Words.cancel.tr(),
            style: AppTextStyles.style600.copyWith(color: AppColors.green),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          child: Text(
            isEditing ? Words.save.tr() : Words.add.tr(),
            style: AppTextStyles.style600.copyWith(color: AppColors.green),
          ),
          onPressed: () async {
            final isValid = formKey.currentState!.validate();
            if (isValid) {
              if (isEditing) {
                final expense = widget.expense!;
                editExpense(
                  expense,
                  nameController.text,
                  int.tryParse(amountController.text) ?? 0,
                  refundable,
                  type,
                );
              } else {
                addExpense(
                  nameController.text,
                  int.tryParse(amountController.text) ?? 0,
                  refundable,
                  type,
                );
              }
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}
