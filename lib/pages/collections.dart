import 'package:flutter/material.dart';
import 'package:sow4me/collections/catelog.dart';
import 'package:sow4me/utils/colors.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

class Collections extends StatefulWidget {
  @override
  _CollectionsState createState() => _CollectionsState();
}

class _CollectionsState extends State<Collections>
    with SingleTickerProviderStateMixin {
  final List<String> tabsTitle = [
    "English wears",
    "Senators",
    "Traditional",
    "Ankara",
  ];

  final List<Tab> tabs = <Tab>[
    new Tab(text: "English wears"),
    new Tab(text: "Senators"),
    new Tab(text: "Traditional"),
    new Tab(text: "Suits"),
    new Tab(text: "Chinos"),
    new Tab(text: "Jeans"),
  ];

  PageController pageController = new PageController();
  int currentPage = 0;

  void onPageChanged(int value) {
    setState(() {
      currentPage = value;
    });
  }

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    //_tabController = new TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: homeBody(),
    );
  }

  Widget homeBody() {
    return new Column(
      children: <Widget>[
        //homeAppBar(),
        //collectionPages()
      ],
    );
  }

  Widget homeAppBar() {
    return new Container(
      height: 140.0,
      color: blue3,
      padding: EdgeInsets.only(top: 35.0, right: 15, left: 15.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Center(
            child: new Container(
              height: 40.0,
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 20.0,
                  ),
                  new SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Search on our collections",
                    style: TextStyle(color: Colors.white.withAlpha(150)),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.black.withAlpha(100),
                  borderRadius: BorderRadius.all(Radius.circular(25.0))),
            ),
          ),
          new SizedBox(
            height: 5.0,
          ),
          collectionTabs()
        ],
      ),
    );
  }

  Widget collectionTabs() {
    return new TabBar(
        controller: _tabController,
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: new BubbleTabIndicator(
          indicatorHeight: 35.0,
          indicatorColor: Colors.black.withAlpha(150),
          tabBarIndicatorSize: TabBarIndicatorSize.tab,
        ),
        tabs: tabs);
  }

  Widget collectionPages() {
    return new Flexible(
      child: new Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: new TabBarView(
          controller: _tabController,
          children: tabs.map((Tab tab) {
            return new Center(
                child: new Text(
              tab.text,
              style: new TextStyle(fontSize: 20.0),
            ));
          }).toList(),
        ),
      ),
    );

    return new Flexible(
        child: new PageView.builder(
      controller: pageController,
      onPageChanged: onPageChanged,
      itemCount: tabsTitle.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (c, index) {
        return Catelog(
          catelogTitle: tabsTitle[index],
        );
      },
    ));
  }
}
