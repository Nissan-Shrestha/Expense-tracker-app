import 'package:flutter/material.dart';
import 'dart:math';
import '../models/expense.dart';
import '../models/balance.dart';

class ExpenseViewModel extends ChangeNotifier {
  Balance _balance = const Balance(amount: 12450);
  final List<Expense> _expenses = [];

  Balance get balance => _balance;
  List<Expense> get expenses => List.unmodifiable(_expenses);

  void addExpense(String title, double amount) {
    final expense = Expense(
      id: Random().nextDouble().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    _expenses.insert(0, expense);

    _balance = _balance.copyWith(
      amount: _balance.amount - amount,
    );

    notifyListeners();
  }

  void deleteExpense(String id) {
    final expense = _expenses.firstWhere((e) => e.id == id);

    _expenses.removeWhere((e) => e.id == id);

    _balance = _balance.copyWith(
      amount: _balance.amount + expense.amount,
    );

    notifyListeners();
  }

  void updateBalance(double newAmount) {
    _balance = _balance.copyWith(amount: newAmount);
    notifyListeners();
  }
}
