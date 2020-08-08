import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_adventures/widgets/destinationCarousel.dart';
import 'package:my_adventures/widgets/hotelCarousel.dart';


ThemeData appTheme = _buildThemeData();

ThemeData _buildThemeData() {
  ThemeData themeData = ThemeData.light();

  return themeData.copyWith(
      brightness: Brightness.dark,
      primaryColor: Colors.lightBlue,
      accentColor: Colors.lightBlueAccent.shade100,

      textTheme: _buildTextTheme(themeData.textTheme));
}

TextTheme _buildTextTheme(TextTheme textTheme) {
  return textTheme.copyWith(
      headline: textTheme.headline.copyWith(fontWeight: FontWeight.bold, fontSize: 30.0),
      title: textTheme.title.copyWith(fontWeight: FontWeight.bold, fontSize: 25.0, letterSpacing: 1.0),
      subtitle: textTheme.subtitle.copyWith(color: Colors.lightBlueAccent, fontSize: 17.0),
      body1: textTheme.body1.copyWith(color: Colors.black, fontSize: 18.0),
      body2: textTheme.body2.copyWith(color: Colors.grey, fontSize: 12.0),);
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appTheme,
      home: HomeScreen(title: 'My Adventures'),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final String title;

  HomeScreen({Key key, this.title}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  int selectedIndex;
  int currentTab;

  @override
  void initState() {
    selectedIndex = 0;
    currentTab = 0;
  }

  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.car,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking
  ];

  Widget _buildIcon(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          print(selectedIndex);
        });
      },
      child: Container(
        width: 60.0,
        height: 60.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: selectedIndex == index ? Theme
                .of(context)
                .accentColor : Colors.white),
        child: Icon(
            _icons[index],
            color: selectedIndex == index ? Theme
                .of(context)
                .primaryColor : Colors.grey),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 120, left: 10),
                child: Text(
                  'What you would like to find?',
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _icons
                    .asMap()
                    .entries
                    .map((MapEntry map) => _buildIcon(context, map.key))
                    .toList(),
              ),
              SizedBox(height: 20,),
              DestinationCarousel(),
              HotelCarousel(),
              
            ],
          )),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentTab,
          onTap: (int value){
            setState(() {
              currentTab = value;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.search),title: SizedBox.shrink()),
            BottomNavigationBarItem(icon: Icon(Icons.local_pizza),title: SizedBox.shrink()),
            BottomNavigationBarItem(icon: CircleAvatar(backgroundImage: NetworkImage('https://www.google.com/imgres?imgurl=http%3A%2F%2Fwww.goodtimes.com.pk%2Fgtmain%2Fuploads%2F2015%2F02%2FMaria-B.-Profile-Image-4.jpg&imgrefurl=http%3A%2F%2Fwww.goodtimes.com.pk%2Fgt-special-celeb-quotes-on-v-day%2Fmaria-b-profile-image-4%2F&tbnid=BqpJB4EC4sQtaM&vet=12ahUKEwjg6_j56fnqAhUR0YUKHeTcAf0QMyg2egQIARBh..i&docid=27fnDWG5D05TTM&w=675&h=800&q=profileimage&ved=2ahUKEwjg6_j56fnqAhUR0YUKHeTcAf0QMyg2egQIARBh'),),title: SizedBox.shrink()),
          ]),
    );
  }

}