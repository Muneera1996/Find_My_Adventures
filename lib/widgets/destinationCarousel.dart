import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_adventures/models/destination_model.dart';
import 'package:my_adventures/screens/destinationScreen.dart';


class DestinationCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Top Destinations",
                  style: Theme.of(context).textTheme.title,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "See All",
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 270,
            //color: Theme.of(context).accentColor,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: destinations.length,
                itemBuilder: (BuildContext context, int index) {
                  Destination destination = destinations[index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) => DestinationScreen(destination: destination)));
                    },
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      width: 180.0,
                      color: Colors.white,
                      //: Colors.red,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: <Widget>[
                          Positioned(
                            bottom: 15.0,
                            child: Container(
                              width: 180,
                              height: 120,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('${destination.activities.length} Activities',
                                    style: Theme.of(context).textTheme.body1,),
                                    Text(destination.description,
                                    style: Theme.of(context).textTheme.body2 ,)
                                  ],
                                ),
                              ),
                            ),
                          ),

                          Container(
                            width: 160,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0.0,2.0),
                                  blurRadius: 6.0
                                )
                              ]
                            ),
                            child: Stack(
                              children: <Widget>[
                                Hero(
                                  tag: destination.imageUrl,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image(
                                      height: 160,
                                      width: 160,
                                      image: AssetImage(destination.imageUrl),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 10.0,
                                  bottom: 10.0,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(destination.city,
                                      style: cityOnImage(),),
                                      Row(
                                        children: <Widget>[
                                          Icon(FontAwesomeIcons.locationArrow,color: Colors.white,size: 12.0,),
                                          Text(destination.country,style: countryOnImage(),),
                                        ],
                                      )
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )

        ],
      );
  }

TextStyle cityOnImage() {
    return TextStyle(
      fontSize: 20.0,
      color: Colors.white,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.0

    );
  }
  TextStyle countryOnImage() {
    return TextStyle(
        fontSize: 17.0,
        color: Colors.white,
        fontWeight: FontWeight.w500,

    );
  }

}
