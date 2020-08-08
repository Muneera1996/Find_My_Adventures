import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_adventures/models/activity_model.dart';
import 'package:my_adventures/models/destination_model.dart';

class DestinationScreen extends StatefulWidget {
  Destination destination;

  DestinationScreen({this.destination});

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 6.0)
                    ]),
                child: Hero(
                  tag: widget.destination.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(
                        image: AssetImage(widget.destination.imageUrl),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 40.0, horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          size: 30.0,
                        ),
                        onPressed: () => Navigator.pop(context)),
                    Row(
                      children: <Widget>[
                        IconButton(
                            icon: Icon(
                              Icons.search,
                              size: 30.0,
                            ),
                            onPressed: () => Navigator.pop(context)),
                        IconButton(
                            icon: Icon(
                              FontAwesomeIcons.sortAmountDown,
                              size: 25.0,
                            ),
                            onPressed: () => Navigator.pop(context)),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 20.0,
                bottom: 20.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.destination.city,
                      style: cityOnImage(),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.locationArrow,
                          color: Colors.white,
                          size: 12.0,
                        ),
                        Text(
                          widget.destination.country,
                          style: countryOnImage(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                  right: 20.0,
                  bottom: 20.0,
                  child: Icon(
                    Icons.location_on,
                    size: 20.0,
                    color: Colors.grey,
                  ))
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: widget.destination.activities.length,
                itemBuilder: (BuildContext context, int index) {
                  Activity activity = widget.destination.activities[index];
                  return Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(50, 0, 20, 5),
                        height: 170,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(70.0, 5, 5, 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                      width: 120,
                                      child: Text(
                                        activity.name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        '\$${activity.price}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        'per pax',
                                        style:
                                            Theme.of(context).textTheme.body2,
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Text(activity.type),
                              _buildActivityRating(activity.rating),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    width: 100.0,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).accentColor,
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Text(activity.startTimes[0],
                                        style:
                                            Theme.of(context).textTheme.body2),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 70.0,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context).accentColor,
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Text(activity.startTimes[1],
                                          style:
                                              Theme.of(context).textTheme.body2),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          top: 15,
                          bottom: 15.0,
                          left: 10,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                                width: 100,
                                image: AssetImage(activity.imageUrl),fit: BoxFit.cover,),

                          ))
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }

  TextStyle cityOnImage() {
    return TextStyle(
        fontSize: 30.0,
        color: Colors.white,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.5);
  }

  TextStyle countryOnImage() {
    return TextStyle(
        fontSize: 24.0,
        color: Colors.grey,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.0);
  }

  Text _buildActivityRating(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '* ';
    }
    return Text(stars);
  }
}
