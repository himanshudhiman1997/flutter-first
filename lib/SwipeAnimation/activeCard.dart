import 'dart:math';

import 'package:xl_demo/SwipeAnimation/detail.dart';
import 'package:flutter/material.dart';

Positioned cardDemo(
    DecorationImage img,
    double bottom,
    double right,
    double left,
    double cardWidth,
    double rotation,
    double skew,
    BuildContext context,
    Function dismissImg,
    int flag,
    Function addImg,
    Function swipeRight,
    Function swipeLeft) {
  Size screenSize = MediaQuery.of(context).size;
  // print("Card");
  return new Positioned(
    bottom: 100.0 + bottom,
    right: flag == 0 ? right != 0.0 ? right : null : null,
    left: flag == 1 ? right != 0.0 ? right : null : null,
    child: new Dismissible(
      key: new Key(new Random().toString()),
      crossAxisEndOffset: -0.3,
      onResize: () {
      },
      onDismissed: (DismissDirection direction) {

        if (direction == DismissDirection.endToStart)
          dismissImg(img);
        else
          addImg(img);
      },
      child: new Transform(
        alignment: flag == 0 ? Alignment.bottomRight : Alignment.bottomLeft,
        //transform: null,
        transform: new Matrix4.skewX(skew),
        //..rotateX(-math.pi / rotation),
        child: new RotationTransition(
          turns: new AlwaysStoppedAnimation(
              flag == 0 ? rotation / 360 : -rotation / 360),
          child: new Hero(
            tag: "img",
            child: new GestureDetector(
              onTap: () {
                Navigator.of(context).push(new PageRouteBuilder(
                      pageBuilder: (_, __, ___) => new DetailPage(type: img),
                    ));
              },
              child: new Card(
                color: Colors.transparent,
                elevation: 4.0,
                child: new Container(
                  alignment: Alignment.center,
                  width: screenSize.width / 1.2 + cardWidth,
                  height: screenSize.height / 1.7,
                  decoration: new BoxDecoration(
                    color: new Color.fromRGBO(121, 114, 173, 1.0),
                    borderRadius: new BorderRadius.circular(8.0),
                  ),
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        width: screenSize.width / 1.2 + cardWidth,
                        height: screenSize.height / 2.2,
                        decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.only(
                              topLeft: new Radius.circular(8.0),
                              topRight: new Radius.circular(8.0)),
                          image: img,
                        ),
                      ),
                      new Container(
                          width: screenSize.width / 1.2 + cardWidth,
                          height:
                              screenSize.height / 1.7 - screenSize.height / 2.2,
                          alignment: Alignment.center,
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              new FlatButton(
                                  padding: new EdgeInsets.all(0.0),
                                  onPressed: () {
                                    swipeLeft();
                                  },
                                  child: new Container(
                                    height: 40.0,
                                    width: 130.0,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: orangeGradients,
                                          begin: Alignment.topLeft,
                                          end: Alignment.center),
                                      borderRadius:
                                      new BorderRadius.circular(40.0),
                                    ),
                                    child: new Text(
                                      "DISLIKE",
                                      style: new TextStyle(color: Colors.white),
                                    ),
                                  )),
                              new FlatButton(
                                  padding: new EdgeInsets.all(0.0),
                                  onPressed: () {
                                    swipeRight();
                                  },
                                  child: new Container(
                                    height: 40.0,
                                    width: 130.0,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: orangeGradients,
                                          begin: Alignment.topLeft,
                                          end: Alignment.center),
                                      borderRadius:
                                      new BorderRadius.circular(40.0),
                                    ),
                                    child: new Text(
                                      "LIKE",
                                      style: new TextStyle(color: Colors.white),
                                    ),
                                  ))
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

const List<Color> orangeGradients = [
  Color(0xFFFF9844),
  Color(0xFFFE8853),
  Color(0xFFFD7267),
];
