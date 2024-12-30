import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({super.key});

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  List<dynamic> data = [];
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('MM-dd-yyyy').format(DateTime.now());

  Future<void> fetchData() async {
    final response = await http
        .get(Uri.parse('https://cbu.uz/uz/arkhiv-kursov-valyut/json/'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);

      // jsonData to'liq ro'yxat bo'lib chiqadi
      setState(() {
        data = jsonData;
      });
    } else {
      throw Exception("failed to load data");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 7, 12, 169),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Valyuta kurslari',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              '$formattedDate',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          // Diff qiymatini olish va uni double turiga o'zgartirish
          var diffValue = data[index]['Diff'];

          // Diff qiymatini double turiga o'zgartirish (agar string bo'lsa)
          double? diffAsDouble = double.tryParse(diffValue.toString());

          // Diff qiymati 0 dan katta bo'lsa yashil, kichik bo'lsa qizil, teng bo'lsa kulrang
          Color diffColor = Colors.grey; // default color
          if (diffAsDouble != null) {
            if (diffAsDouble > 0) {
              diffColor = Colors.green;
            } else if (diffAsDouble < 0) {
              diffColor = Colors.red;
            }
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Updated day',
                      style: TextStyle(fontSize: 13),
                    ),
                    Text(
                      data[index]['Date']?.toString() ?? 'No Date available',
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('1${data[index]['Ccy']}'),
                      Column(
                        children: [
                          Text(
                            '${data[index]['CcyNm_UZ']} (${data[index]['Code']})',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 5, 22, 215)),
                          ),
                          Text(
                            '${data[index]['Rate']}',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Text(
                        '${data[index]['Diff']}',
                        style: TextStyle(color: diffColor), // Diff rangini o'zgartir
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 3,
                  color: Colors.black,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
