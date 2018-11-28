import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:sow4me/details/design_images.dart';
import 'package:sow4me/details/detail_design.dart';
import 'package:sow4me/pages/home.dart';
import 'package:sow4me/utils/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  String description = "My product full information";

  List productImages = [
    "https://goo.gl/kmBttE",
    "https://goo.gl/qmybLS",
    "https://goo.gl/Agm6YK",
    "https://goo.gl/Cyb1Xj",
  ];

//  List designDetails = [
//    "https://goo.gl/HEhiUr",
//    "https://goo.gl/r8rUSF",
//    "https://goo.gl/E2L6ZJ",
//    "https://goo.gl/obXWRb",
//  ];

  List<S4MBuilder> designDetails = [
    new S4MBuilder(
        title: "President Spread Collar", imageUrl: "https://goo.gl/HEhiUr"),
    new S4MBuilder(
        title: "Long One Button Cuff", imageUrl: "https://goo.gl/r8rUSF"),
    new S4MBuilder(
        title: "No Placket, No Pocket", imageUrl: "https://goo.gl/E2L6ZJ"),
    new S4MBuilder(title: "Roma Buttons", imageUrl: "https://goo.gl/obXWRb"),
  ];

  String designText =
      "Click here to change any of these shirt details, and to customize your design.";
  String measurementText = "Click here to know how to measure yourself.";
  int currentImage = 0;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return new Scaffold(
      appBar: new AppBar(
        iconTheme: new IconThemeData(color: Colors.white),
        title: new Text(
          "Product Detail",
          style: TextStyle(fontSize: 18.0),
        ),
        centerTitle: false,
      ),
      body: new Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          new Container(
            height: 300.0,
            width: screenSize.width,
            //margin: EdgeInsets.only(top: 50.0),
            padding: EdgeInsets.all(8.0),
            child: new Container(
              decoration: BoxDecoration(
                image: new DecorationImage(
                    image: new CachedNetworkImageProvider(
                        productImages[currentImage]),
                    fit: BoxFit.cover,
                    alignment: Alignment.center),
                borderRadius: new BorderRadius.only(
                  bottomRight: new Radius.circular(150.0),
                  bottomLeft: new Radius.circular(150.0),
                ),
              ),
            ),
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                bottomRight: new Radius.circular(150.0),
                bottomLeft: new Radius.circular(150.0),
              ),
            ),
          ),
          new Container(
            height: 300.0,
            decoration: new BoxDecoration(
              color: Colors.grey.withAlpha(0),
              borderRadius: new BorderRadius.only(
                bottomRight: new Radius.circular(150.0),
                bottomLeft: new Radius.circular(150.0),
              ),
            ),
          ),
          new SingleChildScrollView(
            padding:
                const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 20.0),
            child: new Column(
              children: <Widget>[
                new SizedBox(
                  height: 240.0,
                ),
                new Card(
                  child: new Container(
                    width: screenSize.width,
                    margin: new EdgeInsets.only(left: 20.0, right: 20.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Text(
                          "Shirts class x",
                          style: new TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w700),
                        ),
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Text(
                          "English wears",
                          style: new TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w400),
                        ),
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                new Icon(
                                  Icons.star,
                                  color: Colors.blue,
                                  size: 20.0,
                                ),
                                new SizedBox(
                                  width: 5.0,
                                ),
                                new Text(
                                  "${5.0}",
                                  style: new TextStyle(color: Colors.black),
                                )
                              ],
                            ),
                            new Text(
                              "₦15,000",
                              style: new TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.deepOrange[500],
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        new SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                ),
                new Card(
                  child: new Container(
                    width: screenSize.width,
                    height: 140.0,
                    margin: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: new ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productImages.length,
                        itemBuilder: (context, index) {
                          return new GestureDetector(
                            onTap: () {
                              setState(() {
                                currentImage = index;
                              });
                              showDesignImages(position: index);
                            },
                            child: new Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                new Container(
                                  margin: new EdgeInsets.only(
                                      left:
                                          index == 0 || index == 4 ? 0.0 : 8.0,
                                      right:
                                          index == 0 || index == 4 ? 0.0 : 8.0),
                                  height: 120.0,
                                  width: 80.0,
                                  child: new CachedNetworkImage(
                                      imageUrl: productImages[index],
                                      fit: BoxFit.cover,
                                      placeholder: Center(
                                        child: new SizedBox(
                                            height: 25.0,
                                            width: 25.0,
                                            child:
                                                new CircularProgressIndicator()),
                                      ),
                                      errorWidget: new Icon(Icons.error)),
                                ),
                                new Container(
                                  margin: new EdgeInsets.only(
                                      left:
                                          index == 0 || index == 4 ? 0.0 : 8.0,
                                      right:
                                          index == 0 || index == 4 ? 0.0 : 8.0),
                                  height: 120.0,
                                  width: 80.0,
                                  decoration: new BoxDecoration(
                                      color: currentImage == index
                                          ? Colors.black.withAlpha(80)
                                          : Colors.transparent),
                                  child: currentImage == index
                                      ? new Center(
                                          child: Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 50.0,
                                          ),
                                        )
                                      : null,
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ),
                new Card(
                  child: new Container(
                    width: screenSize.width,
                    margin: new EdgeInsets.only(left: 20.0, right: 20.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Text(
                          "Description",
                          style: new TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w700),
                        ),
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Text(
                          "$description $description $description $description.",
                          style: new TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w400),
                        ),
                        new SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                ),
                new Card(
                  child: new Container(
                    width: screenSize.width,
                    margin: new EdgeInsets.only(left: 20.0, right: 20.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Text(
                          "Design details",
                          style: new TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w700),
                        ),
                        new SizedBox(
                          height: 10.0,
                        ),
                        shirtDesignDetails(),
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Container(
                            color: Colors.grey.shade400,
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                                child: new Text(
                              designText,
                              style: TextStyle(color: Colors.white),
                            ))),
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Text(
                          "Your Measurement",
                          style: new TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w700),
                        ),
                        new SizedBox(
                          height: 10.0,
                        ),
                        new SizedBox(
                          height: 50.0,
                          child: new ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return new Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: new ChoiceChip(
                                          label: new Text("Sizes"),
                                          selected: false),
                                    )
                                  ],
                                );
                              }),
                        ),
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Container(
                            color: Colors.grey.shade400,
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                                child: new Text(
                              measurementText,
                              style: TextStyle(color: Colors.white),
                            ))),
                        new SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: btnBelow(),
    );
  }

  Widget btnBelow() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.black.withAlpha(200),
            height: 50.0,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: Center(
                          child: Text(
                        "ADD TO CART",
                        style: TextStyle(
                            color: Colors.white,
                            decorationColor: Colors.white,
                            decorationStyle: TextDecorationStyle.solid,
                            decoration: TextDecoration.underline),
                      )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        new GestureDetector(
          onTap: () {},
          child: Container(
            width: 150.0,
            color: blue6,
            height: 50.0,
            child: Center(
                child: Text(
              "CHECKOUT",
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            )),
          ),
        ),
      ],
    );
  }

  Widget shirtDesignDetails() {
    return new Container(
      width: MediaQuery.of(context).size.width,
      height: 80.0,
      margin: EdgeInsets.only(left: 8.0, right: 8.0),
      child: new ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: designDetails.length,
          itemBuilder: (context, index) {
            return new GestureDetector(
              onTap: () {
                //print(index);
                showDesignDetails(position: index);
              },
              child: new Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  new Container(
                    margin: new EdgeInsets.only(
                        left: index == 0 || index == 4 ? 0.0 : 8.0,
                        right: index == 0 || index == 4 ? 0.0 : 8.0),
                    height: 80.0,
                    //width: 40.0,
                    child: new CachedNetworkImage(
                        imageUrl: designDetails[index].imageUrl,
                        fit: BoxFit.fitHeight,
                        placeholder: Center(
                          child: new SizedBox(
                              height: 25.0,
                              width: 25.0,
                              child: new CircularProgressIndicator()),
                        ),
                        errorWidget: new Icon(Icons.error)),
                  ),
                  new Container(
                    margin: new EdgeInsets.only(left: 8.0),
                    height: 120.0,
                    width: 80.0,
                    decoration:
                        new BoxDecoration(color: Colors.grey.withAlpha(0)),
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget appBar() {
    return new Container(
      height: 90.0,
      color: Colors.black.withAlpha(20),
      child: new AppBar(
        backgroundColor: Colors.black.withAlpha(50),
        elevation: 0.0,
        title: Text(
          "Product details",
          style: TextStyle(fontSize: 16.0),
        ),
        centerTitle: false,
      ),
    );
  }

  Widget bottomItems() {
    return Container(
      height: 80.0,
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: new SafeArea(
        child: Row(
          children: <Widget>[
            new Flexible(
              flex: 1,
              child: new OutlineButton(
                color: Colors.white,
                padding: EdgeInsets.all(10.0),
                highlightColor: Colors.white,
                splashColor: Colors.white,
                highlightedBorderColor: Colors.white,
                borderSide: BorderSide(color: Colors.black),
                onPressed: () {},
                child: Center(
                  child: Text(
                    "ADD TO CART",
                    style: TextStyle(color: blue3, fontSize: 12.0),
                  ),
                ),
              ),
            ),
            new SizedBox(
              width: 10.0,
            ),
            new Flexible(
              flex: 1,
              child: new OutlineButton(
                color: Colors.white,
                padding: EdgeInsets.all(10.0),
                highlightColor: Colors.white,
                splashColor: Colors.white,
                highlightedBorderColor: Colors.white,
                borderSide: BorderSide(color: Colors.black),
                onPressed: () {},
                child: Center(
                  child: Text(
                    "PROCEED TO CHECKOUT",
                    style: TextStyle(color: blue3, fontSize: 12.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tableInfo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        border: TableBorder.all(color: blue3),
        children: [
          tableRow(),
          tableRow(),
        ],
      ),
    );
  }

  TableRow tableRow() {
    return new TableRow(
        //decoration: BoxDecoration(color: bl),
        children: [
          new TableCell(
            child: new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Text("Hey"),
            ),
          ),
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text("Hey, please adjust well to the design"),
          ),
        ]);
  }

//ok
  void showDesignImages({int position}) {
    Navigator.of(context).push(new PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) {
          return new DesignImages(
              designList: productImages, position: position);
        }));
  }

  void showDesignDetails({int position}) {
    Navigator.of(context).push(new PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) {
          return new DesignDetails(
              designList: designDetails, position: position);
        }));
  }
}
