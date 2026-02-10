import 'package:expense_tracker_app/widgets/balance_header.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/expense_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const Color primaryBlue = Color(0xFF4F46E5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      body: Column(
        children: [
          const BalanceHeader(),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recent Expenses',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  Expanded(
                    child: ListView(
                      children: const [
                        ExpenseTile(
                          title: 'Lunch',
                          date: 'Today',
                          amount: '- ₹ 500',
                        ),
                        ExpenseTile(
                          title: 'Transport',
                          date: 'Yesterday',
                          amount: '- ₹ 200',
                        ),
                        ExpenseTile(
                          title: 'Groceries',
                          date: 'April 10',
                          amount: '- ₹ 1,200',
                        ),
                      ],
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
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (_) => const AddExpenseScreen(),
          //   ),
          // );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
