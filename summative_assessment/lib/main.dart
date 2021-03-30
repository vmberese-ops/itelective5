import 'package:flutter/material.dart';
import 'package:summative_assessment/screens/second.dart';

void main() => runApp(MaterialApp(
      title: 'Home',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        '/': (context) => LoginScreen(),
        '/second': (context) => HomeScreen(),
      },
    ));

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.blue[800],
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 100, horizontal: 40),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text('Login',
                      style: TextStyle(fontSize: 30, color: Colors.blue[100])),
                ),
                SizedBox(
                  height: 30,
                ),
                Text('Phone or email',
                    style: TextStyle(fontSize: 18, color: Colors.blue[200])),
                TextField(
                  style: TextStyle(color: Colors.blue[100], fontSize: 18),
                ),
                SizedBox(
                  height: 30,
                ),
                Text('Password',
                    style: TextStyle(fontSize: 18, color: Colors.blue[200])),
                TextField(
                  obscureText: true,
                  style: TextStyle(color: Colors.blue[100], fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/second', ModalRoute.withName('/second'));
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue[900],
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      child: Center(
                        child: Text('Log In',
                            style: TextStyle(
                                fontSize: 18, color: Colors.blue[200])),
                      )),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text('Forgot Password?',
                      style: TextStyle(fontSize: 15, color: Colors.blue[200])),
                )
              ],
            ),
          )),
    );
  }
}
