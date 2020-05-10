import 'package:flutter/material.dart';
import 'package:plants_app/styleguide.dart';

class PlantList extends StatefulWidget {
  @override
  _PlantListState createState() => _PlantListState();
}

class _PlantListState extends State<PlantList> {
  ScrollController _scrollController;
  List allDescription = [
    'aloe vera aloe vera aloe vera aloe vera aloe vera aloe vera aloe vera aloe vera aloe vera aloe vera aloe vera aloe vera aloe vera aloe vera aloe vera aloe vera aloe vera aloe vera aloe vera aloe vera aloe vera aloe vera aloe vera aloe vera aloe vera aloe vera aloe vera aloe vera aloe vera aloe vera aloe vera aloe vera aloe vera aloe vera aloe vera aloe vera ',
    'ficus ficus ficus ficus ficus ficus ficus ficus ficus ficus ficus ficus ficus ficus ficus ficus ficus ficus ficus ficus ficus ficus ficus ficus ficus ficus ficus ficus ficus ficus ficus ficus ficus ficus ficus ficus ficus ficus ',
    'white plant white plant white plant white plant white plant white plant white plant white plant white plant white plant white plant white plant white plant white plant white plant white plant white plant white plant white plant white plant white plant white plant white plant white plant white plant white plant white plant white plant white plant white plant white plant white plant white plant white plant white plant white plant white plant '
  ];

  String description;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(changeDesc);
    setState(() {
      description = allDescription[0];
    });
  }

  changeDesc() {
    var value = _scrollController.offset.round();
    var descIndex = (value / 150).round();
    print(value);
    setState(() {
      description = allDescription[descIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          height: 350.0,
          child: ListView(
            padding: EdgeInsets.only(left: 25.0),
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              getPlantCard(
                  'assets/images/aloevera.png', '25', 'OUTDOOR', 'Aloe Vera'),
              getPlantCard('assets/images/ficus.png', '12', 'INDOOR', 'Ficus'),
              getPlantCard('assets/images/whiteplant.png', '17', 'INDOOR',
                  'White Plant'),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.0, top: 10.0),
          child: Text(
            'Description',
            style: kDescriptionTitle,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.0, top: 10.0),
          child: Text(
            description,
            style: kDescription,
          ),
        )
      ],
    );
  }

  getPlantCard(
    String imgPath,
    String price,
    String plantType,
    String plantName,
  ) {
    return Stack(
      children: <Widget>[
        Container(
          height: 325.0,
          width: 225.0,
          padding: EdgeInsets.only(top: 10, right: 20),
          child: Container(
            padding: EdgeInsets.only(
              right: 10.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: kCardColor,
            ),
            height: 250.0,
            width: 225.0,
            child: Column(
              children: <Widget>[
                //Row shows the information of seller and price of the plant
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'FROM',
                          style: kCardDisplay1,
                        ),
                        Text(
                          '\$$price',
                          style: kCardDisplay2,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                      ],
                    ),
                  ],
                ),
                Image.asset(
                  imgPath,
                  height: 165,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 25.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 00.0,
                        ),
                        Text(
                          plantType,
                          style: kCardDisplay1,
                        ),
                        Text(
                          plantName,
                          style: kCardDisplay2.copyWith(
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: kIconColor,
                                  style: BorderStyle.solid,
                                  width: 0.8,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              //color: kCardColor,
                              child: Icon(
                                Icons.wb_sunny,
                                color: Colors.white.withOpacity(0.4),
                                size: 20.0,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: kIconColor,
                                  style: BorderStyle.solid,
                                  width: 0.8,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              //color: kCardColor,
                              child: Icon(
                                Icons.terrain,
                                color: Colors.white.withOpacity(0.4),
                                size: 20.0,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: kIconColor,
                                  style: BorderStyle.solid,
                                  width: 0.8,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              //color: kCardColor,
                              child: Icon(
                                Icons.bubble_chart,
                                color: Colors.white.withOpacity(0.4),
                                size: 20.0,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 30,
                              width: 30,
                              child: Icon(
                                Icons.help_outline,
                                color: Colors.white.withOpacity(0.4),
                                size: 23.0,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 80.0, top: 300.0),
          child: Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0), color: Colors.black),
            child: Icon(
              Icons.add_shopping_cart,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        )
      ],
    );
  }
}
