import 'package:flashchat/screens/registration_screen.dart';
import 'package:flutter/material.dart';

import '../button.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'Welcome Screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

//<TickerProviderStateMixin> says that this class can be used as the ticker
class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  AnimationController backgroundController;
  AnimationController logoController;
  Animation logoAnimation;

  @override
  void initState() {
    super.initState();
    backgroundController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    backgroundController.forward(); //Proceeds animation forward
    backgroundController.addListener(() {
      setState(() {});
    });

    logoController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    logoController.forward(); //Proceeds animation forward
    logoController.addListener(() {
      setState(() {});
    });

    logoAnimation = CurvedAnimation(
      parent: logoController,
      curve: Curves.bounceInOut,
    );
  }

  @override
  void dispose() {
    super.dispose();
    logoController.dispose();
    backgroundController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.grey.shade700.withOpacity(backgroundController.value),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: logoAnimation.value * 70.0,
                  ),
                  tag: 'logo',
                ),
                Text(
                  'Flash Chat',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Button(
              color: Colors.tealAccent.shade400,
              title: 'Already a member? Here, Log In',
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            Button(
              color: Colors.yellowAccent.shade700,
              title: 'Not a member? No worries, Register',
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
