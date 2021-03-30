import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:summative_assessment/screens/third.dart';
import 'package:summative_assessment/widgets/drawer.dart';
import 'package:summative_assessment/widgets/header.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  List<dynamic> recipe;
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<Response> getFoodData() async {
    Response response = await get(
        'https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood');
    return response;
  }

  @override
  Widget build(BuildContext context) {
    getFoodData().then((value) {
      recipe = jsonDecode(value.body)['meals'];
      setState(() {});
    });

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          new Container(),
        ],
        title: Header(
          title: 'Home',
        ),
        backgroundColor: Colors.blue[800],
      ),
      endDrawer: CustomDrawer(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.grey[300],
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200, childAspectRatio: 2 / 3),
            itemCount: recipe != null ? recipe.length : 5,
            itemBuilder: (BuildContext context, int index) {
              return recipe != null
                  ? GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  new ThirdScreen(
                                    idMeal: recipe[index]['idMeal'],
                                  ))),
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            border: Border.all(color: Colors.black)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(recipe[index]['strMealThumb']),
                            Text(
                              recipe[index]['strMeal'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18, fontStyle: FontStyle.italic),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FlatButton(
                                  onPressed: () {},
                                  padding: EdgeInsets.all(0.0),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.green[700],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0))),
                                      width: 70,
                                      height: 30,
                                      child: Center(
                                        child: Text('Buy Now',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white)),
                                      )),
                                ),
                                FlatButton(
                                  onPressed: () {},
                                  padding: EdgeInsets.all(0.0),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.blue[900],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0))),
                                      width: 70,
                                      height: 30,
                                      child: Center(
                                        child: Text('Cart',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white)),
                                      )),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  : SpinKitChasingDots(
                      color: Colors.red,
                    );
            }),
      ),
    );
  }
}
