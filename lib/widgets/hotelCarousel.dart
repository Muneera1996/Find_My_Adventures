import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_adventures/models/hotel_model.dart';


class HotelCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Exclusive Hotels",
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
            height: 250,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: hotels.length,
                itemBuilder: (BuildContext context, int index) {
                  Hotel hotel = hotels[index];
                  return Container(
                    margin: EdgeInsets.all(10.0),
                    width: 210.0,
                    color: Colors.white,
                    //: Colors.red,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Positioned(
                          bottom: 5.0,
                          child: Container(
                            width: 200,
                            height: 120,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(hotel.name,
                                    style: Theme.of(context).textTheme.body1,),
                                  Text(hotel.address,
                                    style: Theme.of(context).textTheme.body2 ,),
                                  Text('\$${hotel.price} /night',
                                    style: Theme.of(context).textTheme.body1 ,)
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
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
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image(
                                  height: 150,
                                  width: 200,
                                  image: AssetImage(hotel.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
          )

        ],
      );
  }

  TextStyle cityOnImage() {
    return TextStyle(
        color: Colors.white,
        fontSize: 24.0,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.2

    );
  }
  TextStyle countryOnImage() {
    return TextStyle(
        fontSize: 20.0,
        color: Colors.white,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.0

    );
  }

}
