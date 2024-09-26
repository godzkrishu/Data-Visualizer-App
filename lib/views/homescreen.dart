import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// HomeScreen widget
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double currentPage = 0.0;
  final PageController _pageViewController = PageController();


  // Slide data
  final List<Map<String, String>> items = [
    {
      "route":"/chart",
      "header": "PM Gram Sadak",
      "description": "Physical & Financial Progress of Pradhan Mantri Gram Sadak Yojna (PMGSY) as on date",
      "image": "https://affairscloud.com/assets/uploads/2019/12/Phase-III-of-Pradhan-Mantri-Gram-Sadak-Yojana-launched.jpg"
    },
    {
      "route":"/sikhokamao",
      "header": "Sikho Kamao Scheme ",
      "description": "State/UT-Wise Number of Beneficiaries under Seekho aur Kamao Scheme as on 15-07-2024",
      "image": "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjZKCNtrm1vD4-I_668wXIMzvjsHE_7VV2uRcBTmZ5h1Wlx0hSxk4JjDBy1T7Gw-wZCpw3dwACmF-lgo6MF2yJRR-H168K40kCyB1MF82QFMkNNqqJXyvtFLusgEAcY0N_KcOn_9vXfuq8/w1200-h630-p-k-no-nu/seekho.jpg"
    },
    {
      "route":"/chart",
      "header": "Learn",
      "description": "Online chat which provides its users maximum functionality to simplify the search",
      "image": "https://affairscloud.com/assets/uploads/2019/12/Phase-III-of-Pradhan-Mantri-Gram-Sadak-Yojana-launched.jpg"
    },
    {
      "route":"/chart",
      "header": "Learn",
      "description": "Online chat which provides its users maximum functionality to simplify the search",
      "image": "https://affairscloud.com/assets/uploads/2019/12/Phase-III-of-Pradhan-Mantri-Gram-Sadak-Yojana-launched.jpg"
    },
  ];

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  // Generate slides
  List<Widget> get slides => items
      .map((item) => Container(
    padding: EdgeInsets.symmetric(horizontal: 18.0),
    child: Column(
      children: <Widget>[
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child:
          Image.network(
            item['image']!,
            fit: BoxFit.fitWidth,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
          ),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: <Widget>[
                Text(
                  item['header']!,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w300,
                    color: Color(0XFF3F3D56),
                    height: 2.0,
                  ),
                ),
                Text(
                  item['description']!,
                  style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 1.2,
                    fontSize: 16.0,
                    height: 1.3,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 50,),
                ElevatedButton(onPressed: (){
                  context.push(item['route']!);
                }, child:Text("See The Chart")),
              ],
            ),
          ),
        ),

      ],
    ),
  ))
      .toList();

  // Generate page indicators
  List<Widget> indicator() => List<Widget>.generate(
    slides.length,
        (index) => Container(
      margin: EdgeInsets.symmetric(horizontal: 3.0),
      height: 10.0,
      width: 10.0,
      decoration: BoxDecoration(
        color: currentPage.round() == index
            ? Color(0XFF256075)
            : Color(0XFF256075).withOpacity(0.2),
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(color: Colors.blueAccent),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                  Text("HomeScreen"),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0), // Added padding for username
            child: Text(
              "Welcome Back!",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Color(0XFF3F3D56),
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: <Widget>[
                PageView.builder(
                  controller: _pageViewController,
                  itemCount: slides.length,
                  itemBuilder: (BuildContext context, int index) {
                    return slides[index];
                  },
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(top: 70.0),
                    padding: EdgeInsets.symmetric(vertical: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: indicator(),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

