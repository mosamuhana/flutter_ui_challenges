import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'models.dart';

List<Activity> getActivities() {
  return [
    Activity(title: "Results", icon: FontAwesomeIcons.listOl),
    Activity(title: "Messages", icon: FontAwesomeIcons.sms),
    Activity(title: "Appointments", icon: FontAwesomeIcons.calendarDay),
    Activity(title: "Video Consultation", icon: FontAwesomeIcons.video),
    Activity(title: "Summary", icon: FontAwesomeIcons.fileAlt),
    Activity(title: "Billing", icon: FontAwesomeIcons.dollarSign),
  ];
}

List<charts.Series<LinearSales, String>> getChartSampleData() {
  return [
    charts.Series<LinearSales, String>(
      id: 'Sales',
      domainFn: (LinearSales sales, int index) => sales.month,
      measureFn: (LinearSales sales, int index) => sales.sales,
      data: [
        LinearSales("July", 100),
        LinearSales("August", 75),
        LinearSales("September", 25),
        LinearSales("October", 5),
      ],
    )
  ];
}
