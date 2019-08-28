import 'dart:math';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_models/main.dart';
import '../models/tab.dart';
import '../utilities/constants.dart';
import '../widgets/browser_address_bar.dart';

const List<MaterialColor> tabColors = [Colors.pink, Colors.yellow, Colors.blue, Colors.brown, Colors.cyan, Colors.green, Colors.indigo];

class BrowserTab extends StatelessWidget {
  final int index;

  BrowserTab(this.index);

  Widget mini(index){
    return ScopedModelDescendant<MainModel>(
      builder: (context, child, model){
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute<String>(
              builder: (context){
                return BrowserTab(index);
              }
            )).then((String currentTabUrl){
              model.tabs[index].url = currentTabUrl;
            });
          },
          child: Dismissible(
            key: Key(Random().nextInt(1000).toString()),
            direction: DismissDirection.vertical,
            onDismissed: (DismissDirection direction){
              model.deleteTabs(index);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: tabColors[Random().nextInt(tabColors.length)]
              ),
            )
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (context, child, model){
        return Scaffold(
          appBar: PreferredSize(
            child: AddressBar(model.tabs[index].url),
            preferredSize: Size(double.infinity, 60.0),
          )
        );
      },
    );
  }
}

class Browser extends StatefulWidget {
  final MainModel model;

  Browser(this.model);
  @override
  _BrowserState createState() => _BrowserState();
}

class _BrowserState extends State<Browser> with SingleTickerProviderStateMixin{
   List<Tabs> _pages = [];
   PageController _pageController;

  @override
  void initState() {
    _pages = widget.model.tabs;
    _pageController = PageController(
      initialPage: 0,
      keepPage: true,
      viewportFraction: 0.9
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  model.addTabs(Tabs());
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
                  padding: EdgeInsets.symmetric(vertical: 100.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: _pages.length,
                  itemBuilder: (context, index){
                    return BrowserTab(index).mini(index);
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