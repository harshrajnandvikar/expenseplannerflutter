import 'package:expense_tracker/models/expense_structure.dart';

import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expenses, {super.key});

  final ExpenseStructure expenses;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text(expenses.title),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Text('\$${expenses.amount.toString()}'),
              const Spacer(),
              Row(
                children: [
                  Icon(
                    categoryIcons[expenses.category],
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(expenses.formattedDate),
                ],
              )
            ],
          )
        ],
      ),
    ));
  }
}
