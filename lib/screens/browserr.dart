import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_models/main.dart';
import '../models/tab.dart';
import '../utilities/constants.dart';
import '../widgets/browser_address_bar.dart';

const List<MaterialColor> tabColors = [Colors.pink, Colors.yellow, Colors.blue, Colors.brown, Colors.cyan, Colors.green, Colors.indigo];

class Browser extends StatefulWidget {
  final MainModel model;

  Browser(this.model);
  @override
  _BrowserState createState() => _BrowserState();
}

class _BrowserState extends State<Browser> with SingleTickerProviderStateMixin{
   PageController _pageController;
   InAppWebViewController inAppWebController;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
      keepPage: true,
      viewportFraction: 0.9
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Key tabKey = Key(Random().nextInt(1000).toString());
    return ScopedModelDescendant<MainModel>(
      builder: (context, child, model){
        return Scaffold(
          appBar: AppBar(
            leading: Container(),
            backgroundColor: (model.darkMode) ? Colors.black : Colors.white,
            elevation: 0.0,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add, color: kActiveTabBarIconColor,),
                onPressed: (){
                  model.addTabs(
                    Tabs(
                      url: 'https://google.com',
                      key: Random().nextInt(100000).toString(),
                      progress: 0,
                      controller: inAppWebController
                    )
                  );
                },
              )
            ],
          ),
          body: (model.tabs.length == 0) ? Center(
            child: Text('No tabs open', style: TextStyle(fontSize: 25.0)),
          ) : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 50.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: model.tabs.length,
                  itemBuilder: (context, index){
                    return BrowserTab(index, model.tabs[index].key, model.tabs[index].url);
                  }
                )
              )
            ],
          )
        );
      }
    );
  }
}

//BROWSER TAB
class BrowserTab extends StatelessWidget {
  final int index;
  final String url;
  final String _key;

  BrowserTab(this.index, this._key, this.url);

  Widget heroOverlay(){
    return Container(
      height: 5000.0,
      width: 5000.0,
      color: Colors.grey,
    );
  }

  @override
  Widget build(BuildContext context) {
    Key tabKey = Key(_key);
    return ScopedModelDescendant<MainModel>(
      builder: (context, child, model){
        return GestureDetector(
          onTap: (){
            // Navigator.push(context, PageRouteBuilder<String>(
            //   transitionDuration: Duration(seconds: 5),
            //   pageBuilder: (context, animation, secondAnimation) => BrowserTab(index)
            // )).then((String currentTabUrl){
            //   model.tabs[index].url = currentTabUrl;
            // });
            Navigator.push(context, MaterialPageRoute<String>(
             builder: (context) => BrowserPage(index, tabKey, url, model.tabs[index])
            )).then((String currentTabUrl){
              model.setTabUrl(index, currentTabUrl);
            });
          },
          child: Dismissible(
            key: tabKey,
            direction: DismissDirection.vertical,
            onDismissed: (DismissDirection direction){
              model.deleteTabs(index);
            },
            child: Hero(
              tag: tabKey,
              // placeholderBuilder: (BuildContext context, Size size, Widget child){
              //   return Opacity(
              //     opacity: 0.2,
              //     child: heroOverlay()
              //   );
              // },
              flightShuttleBuilder: (BuildContext flightContext, Animation<double> animation, HeroFlightDirection flightDirection, BuildContext fromHeroContext, BuildContext toHeroContext){
                final Hero fromHero = fromHeroContext.widget;
                // return RotationTransition(
                //   turns: animation,
                //   child: heroOverlay(),
                // );
                return ScaleTransition(
                  scale: animation,
                  child: fromHero,
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: tabColors[Random().nextInt(tabColors.length)]
                ),
              ),
            )
          ),
        );
      }
    );
  }
  
}

class BrowserPage extends StatefulWidget {
  final int index;
  final Key tabKey;
  final String url;
  final Tabs tab;
  BrowserPage(this.index, this.tabKey, this.url, this.tab);

  @override
  _BrowserPageState createState() => _BrowserPageState();
}

class _BrowserPageState extends State<BrowserPage> {
  bool _isVisible;
  TextEditingController _browseStringController = TextEditingController();

  @override
  void initState() {
    _isVisible = false;
    print(widget.url);
    super.initState();
  }

  void changeVisibility(){
    setState(() {
      _isVisible = !(_isVisible);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return ScopedModelDescendant<MainModel>(
      builder: (context, child, model){
        return SafeArea(
          child: Hero(
            tag: widget.tabKey,
            child: Scaffold(
              backgroundColor: (model.darkMode) ? Color(0xFF191919): Colors.white,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                title: TextField(
                  controller: _browseStringController,
                  decoration: InputDecoration(
                    prefixIcon: Container(
                      margin: EdgeInsets.only(right: 10.0),
                      child: IconButton(icon: Icon(Icons.home, color: Colors.white,), onPressed: (){
                        FocusScope.of(context).requestFocus(FocusNode());
                        model.goToPage('https://www.google.com/', widget.tab);
                      }),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          bottomLeft: Radius.circular(30.0)
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.1, 0.4, 0.5, 0.9],
                          colors: [
                            Colors.orange[100],
                            Colors.orange[400],
                            Colors.orange[700],
                            Colors.orange[900]
                          ]
                        )
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.send),
                      onPressed: (){
                        FocusScope.of(context).requestFocus(FocusNode());
                        model.goToPage(_browseStringController.text, widget.tab);
                      }
                    ),
                    hintText: 'Enter your address',
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(color: (model.darkMode) ? Color(0xFF191919): Color(0xFFc1c1c1))
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(color: (model.darkMode) ? Color(0xFF191919): Color(0xFFc1c1c1))
                      ),
                      filled: true,
                      fillColor: (model.darkMode) ? Color(0xFF191919): Color(0xFFc1c1c1)
                  ),
                ),
                actions: <Widget>[
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context, _browseStringController.text);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Center(child: Icon(Icons.view_array)),
                      decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.1, 0.4, 0.5, 0.9],
                        colors: [
                          Colors.orange[100],
                          Colors.orange[400],
                          Colors.orange[700],
                          Colors.orange[900]
                        ])
                      ),
                    )
                  )
                ],
                bottom: (widget.tab.progress == 1.0) ? null : PreferredSize(
                  child: LinearProgressIndicator(
                    value: widget.tab.progress,
                    backgroundColor: Colors.grey,
                  ),
                  preferredSize: null
                )
              ),
              body: GestureDetector(
                onTap: (){
                  FocusScopeNode currentFocus = FocusScope.of(context);

                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                  changeVisibility();
                },
                child: InAppWebView(
                  initialUrl: (widget.tab.url != 'https://google.com') ? widget.tab.url : 'https://google.com',
                  initialHeaders: {},
                  initialOptions: InAppWebViewWidgetOptions(
                    inAppWebViewOptions: InAppWebViewOptions(
                        debuggingEnabled: true,
                    )
                  ),
                  onWebViewCreated: (InAppWebViewController controller) {
                    widget.tab.controller = controller;
                  },
                  onLoadStart: (InAppWebViewController controller, String url) {
                    //print(url);
                    _browseStringController.text = url;
                    model.setTabUrl(widget.index, url);
                  },
                  onLoadStop: (InAppWebViewController controller, String url) async {
                    _browseStringController.text = url;
                    model.setTabUrl(widget.index, url);
                    //String getUrl = await controller.getUrl();
                    //model.setTabUrl(widget.index, getUrl);
                  },
                  onProgressChanged: (InAppWebViewController controller, int progress) {
                    print(progress / 100);
                    model.updateProgress(progress / 100, widget.tab);
                    //model.updateProgress(widget.index, progress / 100);
                  },
                )
                // ListView.builder(
                //   itemCount: model.posts.length,
                //   itemBuilder: (BuildContext context, int index){
                //     return ListTile(
                //       leading: CircleAvatar(),
                //       title: Text('Test'),
                //       subtitle: Text('rctyguhiugyguijgfctvujnyuguhihbfughiuhnuv'),
                //     );
                //   }
                // )
              ),
              bottomNavigationBar: AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: _isVisible ? 0.0 : 1.0,
                child: CupertinoTabBar(
                  activeColor: (model.darkMode) ? kDeepestShade : Colors.black54,
                  inactiveColor: (model.darkMode) ? kDeepestShade : Colors.black54,
                  backgroundColor: (model.darkMode) ? Colors.black : Colors.transparent,
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.arrow_back_ios),
                      title: Container()
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.arrow_forward_ios),
                      title: Container()
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.refresh),
                      title: Container()
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(FontAwesomeIcons.bookmark),
                      title: Container()
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.more_horiz),
                      title: Container()
                    )
                  ],
                  onTap: (int index) async{
                    if(index == 0){
                      model.goBack(widget.tab);
                      //String currentUrl = await model.getCurrentUrl(widget.tab);
                      //model.setTabUrl(widget.index, currentUrl);
                    }else if(index == 1){
                      model.goForward(widget.tab);
                    }else if(index == 2){
                      model.refreshTab(widget.tab);
                    }else if(index == 3){
                      showDialog(
                        context: context,
                        builder: (context){
                          return AlertDialog(
                            title: Text('Booked'),
                          );
                        }
                      );
                    }else{
                      showDialog(
                        context: context,
                        builder: (context){
                          return AlertDialog(
                            title: Text('Options'),
                          );
                        }
                      );
                    }
                  },
                ),
              )
            ),
          )
        );
      },
    );
  }
}



// if(model.tabs.length == 0){
//             return Center(
//               child: Text('No tabs open'),
//             );
//           }else{
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Expanded(
//                   child: ListView.builder(
//                     padding: EdgeInsets.symmetric(vertical: 100.0),
//                     scrollDirection: Axis.horizontal,
//                     itemCount: _pages.length,
//                     itemBuilder: (context, index){
//                       return BrowserTab(index).mini();
//                     }
//                   )
//                 )
//               ],
//             );
//           }
// ListView(
//               padding: EdgeInsets.symmetric(vertical: 100.0),
//               scrollDirection: Axis.horizontal,
//               children: <Widget>[
//                 BrowserTab().mini(),
//                 BrowserTab().mini(),
//                 BrowserTab().mini(),
//                 BrowserTab().mini(),
//                 BrowserTab().mini(),
//                 BrowserTab().mini(),
//               ],
//             )

// 
// SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Center(
//               child: Row(
//                 children: model.tabs.map(
//                 (e) => Dismissible(
//                     key: Key(e.url.toString()),
//                     direction: DismissDirection.vertical,
//                     onDismissed: (DismissDirection direction){
//                       if(direction == DismissDirection.vertical){
//                         int tabIndex = model.tabs.indexOf(e);
//                         model.removeTab(tabIndex);
//                       }
//                     },
//                     child:  GestureDetector(
//                       onTap: (){
//                         Navigator.push(context, MaterialPageRoute(
//                           builder: (context){
//                             return Browser();
//                           }
//                         ));
//                       },
//                       child: Container(
//                         margin: EdgeInsets.symmetric(horizontal: 10.0),
//                         width: 350,
//                         height: 550,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15.0),
//                           color: kTabBarColor
//                         )
//                       )
//                     )
//                   )
//                 ).toList()
//               ),
//             ),
//             )

// Dismissible(
//                           key: Key(model.tabs[index].toString()),
//                           direction: DismissDirection.vertical,
//                           onDismissed: (DismissDirection direction){
//                             if(direction == DismissDirection.vertical){
                              
//                             }
//                           },
//                           child:  GestureDetector(
//                             onTap: (){
//                               Navigator.push(context, MaterialPageRoute(
//                                 builder: (context){
//                                   return Browser();
//                                 }
//                               ));
//                             },
//                             child: Container(
//                               margin: EdgeInsets.symmetric(horizontal: 10.0),
//                               width: 350,
//                               height: 550,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(15.0),
//                                 color: kCardColor
//                               )
//                             )
//                           )
//                         );

// class Tab extends StatelessWidget {
//   final int id;
//   final String url;
//   final Color colour;

//   Tab({this.id,this.colour, this.url});

//   @override
//   Widget build(BuildContext context) {
//     return Dismissible(
//       key: Key(id.toString()),
//       direction: DismissDirection.vertical,
//       onDismissed: (DismissDirection direction){
//         if(direction == DismissDirection.vertical){
          
//         }
//       },
//       child:  GestureDetector(
//         onTap: (){
//           Navigator.push(context, MaterialPageRoute(
//             builder: (context){
//               return BrowseView();
//             }
//           ));
//         },
//         child: Container(
//           margin: EdgeInsets.symmetric(horizontal: 10.0),
//           width: 350,
//           height: 550,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15.0),
//             color: colour
//           )
//         )
//       )
//     );
//   }
// }

// class TabView extends StatefulWidget {
//   @override
//   _TabViewState createState() => _TabViewState();
// }

// class _TabViewState extends State<TabView> {
//   List<Color> _colors;
//   List<Tab> _tabs;

//   @override
//   void initState() {
//     _tabs = [];
//     _colors = [Colors.red, Colors.purple, Colors.pink, Colors.blue, Colors.green, Colors.green, Colors.teal, Colors.brown, Colors.black];
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Container(),
//         elevation: 0.0,
//         backgroundColor: kScaffoldBackgroundColor,
//         actions: <Widget>[
//           IconButton(
//             onPressed: (){
//               setState(() {
//                 _tabs.add(
//                   Tab(
//                     id: _tabs.length,
//                     colour: _colors[Random().nextInt(_colors.length)]
//                   )
//                 );
//               });
//               print(_tabs.length);
//             },
//             icon: Icon(Icons.add, color: Colors.pink),
//           )
//         ],
//       ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Center(
//           child: Row(
//             children: _tabs
//           )
//         )
//       ),
//     );
//   }
// }

// class BrowseView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ScopedModelDescendant<MainModel>(
//         builder: (context, child, model){
//           return GestureDetector(
//             onTap: (){
//               FocusScope.of(context).requestFocus(FocusNode());
//             },
//             child: CustomScrollView(
//               slivers: <Widget>[
//                 SliverToBoxAdapter(
//                   child: AddressBar(),
//                 )
//               ]
//             )
//           );
//         }
//       )
//     );
//   }
// }

// class Browser extends StatefulWidget {
//   @override
//   _BrowserState createState() => _BrowserState();
// }

// class _BrowserState extends State<Browser> {
//   bool browseState = false;

//   @override
//   Widget build(BuildContext context) {
//     return (browseState) ? BrowseView(): TabView();
//   }
// }