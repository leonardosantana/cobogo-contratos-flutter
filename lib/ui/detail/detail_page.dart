import 'package:fcobogo_contratos/docked.dart';
import 'package:fcobogo_contratos/model/contract.dart';
import 'package:fcobogo_contratos/ui/activity/activity_screen.dart';
import 'package:fcobogo_contratos/ui/cust/cust_screen.dart';
import 'package:fcobogo_contratos/ui/manager/manager_screen.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {

  Contract contract;

  DetailPage(@required this.contract);

  @override
  _DetailPageState createState() => _DetailPageState(contract);
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {

  int oldIndex = 0;
  int mIndex = 0;

  Contract contract;

  _DetailPageState(@required this.contract);

  final List<Widget> viewContainer = [
    ActivityScreen(),
    CustScreen(),
    ManagerScreen(),
  ];

  AnimationController animationController;
  Animation mAnimation;

  void onTabTapped(int index) {
    setState(() => oldIndex = mIndex);
    setState(() => mIndex = index);
    animationController.reset();
    animationController.forward();
  }

  double startX;
  double centerX;
  double endX;
  double mX;

  final List<Icon> iconList = [
    new Icon(Icons.schedule),
    new Icon(Icons.attach_money),
    new Icon(Icons.report),
  ];

  final List<Icon> fabIconList = [
    new Icon(
      Icons.schedule,
      color: Colors.indigo,
    ),
    new Icon(
      Icons.attach_money,
      color: Colors.red,
    ),
    new Icon(
      Icons.report,
      color: Colors.green,
    ),
  ];

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    final double bottomAppBarWidth = width - 32.0;

    startX = new StartDocked(
      additionalMargin: 24.0,
    ).getOffsetX();

    centerX = new CenterDocked(
      scaffoldSizeWidth: width - 32.0,
      fabSizeWidth: 56.0,
    ).getOffsetX();

    endX = new EndDocked(
      additionalMargin: 24.0,
      scaffoldSizeWidth: width - 32.0,
      fabSizeWidth: 56.0,
    ).getOffsetX();

    Animation animationFromStartToStart =
    new Tween(begin: startX, end: startX).animate(animationController);

    Animation animationFromStartToCenter =
    new Tween(begin: startX, end: centerX).animate(animationController);

    Animation animationFromStartToEnd =
    new Tween(begin: startX, end: endX).animate(animationController);

    Animation animationFromCenterToStart =
    new Tween(begin: centerX, end: startX).animate(animationController);

    Animation animationFromCenterToCenter =
    new Tween(begin: centerX, end: centerX).animate(animationController);

    Animation animationFromCenterToEnd =
    new Tween(begin: centerX, end: endX).animate(animationController);

    Animation animationFromEndToStart =
    new Tween(begin: endX, end: startX).animate(animationController);

    Animation animationFromEndToCenter =
    new Tween(begin: endX, end: centerX).animate(animationController);

    Animation animationFromEndToEnd =
    new Tween(begin: endX, end: endX).animate(animationController);

    switch (mIndex) {
      case 0:
        {
          print(oldIndex);
          if (oldIndex == 1) {
            mAnimation = animationFromCenterToStart;
          } else if (oldIndex == 2) {
            mAnimation = animationFromCenterToStart;
          } else {
            mAnimation = animationFromStartToStart;
          }
        }
        break;
      case 1:
        {
          print(oldIndex);
          if (oldIndex == 0) {
            mAnimation = animationFromStartToCenter;
          } else if (oldIndex == 2) {
            mAnimation = animationFromEndToCenter;
          } else {
            mAnimation = animationFromCenterToCenter;
          }
        }
        break;
      case 2:
        {
          print(oldIndex);
          if (oldIndex == 0) {
            mAnimation = animationFromStartToEnd;
          } else if (oldIndex == 1) {
            mAnimation = animationFromCenterToEnd;
          } else {
            mAnimation = animationFromEndToEnd;
          }
        }
        break;
    }

    return new AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return new Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          overflow: Overflow.visible,
          children: <Widget>[
            new Material(
              child: viewContainer[mIndex],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: new Scaffold(
                backgroundColor: Colors.transparent,
                bottomNavigationBar: new SafeArea(
                  child: new ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12.0),
                      bottomRight: Radius.circular(24.0),
                      bottomLeft: Radius.circular(24.0),
                      topLeft: Radius.circular(12.0),
                    ),
                    child: new Container(
                      width: double.infinity,
                      height: 56.0,
                      color: Colors.transparent,
                      child: new BottomAppBar(
                        notchMargin: 8.0,
                        shape: new CircularNotchedRectangle(),
                        elevation: 0.0,
                        color: const Color(0xFFF0F0F0),
                        child: new Stack(
                          fit: StackFit.expand,
                          overflow: Overflow.visible,
                          children: <Widget>[
                            new Positioned(
                              width: width - 32.0,
                              height: 56.0,
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  new IconButton(
                                    icon: iconList[0],
                                    onPressed: () {
                                      return onTabTapped(0);
                                    },
                                    color: mIndex == 0
                                        ? Colors.transparent
                                        : const Color(0xFF546B7F),
                                  ),
                                  new IconButton(
                                    icon: iconList[1],
                                    onPressed: () {
                                      return onTabTapped(1);
                                    },
                                    color: mIndex == 1
                                        ? Colors.transparent
                                        : const Color(0xFF546B7F),
                                  ),
                                  new IconButton(
                                    icon: iconList[2],
                                    onPressed: () {
                                      return onTabTapped(2);
                                    },
                                    color: mIndex == 2
                                        ? Colors.transparent
                                        : const Color(0xFF546B7F),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                floatingActionButtonAnimator:
                CustomFloatingActionButtonAnimator.scaling,
                floatingActionButtonLocation: new StartDocked(
                  additionalMargin: 24.0,
                  fabX: mAnimation.value,
                ),
                floatingActionButton: new FloatingActionButton(
                  onPressed: () {},
                  child: fabIconList[mIndex],
                  elevation: 0.0,
                  highlightElevation: 0.0,
                  backgroundColor: const Color(0xFFF0F0F0),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
