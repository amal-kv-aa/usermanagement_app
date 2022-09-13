import 'package:flutter/material.dart';
import 'package:user_mgt/screens/signup.dart/view/signup_page.dart';

class LobyPage extends StatelessWidget {
  const LobyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/7.jpg'), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "looks like you not loged in",
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => SignupEmail(
                                  title: "Login",
                                )));
                      },
                      child: const Text("GO to Login page")),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => SignupEmail(
                                  title: "Creat Account",
                                )));
                      },
                      child: const Text("Go to sign Up"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
