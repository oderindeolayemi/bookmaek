import 'package:flutter/material.dart';

import '../utilities/constants.dart';

int numberOfTabs;

class SlidingTabBar extends StatefulWidget{
  final int tabs;

  SlidingTabBar({@required this.tabs});
  @override
  _SlidingTabBarState createState() => _SlidingTabBarState();
}

class _SlidingTabBarState extends State<SlidingTabBar> with SingleTickerProviderStateMixin{
  AnimationController _sliderController;
  Animation _slider;

  @override
  void initState() {
    numberOfTabs = widget.tabs;
    _sliderController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3)
    );

    _slider = CurvedAnimation(
      parent: _sliderController,
      curve: Curves.easeIn
    );

    _sliderController.forward();

    _sliderController.addListener((){
        setState((){});
        print(_slider.value);
      }
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Slider(
        children: [
          SlidingTab(true, text: 'Popular', onTap: (){}),
          SlidingTab(false, text: 'Latest', onTap: (){}),
          SlidingTab(false, text: 'Friends', onTap: (){})
        ]
      )
    );
  }
}

class SlidingTab extends StatefulWidget {
  final String text;
  final bool selected;
  final Function onTap;
  
  SlidingTab(this.selected,{@required this.text, @required this.onTap});

  @override
  State<StatefulWidget> createState() {
    return SlidingTabState();
  }
}

class SlidingTabState extends State<SlidingTab>{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      padding: EdgeInsets.symmetric(horizontal: 45.0),
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0) ,
      child: Text(widget.text, style: (widget.selected) ? kSlidingTabSelectedText : kSlidingTabUnselectedText),
    );
  }
}

class Slider extends StatelessWidget {
  final List<SlidingTab> children;

  Slider({this.children});

  @override
  Widget build(BuildContext context) {
    // int selectedTab = 0;
    if(children.length == numberOfTabs){
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: children
        ),
      );
    }else{
      return ErrorWidget('Correct number of tabs not supplied to SlidingTab');
    }
  }
}