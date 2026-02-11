import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/expense.dart';
import 'package:provider/provider.dart';
import '../viewmodels/expense_viewmodel.dart';

class ExpenseTile extends StatelessWidget {
  final Expense expense;

  const ExpenseTile({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // LEFT SIDE (title + date)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expense.title,
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  expense.date.toString().split(' ')[0],
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),

          // RIGHT SIDE (amount + delete)
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '- ₹ ${expense.amount.toStringAsFixed(2)}',
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.redAccent,
                ),
              ),
              const SizedBox(height: 4),
              GestureDetector(
                onTap: () {
                  context.read<ExpenseViewModel>().deleteExpense(expense.id);
                },
                child: const Icon(Icons.delete, size: 18, color: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
