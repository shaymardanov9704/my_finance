import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_finance/core/common/words.dart';
import 'package:my_finance/core/constants/constants.dart';
import 'package:my_finance/core/utils/app_colors.dart';
import 'package:my_finance/features/debts/data/models/debt.dart';
import 'package:my_finance/features/debts/data/repository/debts_box.dart';
import 'package:my_finance/features/skeleton/widgets/custom_text_field.dart';

import '../../../../core/utils/app_text_styles.dart';

class DebtDialog extends StatefulWidget {
  final Debt? debt;

  const DebtDialog({
    Key? key,
    this.debt,
  }) : super(key: key);

  @override
  State<DebtDialog> createState() => _DebtDialogState();
}

class _DebtDialogState extends State<DebtDialog> {
  final formKey = GlobalKey<FormState>();
  final borrowerNameController = TextEditingController();
  final amountController = TextEditingController();
  final returnDateController = TextEditingController();
  DateTime returnDate = DateTime.now();
  bool isReturns = false;
  final box = DebtsBox.getDebts();

  @override
  void initState() {
    super.initState();

    if (widget.debt != null) {
      final debt = widget.debt!;
      borrowerNameController.text = debt.borrowerName;
      amountController.text = debt.amount.toString();
      returnDate = debt.returnDate;
      isReturns = debt.isReturn;
    }
  }

  void editDebt(
    Debt debt,
    String borrowerName,
    int amount,
    bool isReturn,
    DateTime returnDate,
  ) {
    final editedDebt = Debt(
      borrowerName: borrowerName,
      amount: amount,
      isReturn: isReturn,
      createdDate: debt.createdDate,
      returnDate: returnDate,
    );

    box.add(editedDebt);
    debt.delete();
  }

  void addDebt(
    String borrowerName,
    int amount,
    DateTime returnDate,
  ) {
    final debt = Debt(
      borrowerName: borrowerName,
      amount: amount,
      isReturn: false,
      createdDate: DateTime.now(),
      returnDate: returnDate,
    );

    box.add(debt);
  }

  @override
  void dispose() {
    borrowerNameController.dispose();
    amountController.dispose();
    returnDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.debt != null;

    return AlertDialog(
      title: Text(isEditing ? kEditDebt : kAddDebt),
      content: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CustomTextField(
                controller: borrowerNameController,
                title: Words.borrowerName.tr(),
                validator: (name) =>
                    name != null && name.isEmpty ? kEnterName : null,
              ),
              CustomTextField(
                title: Words.amount.tr(),
                keyboardType: TextInputType.number,
                validator: (amount) =>
                    amount != null && double.tryParse(amount) == null
                        ? kEnterAmount
                        : null,
                controller: amountController,
              ),
              CustomTextField(
                controller: returnDateController,
                title: DateFormat(kDateFormat).format(returnDate),
                readOnly: true,
                keyboardType: TextInputType.datetime,
                validator: (String? value) {
                  return null;
                },
                onTap: () async {
                  returnDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(
                          const Duration(days: 700),
                        ),
                      ) ??
                      returnDate;
                  setState(() {});
                },
              ),
              CheckboxListTile(
                title: Text(Words.isReturn.tr()),
                value: isReturns,
                onChanged: (value) {
                  setState(() {});
                  isReturns = value!;
                },
              ),
            ],
          ),
        ),
      ),
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
            isEditing ? Words.edit.tr() : Words.add.tr(),
            style: AppTextStyles.style600.copyWith(color: AppColors.green),
          ),
          onPressed: () async {
            final isValid = formKey.currentState!.validate();

            if (isValid) {
              if (isEditing) {
                final debt = widget.debt!;
                editDebt(
                  debt,
                  borrowerNameController.text,
                  int.tryParse(amountController.text) ?? 0,
                  isReturns,
                  returnDate,
                );
              } else {
                addDebt(
                  borrowerNameController.text,
                  int.tryParse(amountController.text) ?? 0,
                  returnDate,
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
