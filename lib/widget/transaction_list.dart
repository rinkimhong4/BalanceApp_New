import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionList extends StatelessWidget {
  final List<Map<String, dynamic>> transactions;
  final Color incomeColor;
  final Color expenseColor;
  final String transactionType;

  const TransactionList({
    super.key,
    required this.transactions,
    required this.incomeColor,
    required this.expenseColor,
    required this.transactionType,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final group = transactions[index];
        List<Map<String, dynamic>> filteredItems;

        if (transactionType == 'All') {
          filteredItems = group['items'] as List<Map<String, dynamic>>;
        } else if (transactionType == 'Income') {
          filteredItems =
              group['items'].where((item) => item['isIncome'] as bool).toList();
        } else {
          filteredItems =
              group['items']
                  .where((item) => !(item['isIncome'] as bool))
                  .toList();
        }

        if (filteredItems.isEmpty) return const SizedBox.shrink();

        return _buildTransactionGroup(group, items: filteredItems);
      },
    );
  }

  Widget _buildTransactionGroup(
    Map<String, dynamic> group, {
    required List<Map<String, dynamic>> items,
  }) {
    double calculatedTotal = 0;
    for (var item in items) {
      double amount =
          double.tryParse(
            item['amount'].toString().replaceAll(RegExp(r'[^\d\.]'), ''),
          ) ??
          0;
      if ((item['amount'] as String).startsWith('+')) {
        calculatedTotal += amount;
      } else {
        calculatedTotal -= amount;
      }
    }

    String total =
        group['total']?.toString() ?? '\$${calculatedTotal.toStringAsFixed(2)}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                group['date'].toString(),
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Text(
                total,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        ...items.map((item) {
          return ListTile(
            leading: const Icon(
              Icons.monetization_on,
              color: Color(0xFF3629B7),
              size: 40,
            ),
            title: Text(
              item['title'].toString(),
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              item['datetime'].toString(),
              style: GoogleFonts.inter(fontSize: 14, color: Colors.grey),
            ),
            trailing: Text(
              item['amount'].toString(),
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: item['isIncome'] as bool ? incomeColor : expenseColor,
              ),
            ),
          );
        }),
        const SizedBox(height: 16),
      ],
    );
  }
}
