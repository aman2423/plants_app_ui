import 'package:flutter/material.dart';
import 'package:plants_app/plants_list.dart';
import 'package:plants_app/styleguide.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plants App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 15.0,
          ),
          Container(
            padding: EdgeInsets.only(
              right: 10.0,
            ),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {},
                ),
                FloatingActionButton(
                  onPressed: () {},
                  mini: true,
                  backgroundColor: Colors.grey.withOpacity(0.3),
                  elevation: 0.0,
                  child: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.black,
                    size: 17.0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(14.0),
            child: Text(
              'Top Picks',
              style: kHeadTitle,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 15.0,
            ),
            child: TabBar(
              controller: tabController,
              indicatorColor: Colors.transparent,
              isScrollable: true,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: <Widget>[
                Text(
                  'Top',
                  style: kTabTitle,
                ),
                Text(
                  'Outdoor',
                  style: kTabTitle,
                ),
                Text(
                  'Indoor',
                  style: kTabTitle,
                ),
                Text(
                  'Plants',
                  style: kTabTitle,
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 200.0,
            child: TabBarView(
              controller: tabController,
              children: <Widget>[
                PlantList(),
                PlantList(),
                PlantList(),
                PlantList(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
