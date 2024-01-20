import 'package:expense_tracker/src/models/expense.dart';
import 'package:expense_tracker/src/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
    this.expenses,
    this.onRemoveExpense, {
    super.key,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
          key: ValueKey(expenses[index]),
          onDismissed: (direction) {
            onRemoveExpense(expenses[index]);
          },
          child: ExpenseItem(expense: expenses[index])),
    );
  }
}
