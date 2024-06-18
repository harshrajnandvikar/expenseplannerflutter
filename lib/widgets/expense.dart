import 'package:expense_tracker/models/expense_structure.dart';
import 'package:expense_tracker/widgets/new_expenses.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expense_list/expense_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<ExpenseStructure> _registeredexpenses = [
    ExpenseStructure(
      title: 'Flutter Course',
      amount: 19.99,
      category: Category.leisure,
      date: DateTime.now(),
    ),
    ExpenseStructure(
      title: 'Food',
      amount: 10.25,
      category: Category.food,
      date: DateTime.now(),
    ),
    ExpenseStructure(
      title: 'Work',
      amount: 10.25,
      category: Category.work,
      date: DateTime.now(),
    ),
  ];

  void addSomeOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpenses(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _addExpense(ExpenseStructure expenses) {
    setState(() {
      _registeredexpenses.add(expenses);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tacker'),
        actions: [
          IconButton(
            onPressed: addSomeOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('Chart'),
          Expanded(
            child: ExpenseList(expenses: _registeredexpenses),
          ),
        ],
      ),
    );
  }
}
