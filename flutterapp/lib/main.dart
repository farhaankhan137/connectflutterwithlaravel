import 'package:flutter/material.dart';
import 'package:flutterapp/student.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connect Flutter with Laravel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Connect Flutter with Laravel'),
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
  Student studentService = Student();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          child: FutureBuilder<List>(
            future: studentService.getAllStudent(),
            builder: (context, snapshort) {
              print(snapshort.data);
              if (snapshort.hasData) {
                return ListView.builder(
                  itemCount: snapshort.data?.length,
                  itemBuilder: (context, i) {
                    return Card(
                        child: ListTile(
                            title: Text(snapshort.data![i]['stuname'],
                                style: TextStyle(fontSize: 30.0)),
                            subtitle: Text(snapshort.data![i]['email'],
                                style: TextStyle(fontSize: 20.0))));
                  },
                );
              } else {
                return const Center(
                  child: Text('No data found'),
                );
              }
            },
          ),
        ));
  }
}
