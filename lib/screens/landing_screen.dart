import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  static const routeName = '/landing-screen';
  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height * 0.1,
                child: const Text(
                  'Welcome user',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.9,
              margin: const EdgeInsets.only(
                left:10,
                right: 10,
              ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    elevation: 5,
                    child: Container(
                      height: 200,
                      padding: const EdgeInsets.all(10),
                      
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        
                      ),
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              
                              color: Colors.black
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(10),
                            height: 40,
                            width: 200,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text(
                                'Get Started',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      )
                    ),
                  )
                ],
              )
            )
            
          ],
        ),
      ),
    );
  }
}
