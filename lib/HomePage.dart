import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:imtihon/api.dart';
import 'package:lottie/lottie.dart';
import 'package:widget_mask/widget_mask.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController _controller = TextEditingController();
  String age = '34';
  void showdialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: TextField(
            controller: _controller,
            textInputAction: TextInputAction.done,
            maxLength: 2,
            decoration: InputDecoration(
                label: Text('enter your age'),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        age = _controller.text;
                      });
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('information saved'),
                        backgroundColor: const Color.fromARGB(255, 2, 19, 148),
                      ));
                    },
                    child: Text('ok')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('back')),
              ],
            )
          ],
        );
      },
    );
  }

  List images = [
    'assets/images/photo_5445412743827024129_y.jpg',
    'assets/images/photo_5445412743827024130_y.jpg',
    'assets/images/photo_5445412743827024132_y.jpg',
    'assets/images/photo_5445412743827024133_y.jpg',
    'assets/images/photo_5445412743827024134_y.jpg',
    'assets/images/photo_5445412743827024135_y.jpg',
    'assets/images/photo_5445412743827024136_y.jpg',
    'assets/images/photo_5445412743827024137_y.jpg',
    'assets/images/photo_5445412743827024138_y.jpg',
    'assets/images/photo_5445412743827024139_y.jpg',
    'assets/images/photo_5445412743827024140_y.jpg',
    'assets/images/photo_5445412743827024141_y.jpg',
    'assets/images/photo_5445412743827024142_y.jpg',
    'assets/images/photo_5445412743827024143_y.jpg',
    'assets/images/photo_5445412743827024144_y.jpg',
    'assets/images/photo_5445412743827024145_y.jpg',
    'assets/images/photo_5445412743827024146_y.jpg',
    'assets/images/photo_5445412743827024147_y.jpg',
    'assets/images/photo_5445412743827024148_y.jpg',
    'assets/images/photo_5445412743827024149_y.jpg',
    'assets/images/photo_5445412743827024150_y.jpg',
    'assets/images/photo_5445412743827024151_y.jpg',
    'assets/images/photo_5445412743827024152_y.jpg',
    'assets/images/photo_5445412743827024153_y.jpg',
    'assets/images/photo_5445412743827024154_y.jpg',
    'assets/images/photo_5445412743827024155_y.jpg',
    'assets/images/photo_5445412743827024156_y.jpg',
    'assets/images/photo_5445412743827024157_y.jpg',
    'assets/images/photo_5445412743827024158_y.jpg',
    'assets/images/photo_5445412743827024159_y.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
          height: 50,
          child: WidgetMask(
            blendMode: BlendMode.srcATop,
            child: const Text(
              'flutter',
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
            ),
            mask: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  stops: [0.0, 1.0],
                  colors: [
                    Color.fromARGB(255, 4, 11, 214),
                    Colors.green,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ApiScreen()));
            },
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/png/dollar.png"))),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
              onTap: () {
                showdialog();
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black54),
                ),
                child: Lottie.asset(
                  'assets/lotties/button.json',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 35),
                child: Container(
                  child: Container(
                    height: 380,
                    child: Column(
                      children: [
                        Container(
                          height: 360,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start, // Buni qo'shing
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start, // Bu yerda ham
                                    children: [
                                      Text(
                                        'HIS AGE',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '$age',
                                            style: TextStyle(
                                                fontSize: 45,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '/100',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.grey),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start, // Chapga joylashtirish
                                    children: [
                                      Text(
                                        "OVERALL",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      //yurak
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 35,
                                              child: Icon(
                                                Icons.heart_broken,
                                                color: Colors.white,
                                                size: 19,
                                              ),
                                              height: 35,
                                              decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100)),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      '34',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      '/100',
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  'Energy',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      //ochki
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 35,
                                              height: 35,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/png/gg.png')),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100)),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      '24',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      '/100',
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  'Smart',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      //chaqmoq
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 35,
                                              height: 35,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/png/lightning.png')),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100)),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      '24',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      '/100',
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  'Smart',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 245, left: 0),
                                    child: Transform(
                                      transform: Matrix4.rotationX(
                                        35 * 3.19159 / 110,
                                      ),
                                      child: Container(
                                        width: 180,
                                        height: 180,
                                        child: Lottie.asset(
                                            'assets/lotties/circul1.json',
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: Container(
                                        width: 150,
                                        height: 300,
                                        child: Image.asset(
                                          "assets/png/o'zim2.png",
                                          fit: BoxFit.cover,
                                        )),
                                  )
                                ],
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                        ),
                        Row(
                          children: [Text('Old memory')],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 180,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 250.0,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 16 / 9,
                    autoPlayInterval: const Duration(seconds: 3),
                  ),
                  items: images.map((imageUrl) {
                    return Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                          onTap: () {
                            // Ustiga bosilganda yangi sahifaga o'tadi
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    FullScreenImagePage(imageUrl: imageUrl),
                              ),
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            margin:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              image: DecorationImage(
                                image: AssetImage(imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
      ),
    );
  }
}

class FullScreenImagePage extends StatelessWidget {
  final String imageUrl;

  const FullScreenImagePage({Key? key, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Viewer"),
      ),
      body: Center(
        child: Image.asset(
          imageUrl,
          fit: BoxFit.contain, // Rasmni o‘zgarmagan holda ko‘rsatish
        ),
      ),
    );
  }
}
