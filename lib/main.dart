import 'package:flutter/material.dart';
import 'package:wtf_gym_list/modelGym.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading = true;
  List<Gym> gyms = [];
  List<Gym> displayGyms = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getGymList();
    });
  }

  void getGymList() async {
    final dio = Dio();
    final response = await dio.get(
        'https://devapi.wtfup.me/gym/nearestgym/new?lat=0.000000&long=0.000000');
    if (response.statusCode == 200) {
      print("received data ${response.data}");
      var jsonResponse = response.data;
      print("received data ${jsonResponse}");
      List recevedList = jsonResponse['data'] ?? [];
      recevedList.forEach((element) {
        Gym data = Gym.fromJson(element);
        gyms.add(data);
      });
      setState(() {
        displayGyms = gyms;
        isLoading = false;
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  TextEditingController search = TextEditingController();

  void searchGym() {
    setState(() {
      displayGyms = [...gyms];
      displayGyms.removeWhere((element) => !element.gymName!.toLowerCase().contains(search.text.toLowerCase()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: isLoading
            ? Container(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Container(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            width: 200,
                            child: TextField(
                              controller: search,
                            )),
                        InkWell(
                          onTap: () {
                            searchGym();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: .5)),
                            child: Text("search"),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemBuilder: (BuildContext context, int idx) {
                      return Container(
                        height: 200,
                        width: 200,
                        child: Column(
                          children: [
                            Image.network(
                              displayGyms[idx].coverImage ??
                                  "https://dry2o5w6nqoyb.cloudfront.net/gym_upload/qcKW3XhdE9MS1/1668660862189-1659600756714-WhatsApp%20Image%202022-07-13%20at%203.50.33%20PM.jpeg",
                              height: 100,
                              width: 200,
                              fit: BoxFit.fill,
                            ),
                            Text("${displayGyms[idx].gymName}")
                          ],
                        ),
                      );
                    },
                    itemCount: displayGyms.length,
                  ))
                ],
              ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
