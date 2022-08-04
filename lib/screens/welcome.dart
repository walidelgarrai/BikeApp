import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(),
            Image.asset('assets/images/bike.png'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 90),
              child: SizedBox(
                height: 60,
                width: 200,
                child: RaisedButton(
                    color: Colors.indigo,
                    onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                    child: Text('Bienvenue',
                      style: TextStyle(
                      color: Colors.white,
                        fontSize: 20,
                    ),
                    ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text('www.bike.com',
                style:TextStyle(
                fontSize: 20,
              ) ,
              ),
            ),
          ],
        ),
      ),

    );
  }
}
