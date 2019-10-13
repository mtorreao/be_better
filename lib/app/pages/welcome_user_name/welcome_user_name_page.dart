import 'package:flutter/material.dart';

class WelcomeUserNamePage extends StatefulWidget {
  @override
  _WelcomeUserNamePageState createState() => _WelcomeUserNamePageState();
}

class _WelcomeUserNamePageState extends State<WelcomeUserNamePage> {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: 25,
    );
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 32,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Olá,',
              style: textStyle,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Como devemos te chamar?',
              style: textStyle.copyWith(
                fontSize: 24,
              ),
              textAlign: TextAlign.start,
              softWrap: true,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Nome',
                hintText: 'Alfredo da Silva',
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 6,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
