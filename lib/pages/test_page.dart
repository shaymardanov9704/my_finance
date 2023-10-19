import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  int temp = 0;
  List<int> list = [1, -2, 7, 10, 0, 0, 12, -7, 1, 3];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Statistic")),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width / 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(width: 0.6, color: Colors.black),
            ),
            child: ListView.builder(
              itemCount: 100,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, i) {
                if (i % 10 == 0) {
                  temp = list.first;
                  if (list.length != 1) {
                    list = list.sublist(1);
                  } else {
                    list = list;
                  }
                }
                temp++;
                return Center(
                  child: Align(
                    alignment: Alignment(0, temp / 100),
                    child: Container(
                      width: 3.5,
                      height: 3.5,
                      decoration: const BoxDecoration(
                        // borderRadius: BorderRadius.only(
                        //   topLeft: Radius.circular(3),
                        //   bottomLeft: Radius.circular(3),
                        // ),
                        color: Colors.red,
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
