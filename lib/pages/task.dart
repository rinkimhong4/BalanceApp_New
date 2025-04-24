import 'package:flutter/material.dart';
import 'package:mybalance/widget/app_header.dart';
import 'package:mybalance/widget/floating.dart';
import 'package:mybalance/widget/tabbar.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final Color primaryColor = Color(0xFF3629B7);

  String _selectedTab = 'progress';
  final _tasks = [
    Task(title: 'Reading Book', isCompleted: false),
    Task(title: 'Clean room', isCompleted: true),
    Task(title: 'Do Homework', isCompleted: false),
    Task(title: 'Running', isCompleted: false),
    Task(title: 'Reading Book', isCompleted: false),
    Task(title: 'Clean room', isCompleted: true),
    Task(title: 'Do Homework', isCompleted: false),
    Task(title: 'Running', isCompleted: false),
    Task(title: 'Reading Book', isCompleted: false),
    Task(title: 'Clean room', isCompleted: true),
    Task(title: 'Do Homework', isCompleted: false),
    Task(title: 'Running', isCompleted: false),
    Task(title: 'Clean ', isCompleted: true),
    Task(title: 'Clean room', isCompleted: true),
    Task(title: 'Clean room', isCompleted: true),
    Task(title: 'Clean rroom', isCompleted: true),
  ];

  get _filteredTasks =>
      _selectedTab == 'progress'
          ? _tasks.where((task) => !task.isCompleted).toList()
          : _tasks.where((task) => task.isCompleted).toList();

  get bodyApp => TabBarView(
    children: [
      _buildTaskList(context, 'progress'),
      _buildTaskList(context, 'completed'),
    ],
  );

  AppBar _buildAppBar() {
    return AppBar(
      title: BalanceHeader(userName: 'Kimhong', onBellPressed: () {}),
      bottom: TabBar(
        onTap:
            (index) => setState(
              () => _selectedTab = index == 0 ? 'progress' : 'completed',
            ),
        tabs: [TabItem(label: 'progress'), TabItem(label: 'completed')],
        labelStyle: TextStyle(fontSize: 16),
        labelColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: Colors.white,
        unselectedLabelColor: Colors.white60,
      ),
      centerTitle: true,
      backgroundColor: primaryColor,
    );
  }

  Widget _buildTaskList(BuildContext context, String tab) {
    _selectedTab = tab;
    List<Task> tasks = _filteredTasks;
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) => TaskItem(task: tasks[index]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: bodyApp,
        floatingActionButton: FloatingActionButtonWidget(),
      ),
    );
  }
}

class Task {
  String title;
  bool isCompleted;
  Task({required this.title, required this.isCompleted});
}

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.task});
  final Task task;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                    Text(
                      'Mar,03,2025  ',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Icon(Icons.access_time, size: 14, color: Colors.grey),
                    Text(
                      '12:12 AM',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            SingleChildScrollView(
              child: Row(
                children: [
                  Icon(
                    task.isCompleted
                        ? Icons.check_circle
                        : Icons.radio_button_unchecked,
                    color: task.isCompleted ? Colors.green : Colors.grey,
                  ),
                  SizedBox(width: 14),
                  Icon(Icons.delete, color: Colors.red),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
