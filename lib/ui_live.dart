import 'package:flutter/material.dart';

class UIlive extends StatefulWidget {
  @override
  _UIliveState createState() => _UIliveState();
}

class _UIliveState extends State<UIlive> with SingleTickerProviderStateMixin {
  Animation cardAnimation, delayedCardAnimation, fabButtonanim, infoAnimation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    cardAnimation = Tween(begin: 0.0, end: -0.025).animate(
        CurvedAnimation(curve: Curves.fastOutSlowIn, parent: controller));

    delayedCardAnimation = Tween(begin: 0.0, end: -0.05).animate(
        CurvedAnimation(
            curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
            parent: controller));

    fabButtonanim = Tween(begin: 1.0, end: -0.0008).animate(CurvedAnimation(
        curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn),
        parent: controller));

    infoAnimation = Tween(begin: 0.0, end: 0.025).animate(CurvedAnimation(
        curve: Interval(0.7, 1.0, curve: Curves.fastOutSlowIn),
        parent: controller));
  }

  @override
  Widget build(BuildContext context) {
    final devHeight = MediaQuery.of(context).size.height;
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {},
            ),
            title: Text(
              "Near By",
              style: TextStyle(
                fontSize: 24.0,
                letterSpacing: 2.0,
              ),
            ),
            actions: [
              FlutterLogo(
                size: 24.0,
              )
            ],
          ),
          body: Center(
            child: Container(
              padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        left: 20,
                        child: Container(
                          transform: Matrix4.translationValues(
                              0.0, delayedCardAnimation.value * devHeight, 0.0),
                          width: 260.0,
                          height: 400.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.lightBlue,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        child: Container(
                          transform: Matrix4.translationValues(
                              0.0, cardAnimation.value * devHeight, 0.0),
                          width: 280.0,
                          height: 400.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.lightGreenAccent,
                          ),
                        ),
                      ),
                      Container(
                        width: 300.0,
                        height: 400.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.amber,
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/girls.jpeg",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 340.0,
                        left: 10.0,
                        child: Container(
                          transform: Matrix4.translationValues(
                              0.0, infoAnimation.value * devHeight, 0.0),
                          height: 100.0,
                          width: 270.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3.0,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "kayla",
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.pink,
                                      fontSize: 30.0,
                                    ),
                                  ),
                                  Container(
                                    height: 30.0,
                                    width: 30.0,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("assets/simbolo.png"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "5.8 km",
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.3),
                                      fontSize: 25.0,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 18.0, horizontal: 16.0),
                                child: Text(
                                  "Fate is wonderful",
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.3),
                                    fontSize: 25.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
