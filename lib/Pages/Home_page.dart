import 'package:flutter/material.dart';
import 'package:pulse_social/modules/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<bool> _selected = List.generate(31, (index) => false);
  int _selectedDate = 1;
  bool _isGlowing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 118, 117, 117),
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        toolbarHeight: 70,
        title: const Text(
          "HOME   PAGE",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 43, 151, 239),
        centerTitle: true,
      ),

      // Adding the Drawer

      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 110),
              child: Text(
                "Welcome, Charvi !",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Stack(
              children: [
                Container(
                  key: ValueKey<int>(_selectedDate),
                  height: 300,
                  width: 400,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 15, 142, 233),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isGlowing = !_isGlowing;
                        _selectedDate = 1;
                        _selected = List.generate(31, (index) => index == 0);
                      });
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(top: 250),
                      child: Center(
                        child: Text(
                          "EYES CLENSED",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 250,
                    width: 400,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: const Offset(0, 4),
                            blurRadius: 19,
                            spreadRadius: 1)
                      ],
                    ),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            right: 180,
                            top: 5,
                          ),
                          child: Text(
                            'Daily Care',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 35,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 195,
                            top: 5,
                          ),
                          child: Text(
                            'Today is $_selectedDate.06.2024',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 15,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10),
                            child: Row(
                              children: List.generate(31, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedDate = index + 1;
                                      for (int i = 0;
                                          i < _selected.length;
                                          i++) {
                                        _selected[i] = false;
                                      }
                                      _selected[index] = true;
                                    });
                                  },
                                  child: Container(
                                    height: 100,
                                    width: 51,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: BoxDecoration(
                                      gradient: _selected[index]
                                          ? LinearGradient(
                                              colors: [
                                                Colors.blue.shade400,
                                                Colors.lightBlue.shade700
                                              ],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                            )
                                          : null,

                                      //This controls the color of the background of the cylinders
                                      color: _selected[index]
                                          ? null
                                          : Colors.black,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(height: 10),
                                        Text(
                                          '${index + 1}'.padLeft(2, '0'),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        const SizedBox(height: 15),
                                        const Icon(Icons.water_drop,
                                            size: 25, color: Colors.white),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Divider(
                color: Colors.white,
                thickness: 2,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Text(
                textAlign: TextAlign.center,
                softWrap: true,
                "RetinaXpert is an mobile application developed by the students of SRM as an initiative to identity eye related disease and educate users about prevention and good eye habits. \n Click on the top Left corner to know more ...",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            )
          ],
        ),
      ),
      /*
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 32, 118, 188),
      ),*/
    );
  }
}
