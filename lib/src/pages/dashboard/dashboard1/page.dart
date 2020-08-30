import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import 'donut_pie_chart.dart';
import 'models.dart';
import 'data.dart';
import 'titled_container.dart';
import 'stat_card.dart';
import 'activity_info.dart';

class Dashboard1Page extends StatelessWidget {
  static final String path = "lib/src/pages/dashboard/dashboard1/page.dart";

  final List<Activity> activities = getActivities();
  final chartSampleData = getChartSampleData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).buttonColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        titleSpacing: 0,
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: Text(
          "Dashboard",
          style: _blackBoldS20Style,
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
            iconSize: 40,
            padding: _insets0,
            icon: CircleAvatar(
              backgroundColor: Colors.grey.shade300,
              child: CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(_avatarImage),
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          _statsGrid,
          _salesChart,
          _activityGrid,
        ],
      ),
    );
  }

  Widget get _statsGrid {
    return SliverPadding(
      padding: _insets16,
      sliver: SliverGrid.count(
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.5,
        crossAxisCount: 3,
        children: [
          StatCard(title: 'Leads', value: 500, color: Colors.blue),
          StatCard(title: 'Customers', value: 300, color: Colors.pink),
          StatCard(title: 'Orders', value: 1200, color: Colors.green),
        ],
      ),
    );
  }

  Widget get _salesChart {
    return SliverToBoxAdapter(
      child: Padding(
        padding: _insets16,
        child: TitledContainer(
          title: "Sales",
          child: Container(
            height: 200,
            child: DonutPieChart(chartSampleData, animate: false),
          ),
        ),
      ),
    );
  }

  Widget get _activityGrid {
    return SliverPadding(
      padding: _insets16,
      sliver: SliverToBoxAdapter(
        child: TitledContainer(
          title: "Activities",
          height: 280,
          child: Expanded(
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              children: activities.map((x) => ActivityInfo(title: x.title, icon: x.icon)).toList(),
            ),
          ),
        ),
      ),
    );
  }

  final _avatarImage = '$STORE_BASE_URL/img%2F2.jpg?alt=media';

  final _blackBoldS20Style = TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20);

  final _insets0 = EdgeInsets.all(0);
  final _insets16 = EdgeInsets.all(16);
}
