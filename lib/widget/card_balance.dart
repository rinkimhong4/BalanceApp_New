import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybalance/widget/budget_summary_card.dart';
import 'package:mybalance/widget/tabbar.dart';
import 'package:mybalance/widget/transaction_list.dart';

class CardBalanceWidget extends StatefulWidget {
  const CardBalanceWidget({super.key});

  @override
  State<CardBalanceWidget> createState() => _CardBalanceWidgetState();
}

class _CardBalanceWidgetState extends State<CardBalanceWidget> {
  final List _titleBudget = ['Income', 'Expense'];
  final List _iconBudget = [
    Icons.arrow_circle_up_sharp,
    Icons.arrow_circle_down_sharp,
  ];
  final List _dBudget = ['\$5000.00', '-\$10'];
  final List _colorBudget = [Color(0xFF3629B7), Colors.red];

  final List<Map<String, dynamic>> _transactions = [
    {
      'date': 'Today',
      'items': [
        {
          'title': 'Coffee',
          'datetime': '15/mar/2025 - 5:11am',
          'amount': '-\$10',
          'isIncome': false,
        },
        {
          'title': 'Salary',
          'datetime': '15/mar/2025 - 8:00am',
          'amount': '+\$5000',
          'isIncome': true,
        },
      ],
    },
    {
      'date': 'Yesterday',
      'items': [
        {
          'title': 'Groceries',
          'datetime': '14/mar/2025 - 6:30pm',
          'amount': '-\$50',
          'isIncome': false,
        },
        {
          'title': 'Freelance Work',
          'datetime': '14/mar/2025 - 3:00pm',
          'amount': '+\$200',
          'isIncome': true,
        },
      ],
    },
    {
      'date': '13/mar/2025',
      'items': [
        {
          'title': 'Electricity Bill',
          'datetime': '13/mar/2025 - 10:00am',
          'amount': '-\$100',
          'isIncome': false,
        },
        {
          'title': 'Gift',
          'datetime': '13/mar/2025 - 2:00pm',
          'amount': '+\$50',
          'isIncome': true,
        },
      ],
    },
    {
      'date': '19/mar/2025',
      'items': [
        {
          'title': 'Electricity Bill',
          'datetime': '13/mar/2025 - 10:00am',
          'amount': '-\$100',
          'isIncome': false,
        },
        {
          'title': 'Gift',
          'datetime': '13/mar/2025 - 2:00pm',
          'amount': '+\$50',
          'isIncome': true,
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return _buildBoyCard;
  }

  get _buildBoyCard {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 14),
            margin: EdgeInsets.all(16),
            height: 120,
            // decoration: BoxDecoration(
            //   color: Color(0xFF3629B7),
            //   borderRadius: BorderRadius.circular(20),
            // ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                _titleBudget.length,
                (index) => BudgetSummaryCard(
                  title: _titleBudget[index],
                  icon: _iconBudget[index],
                  amount: _dBudget[index],
                  color: _colorBudget[index],
                ),
              ),
            ),
          ),
          Row(
            children: [
              Padding(padding: EdgeInsets.all(8)),
              Text(
                'Recent transactions',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          DefaultTabController(
            length: 3,
            child: Column(
              children: [
                TabBar(
                  labelStyle: TextStyle(fontSize: 16),
                  indicatorColor: Color.fromARGB(255, 116, 107, 215),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Color(0xFF3629B7),
                  unselectedLabelColor: Colors.black54,
                  tabs: [
                    TabItem(label: 'All'),
                    TabItem(label: 'Income'),
                    TabItem(label: 'Expense'),
                  ],
                ),
                SizedBox(
                  height: 400,
                  child: TabBarView(
                    children: [
                      TransactionList(
                        transactions: _transactions,
                        incomeColor: Color(0xFF3629B7),
                        expenseColor: Colors.red,
                        transactionType: 'All',
                      ),
                      TransactionList(
                        transactions: _transactions,
                        incomeColor: const Color(0xFF05a56a),
                        expenseColor: Colors.red,
                        transactionType: 'Income',
                      ),
                      TransactionList(
                        transactions: _transactions,
                        incomeColor: const Color(0xFF05a56a),
                        expenseColor: Colors.red,
                        transactionType: 'Expense',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
