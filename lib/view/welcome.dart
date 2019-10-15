import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/image/paper/default.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            height: 88,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 100,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    color: Color.fromRGBO(6, 192, 95, 1),
                    textColor: Colors.white,
                    child: Text("登录"),
                    onPressed: (){
                      Navigator.of(context).pushNamed('/signin');
                    },
                  ),
                ),
                Container(
                  height: 40,
                  width: 100,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    color: Colors.white,
                    textColor: Color.fromRGBO(6, 192, 95, 1),
                    child: Text("注册"),
                    onPressed: (){
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => SignUp()),
                      // );
                      Navigator.of(context).pushNamed('/signup');
                    },
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
