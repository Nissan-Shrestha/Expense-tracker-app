import 'package:expense_tracker_app/viewmodels/expense_viewmodel.dart';
import 'package:expense_tracker_app/widgets/balance_header.dart';
import 'package:expense_tracker_app/widgets/expense_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'add_expense_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const Color primaryBlue = Color(0xFF4F46E5);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ExpenseViewModel>();

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      body: Column(
        children: [
          const BalanceHeader(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: vm.expenses.isEmpty
                  ? const Center(child: Text('No expenses yet'))
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Text(
                          'Recent Expenses',
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Expense List
                        Expanded(
                          child: ListView.builder(
                            itemCount: vm.expenses.length,
                            itemBuilder: (_, index) =>
                                ExpenseTile(expense: vm.expenses[index]),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryBlue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddExpenseScreen()),
          );
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
