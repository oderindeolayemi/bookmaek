import 'package:bookmaek/scoped_models/main.dart';
import 'package:bookmaek/screens/browser.dart';
import 'package:flutter/material.dart';
import '../utilities/constants.dart';

class BrowserScreen extends StatefulWidget {
  final Function switchBack;
  final MainModel model;
  BrowserScreen(this.switchBack, this.model);

  @override
  _BrowserScreenState createState() => _BrowserScreenState();
}

class _BrowserScreenState extends State<BrowserScreen> {

  @override
  void initState() {
    print(widget.model.tabs.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return Future.value(false);
      },
      child: Scaffold(
        body: (widget.model.tabs.length == 0) ? Text('No active tabs') : RenderBrowser(widget.model.tabs, widget.model.activeTab),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            widget.switchBack();
          },
          mini: true,
          child: Icon(Icons.face, color: (widget.model.darkMode) ? kDeepestShade : Colors.black),
          backgroundColor: (widget.model.darkMode) ? Colors.black : Color(0xFFc1c1c1),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 2,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          fixedColor: Colors.black,
          unselectedItemColor: Colors.black,
          backgroundColor: (widget.model.darkMode) ? Colors.black : Colors.transparent,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.arrow_back), title: SizedBox(height: 10.0)),
            BottomNavigationBarItem(icon: Icon(Icons.arrow_forward), title: SizedBox(height: 10.0)),
            BottomNavigationBarItem(icon: Icon(Icons.reorder), title: SizedBox(height: 10.0)),
            BottomNavigationBarItem(icon: Icon(Icons.filter_1), title: SizedBox(height: 10.0)),
            BottomNavigationBarItem(icon: Icon(Icons.home), title: SizedBox(height: 10.0))
          ],
          onTap: (index){
            if(index == 0){
              print('go back');
              widget.model.goBack(widget.model.tabs[widget.model.activeTab]);
            }else if(index == 1){
              print('go forward');
              widget.model.goForward(widget.model.tabs[widget.model.activeTab]);
            }else if(index == 2){
              print('open menu');
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context, 
                builder: (context){
                  return Container(
                    height: 100.0,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                  );
                }
              );
            }else if(index == 3){
              //print('show tabs');
              showModalBottomSheet(
                enableDrag: true,
                backgroundColor: Colors.transparent,
                context: context, 
                builder: (BuildContext context){
                  return Stack(
                    children: <Widget> [
                      LimitedBox(
                        child : Container(
                          padding: EdgeInsets.symmetric(vertical: 5.0),
                          margin: EdgeInsets.only(bottom: 75.0, left: 5.0, right: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: widget.model.tabs.length,
                            itemBuilder: (BuildContext context, int index){
                              return Card(
                                color: Colors.white,
                                child: ListTile(
                                  leading: Icon(Icons.language),
                                  title: Text((widget.model.tabs[index].title == null) ? 'New tab' : widget.model.tabs[index].title),
                                  subtitle: Text((widget.model.tabs[index].url == '') ? '' : widget.model.tabs[index].url),
                                  trailing: Icon(Icons.close, color: Colors.black),
                                  onTap: (){
                                    Navigator.pop(context);
                                    widget.model.switchTabs(index);
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder:(BuildContext context) => BrowserScreen(widget.switchBack, widget.model)));
                                  },
                                )
                              );
                            },
                          )
                        )
                      ),
                      Positioned(
                        child: GestureDetector(
                          onTap: (){},
                          child: Container(
                            child: Icon(Icons.add, size: 30.0, color: Colors.black),
                            padding: EdgeInsets.all(8.0),
                            margin: EdgeInsets.only(bottom: 6.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white
                            )
                          )
                        ),
                        bottom: 2.0,
                        right: 5.0
                      )
                    ]
                  );
                }
              );
            }else{
              print('open home');
            }
          },
        ),
      ),
    );
  }
}