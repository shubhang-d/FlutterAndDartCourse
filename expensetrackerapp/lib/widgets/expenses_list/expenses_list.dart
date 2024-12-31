import 'package:expensetrackerapp/models/expense.dart';
import 'package:expensetrackerapp/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget{
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense
  });
  final void Function(Expense expense) onRemoveExpense;
  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: expenses.length, itemBuilder: (ctx, index) {
      return Dismissible(key: ValueKey(expenses[index]),
      background: Container(
        color: Theme.of(context).colorScheme.error.withAlpha(170),
        margin: EdgeInsets.symmetric(horizontal: Theme.of(context).cardTheme.margin!.horizontal),
      ),
       onDismissed: (direction) { onRemoveExpense(expenses[index]); },
       child: ExpensesItem(expenses[index]));
    });
  }
}