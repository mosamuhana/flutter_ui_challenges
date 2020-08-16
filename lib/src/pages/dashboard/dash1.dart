import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/constants.dart';

class DashboardOnePage extends StatelessWidget {
  static final String path = "lib/src/pages/dashboard/dash1.dart";

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
          _StatCard(title: 'Leads', value: 500, color: Colors.blue),
          _StatCard(title: 'Customers', value: 300, color: Colors.pink),
          _StatCard(title: 'Orders', value: 1200, color: Colors.green),
        ],
      ),
    );
  }

  Widget get _salesChart {
    return SliverToBoxAdapter(
      child: Padding(
        padding: _insets16,
        child: _TitledContainer(
          title: "Sales",
          child: Container(
            height: 200,
            child: _DonutPieChart(_chartSampleData, animate: false),
          ),
        ),
      ),
    );
  }

  Widget get _activityGrid {
    return SliverPadding(
      padding: _insets16,
      sliver: SliverToBoxAdapter(
        child: _TitledContainer(
          title: "Activities",
          height: 280,
          child: Expanded(
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              children: _activities.map((x) => _ActivityInfo(title: x.title, icon: x.icon)).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

// ----------------------------------------------------------------------------------
// Private Widgets ------------------------------------------------------------------
// ----------------------------------------------------------------------------------

class _TitledContainer extends StatelessWidget {
  final String title;
  final double height;
  final Widget child;

  const _TitledContainer({
    Key key,
    this.title,
    this.height,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _insets16,
      width: double.infinity,
      height: height,
      decoration: _titledContainerDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: _boldS28Style),
          if (child != null) ...[_hbox10, child],
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final int value;
  final Color color;

  const _StatCard({Key key, this.title, this.value, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _insets8,
      decoration: BoxDecoration(
        borderRadius: _circularBorder10,
        color: color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('+$value', style: _whiteBoldS20Style),
          _hbox5,
          Text(title.toUpperCase()),
        ],
      ),
    );
  }
}

class _ActivityInfo extends StatelessWidget {
  final String title;
  final IconData icon;

  const _ActivityInfo({Key key, this.title, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Theme.of(context).buttonColor,
          child: icon != null ? Icon(icon, size: 18) : null,
        ),
        _hbox5,
        Text(
          title,
          textAlign: TextAlign.center,
          style: _boldS14Style,
        ),
      ],
    );
  }
}

class _DonutPieChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  _DonutPieChart(this.seriesList, {this.animate});

  @override
  Widget build(BuildContext context) {
    return charts.PieChart(
      seriesList,
      animate: animate,
      // Configure the width of the pie slices to 60px. The remaining space in
      // the chart will be left as a hole in the center.
      defaultRenderer: charts.ArcRendererConfig(
        arcWidth: 60,
        arcRendererDecorators: [charts.ArcLabelDecorator()],
      ),
    );
  }
}

// ----------------------------------------------------------------------------------
// Private Data ---------------------------------------------------------------------
// ----------------------------------------------------------------------------------

final _chartSampleData = <charts.Series<_LinearSales, String>>[
  charts.Series<_LinearSales, String>(
    id: 'Sales',
    domainFn: (_LinearSales sales, int index) => sales.month,
    measureFn: (_LinearSales sales, int index) => sales.sales,
    data: [
      _LinearSales("July", 100),
      _LinearSales("August", 75),
      _LinearSales("September", 25),
      _LinearSales("October", 5),
    ],
  )
];

/// Sample linear data type.
class _LinearSales {
  final String month;
  final int sales;

  _LinearSales(this.month, this.sales);
}

class _Activity {
  final String title;
  final IconData icon;
  _Activity({this.title, this.icon});
}

final List<_Activity> _activities = [
  _Activity(title: "Results", icon: FontAwesomeIcons.listOl),
  _Activity(title: "Messages", icon: FontAwesomeIcons.sms),
  _Activity(title: "Appointments", icon: FontAwesomeIcons.calendarDay),
  _Activity(title: "Video Consultation", icon: FontAwesomeIcons.video),
  _Activity(title: "Summary", icon: FontAwesomeIcons.fileAlt),
  _Activity(title: "Billing", icon: FontAwesomeIcons.dollarSign),
];

// ----------------------------------------------------------------------------------
// Private Static Contents ----------------------------------------------------------
// ----------------------------------------------------------------------------------

const _avatarImage = '$STORE_BASE_URL/img%2F2.jpg?alt=media';

const _hbox5 = SizedBox(height: 5);
const _hbox10 = SizedBox(height: 10);

const _whiteBoldS20Style = TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white);
const _blackBoldS20Style = TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20);
const _boldS28Style = TextStyle(fontWeight: FontWeight.bold, fontSize: 28);
const _boldS14Style = TextStyle(fontWeight: FontWeight.bold, fontSize: 14);

const _insets0 = EdgeInsets.all(0);
const _insets8 = EdgeInsets.all(8);
const _insets16 = EdgeInsets.all(16);

final _circularBorder20 = BorderRadius.circular(20);
final _circularBorder10 = BorderRadius.circular(10);

final _titledContainerDecoration = BoxDecoration(borderRadius: _circularBorder20, color: Colors.white);
