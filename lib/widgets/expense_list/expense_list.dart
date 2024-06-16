import 'package:expense_tracker/widgets/expense_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense_structure.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    super.key,
    required this.expenses,
  });

  final List<ExpenseStructure> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: ((context, index) => ExpenseItem(
            expenses[index],
          )),
    );
  }
}
