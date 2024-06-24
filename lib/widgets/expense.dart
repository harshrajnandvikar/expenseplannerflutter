import 'package:expense_tracker/models/expense_structure.dart';
import 'package:expense_tracker/widgets/new_expenses.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expense_list/expense_list.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:flutter/widgets.dart';

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
      useSafeArea: true,
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

  void _removeExpense(ExpenseStructure expenses) {
    final expenseIndex = _registeredexpenses.indexOf(expenses);
    setState(() {
      _registeredexpenses.remove(expenses);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('The Expense is Removed.'),
        duration: const Duration(seconds: 5),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _registeredexpenses.insert(expenseIndex, expenses);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width);
    Widget mainContent = const Center(
      child: Text('There are No Expense Added!'),
    );
    if (_registeredexpenses.isNotEmpty) {
      mainContent = ExpenseList(
        expenses: _registeredexpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Expense Tracker'),
          actions: [
            IconButton(
              onPressed: addSomeOverlay,
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: width < 600
            ? Column(
                children: [
                  Chart(expenses: _registeredexpenses),
                  Expanded(child: mainContent),
                ],
              )
            : Row(
                children: [
                  Expanded(child: Chart(expenses: _registeredexpenses)),
                  Expanded(child: mainContent),
                ],
              ));
  }
}
