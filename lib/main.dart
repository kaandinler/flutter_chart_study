import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_chart_study/my_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Chart Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(25),
                decoration: const BoxDecoration(
                  color: Color(0xFF141416),
                  // color: Color(0xff232d37),
                ),
                width: 450,
                height: 400,
                child: VerticalBarChart(
                  data: [502, 300, 183, 135, 125, 62],
                  categories: ['Technology', 'Financials', 'Energy', 'Consumer Electronic', 'Entertainment', 'Healthcare'],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color(0xFF141416),
                  // color: Color(0xff232d37),
                ),
                width: 450,
                height: 400,
                child: VerticalBarChart(
                  data: [
                    25,
                  ],
                  categories: ['Consumer Electronic'],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color(0xFF141416),
                  // color: Color(0xff232d37),
                ),
                width: 450,
                height: 400,
                child: VerticalBarChart(
                  data: [
                    25,
                    65,
                  ],
                  categories: ['Technology', 'Consumer Electronic'],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color(0xFF141416),
                  // color: Color(0xff232d37),
                ),
                width: 450,
                height: 400,
                child: VerticalBarChart(
                  data: [
                    25,
                    35,
                    65,
                  ],
                  categories: ['Technology', 'Consumer Electronic', 'Healthcare'],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color(0xFF141416),
                  // color: Color(0xff232d37),
                ),
                width: 450,
                height: 400,
                child: VerticalBarChart(
                  data: [25, 35, 65, 15],
                  categories: ['Technology', 'Consumer Electronic', 'Healthcare', 'Financials'],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color(0xFF141416),
                  // color: Color(0xff232d37),
                ),
                width: 450,
                height: 400,
                child: VerticalBarChart(
                  data: [
                    25,
                    35,
                    65,
                    15,
                    25,
                  ],
                  categories: ['Technology', 'Consumer Electronic', 'Healthcare', 'Energy', 'Entertainment' ''],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color(0xFF141416),
                  // color: Color(0xff232d37),
                ),
                width: 450,
                height: 400,
                child: VerticalBarChart(
                  data: [25, 35, 65, 35, 45, 25, 15],
                  categories: ['Technology', 'Consumer Electronic', 'Healthcare', 'Energy', 'Entertainment', 'Financials', 'Other'],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
