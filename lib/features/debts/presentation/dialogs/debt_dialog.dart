import 'package:flutter/material.dart';
import 'package:my_finance/features/debts/data/models/debt.dart';

class DebtDialog extends StatefulWidget {
  final Debt? debt;
  final Function(String name, int amount, bool isExpense) onClickedDone;

  const DebtDialog({
    Key? key,
    this.debt,
    required this.onClickedDone,
  }) : super(key: key);

  @override
  State<DebtDialog> createState() => _DebtDialogState();
}

class _DebtDialogState extends State<DebtDialog> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final amountController = TextEditingController();
  bool isReturns = false;

  @override
  void initState() {
    super.initState();

    if (widget.debt != null) {
      final debt = widget.debt!;
      nameController.text = debt.borrowerName;
      amountController.text = debt.amount.toString();
      isReturns = debt.isReturn;
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
    final isEditing = widget.debt != null;

    return AlertDialog(
      title: Text(isEditing ? 'Edit Transaction' : 'Add Transaction'),
      content: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 8),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Name',
                ),
                validator: (name) =>
                    name != null && name.isEmpty ? 'Enter a name' : null,
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
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
              widget.onClickedDone(name, amount, isReturns);
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}
