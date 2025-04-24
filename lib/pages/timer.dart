import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybalance/widget/alarm_items.dart';
import 'package:mybalance/widget/app_header.dart';
import 'package:mybalance/widget/floating.dart';
import 'package:mybalance/widget/tabbar.dart';

const Color primaryColor = Color(0xFF3629B7);

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(context),
        floatingActionButton: FloatingActionButtonWidget(),
      ),
    );
  }
}

AppBar _buildAppBar() {
  return AppBar(
    title: BalanceHeader(userName: 'Kimhong', onBellPressed: () {}),
    centerTitle: true,
    backgroundColor: primaryColor,
    bottom: TabBar(
      tabs: [TabItem(label: 'Timer'), TabItem(label: 'Alarm')],
      labelStyle: TextStyle(fontSize: 16),
      labelColor: Colors.white,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: Colors.white,
      unselectedLabelColor: Colors.white60,
    ),
  );
}

Widget _buildBody(BuildContext context) {
  return CustomScrollView(
    slivers: [
      SliverFillRemaining(
        child: TabBarView(children: [_TimerTab(), _AlarmTab()]),
      ),
    ],
  );
}

class _TimerTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _TimerCircle(time: "30:00", status: "Ready"),
          SizedBox(height: 40),
          _TimerControls(),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}

class _TimerCircle extends StatelessWidget {
  final String? time;
  final String? status;

  const _TimerCircle({this.time, this.status});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 250,
          width: 250,
          child: CircularProgressIndicator(
            value: 1,
            strokeWidth: 4,
            color: primaryColor.withAlpha(100),
            backgroundColor: Colors.grey.shade200,
          ),
        ),
        Text(
          time!,
          style: GoogleFonts.inter(fontSize: 36, fontWeight: FontWeight.bold),
        ),
        Positioned(
          top: 180,
          child: Text(
            status!,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}

class _TimerControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/loop.svg',
            width: 38,
            height: 38,
            colorFilter: ColorFilter.mode(
              primaryColor.withAlpha(70),
              BlendMode.srcIn,
            ),
          ),
        ),
        const SizedBox(width: 20),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.play_circle_outline, size: 80, color: primaryColor),
        ),
        const SizedBox(width: 20),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/skip-next.svg',
            width: 35,
            height: 35,
            colorFilter: ColorFilter.mode(
              primaryColor.withAlpha(60),
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }
}

class _AlarmTab extends StatelessWidget {
  final List<Map<String, dynamic>> alarms = [
    {"time": "7:00 AM", "label": "Wake up", "color": primaryColor},
    {"time": "8:00 AM", "label": "Breakfast", "color": Colors.orange},
    {"time": "11:00 AM", "label": "Lunch Break", "color": Colors.green},
    {"time": "12:45 PM", "label": "Go to school", "color": Colors.amber},
    {"time": "6:00 PM", "label": "Dinner Time", "color": Colors.red},
    {
      "time": "6:00 PM",
      "label": "Online class",
      "color": Colors.deepPurpleAccent,
    },
    {"time": "9:00 PM", "label": "Workout", "color": Colors.blue},
    {"time": "10:00 PM", "label": "Reading", "color": Colors.teal},
    {"time": "11:30 PM", "label": "Sleep", "color": Colors.indigo},
    {"time": "5:30 AM", "label": "Morning Jog", "color": Colors.pinkAccent},
    {"time": "7:30 AM", "label": "Meditation", "color": Colors.cyan},
    {"time": "9:00 AM", "label": "Team Meeting", "color": Colors.brown},
    {"time": "3:00 PM", "label": "Coffee Break", "color": Colors.lime},
    {"time": "4:00 PM", "label": "Project Work", "color": Colors.purple},
    {"time": "8:30 PM", "label": "Family Time", "color": Colors.yellow},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: alarms.length,
      itemBuilder: (context, index) {
        final alarm = alarms[index];
        return AlarmItem(
          time: alarm['time'],
          label: alarm['label'],
          color: alarm['color'],
        );
      },
    );
  }
}
