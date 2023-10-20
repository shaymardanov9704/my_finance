import 'package:flutter/material.dart';
import 'package:my_finance/pages/expenses/data/models/expense.dart';

class ExpenseDialog extends StatefulWidget {
  final Expense? expense;
  final Function(String name, int amount, bool refundable, String type)
      onClickedDone;

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
  String type = ExpenseType.other.name;
  bool refundable = false;

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
        isEditing ? 'Edit Transaction' : 'Add Transaction',
        textAlign: TextAlign.center,
      ),
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
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: 'Enter Name',
                ),
                validator: (name) =>
                    name != null && name.isEmpty ? 'Enter a name' : null,
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
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
              const SizedBox(height: 16),
              SizedBox(
                width: 400,
                height: 34,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: ExpenseType.values.length,
                  itemBuilder: (_, i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: type == ExpenseType.values[i].name
                              ? Colors.lightGreen
                              : Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                        ),
                        onPressed: () => setState(
                          () => type = ExpenseType.values[i].name,
                        ),
                        child: Center(
                          child: Text(ExpenseType.values[i].name.toString()),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, i) => const SizedBox(width: 6),
                ),
              ),
              const SizedBox(height: 8),
              CheckboxListTile(
                value: refundable,
                title: const Text('Refundable'),
                onChanged: (_) {
                  setState(() => refundable = !refundable);
                },
              ),
            ],
          ),
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: <Widget>[
        ElevatedButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        const SizedBox(width: 25),
        ElevatedButton(
          child: Text(isEditing ? 'Save' : 'Add'),
          onPressed: () async {
            final isValid = formKey.currentState!.validate();
            if (isValid) {
              widget.onClickedDone(
                nameController.text,
                int.tryParse(amountController.text) ?? 0,
                refundable,
                type,
              );
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}
