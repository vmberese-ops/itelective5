import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:summative_assessment/widgets/drawer.dart';
import 'package:summative_assessment/widgets/header.dart';

class ThirdScreen extends StatefulWidget {
  final String idMeal;

  const ThirdScreen({Key key, this.idMeal}) : super(key: key);

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  List<dynamic> recipe;
  void initState() {
    // TODO: implement initState
    super.initState();
    getFoodData().then((value) {
      recipe = jsonDecode(value.body)['meals'];
      setState(() {});
    });
  }

  @override
  Future<Response> getFoodData() async {
    Response response = await get(
        'https://www.themealdb.com/api/json/v1/1/lookup.php?i=${widget.idMeal}');
    return response;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          new Container(),
        ],
        title: Header(title: recipe != null ? recipe[0]['strMeal'] : ''),
        backgroundColor: Colors.blue[800],
      ),
      endDrawer: CustomDrawer(),
      body: recipe != null
          ? SingleChildScrollView(
              child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  recipe[0]['strMealThumb'],
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fitWidth,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 2),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: ListTile(
                    trailing: Icon(
                      Icons.favorite,
                      color: Colors.pink,
                      size: 24.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                    title: Text('Instructions',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(recipe[0]['strInstructions'],
                      style: TextStyle(fontSize: 18, fontFamily: '')),
                ),
              ],
            ))
          : SpinKitChasingDots(
              color: Colors.red,
            ),
    );
  }
}
