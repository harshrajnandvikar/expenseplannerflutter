import 'package:expense_tracker/widgets/expense_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense_structure.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final void Function(ExpenseStructure expenses) onRemoveExpense;

  final List<ExpenseStructure> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: ((context, index) => Dismissible(
          key: ValueKey(expenses[index]),
          background: Container(
            margin: EdgeInsets.symmetric(
                vertical: Theme.of(context).cardTheme.margin!.vertical,
                horizontal: Theme.of(context).cardTheme.margin!.horizontal),
            color: Theme.of(context).colorScheme.error.withOpacity(0.25),
          ),
          onDismissed: (direction) {
            onRemoveExpense(expenses[index]);
          },
          child: ExpenseItem(
            expenses[index],
          ))),
    );
  }
}
