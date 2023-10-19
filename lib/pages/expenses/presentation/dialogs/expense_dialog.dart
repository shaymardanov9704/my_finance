import 'package:flutter/material.dart';
import 'package:my_finance/model/transaction.dart';
import 'package:my_finance/pages/expenses/data/models/expense.dart';

class ExpenseDialog extends StatefulWidget {
  final Expense? expense;
  final Function(
    String name,
    int amount,
    bool isExpense,
    ExpenseType type,
  ) onClickedDone;

  const ExpenseDialog({
    Key? key,
    this.expense,
    required this.onClickedDone,
  }) : super(key: key);

  @override
  State<ExpenseDialog> createState() => _ExpenseDialogState();
}

class _ExpenseDialogState extends State<ExpenseDialog> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final amountController = TextEditingController();

  bool isExpense = true;

  @override
  void initState() {
    super.initState();
    if (widget.expense != null) {
      final expense = widget.expense!;
      nameController.text = expense.name;
      amountController.text = expense.amount.toString();
      isExpense = expense.refundable;
    }
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
    final title = isEditing ? 'Edit Transaction' : 'Add Transaction';
    return AlertDialog(
      title: Text(title),
      scrollable: true,
      content: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 8),
              TextFormField(
                controller: nameController,
                decoration:  InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16)
                  ),
                  hintText: 'Enter Name',
                ),
                validator: (name) =>
                    name != null && name.isEmpty ? 'Enter a name' : null,
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration:  InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)
                  ),
                  hintText: 'Enter Amount',
                ),
                keyboardType: TextInputType.number,
                validator: (amount) =>
                    amount != null && double.tryParse(amount) == null
                        ? 'Enter a valid number'
                        : null,
                controller: amountController,
              ),
              const SizedBox(height: 8),
              Column(
                children: [
                  RadioListTile<bool>(
                    title: const Text('Expense'),
                    value: true,
                    groupValue: isExpense,
                    onChanged: (value) => setState(() => isExpense = value!),
                  ),
                  RadioListTile<bool>(
                    title: const Text('Income'),
                    value: false,
                    groupValue: isExpense,
                    onChanged: (value) => setState(() => isExpense = value!),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          child: Text(isEditing ? 'Save' : 'Add'),
          onPressed: () async {
            final isValid = formKey.currentState!.validate();
            if (isValid) {
              final name = nameController.text;
              final amount = int.tryParse(amountController.text) ?? 0;
              widget.onClickedDone(
                name,
                amount,
                isExpense,
                ExpenseType.donation,
              );
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}
