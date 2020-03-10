import 'package:bookmaek/models/tab.dart';
import 'package:bookmaek/scoped_models/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:scoped_model/scoped_model.dart';

class RenderBrowser extends StatefulWidget {
  final List<Tabs> _tabs;
  final int _currentTabIndex;
  RenderBrowser(this._tabs, this._currentTabIndex);
  @override
  _RenderBrowserState createState() => _RenderBrowserState();
}

class _RenderBrowserState extends State<RenderBrowser> {
  bool _isVisible;
  TextEditingController _browseStringController = TextEditingController();

  @override
  void initState() {
    _isVisible = false;
    print(widget._tabs[widget._currentTabIndex].url);
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
    return ScopedModelDescendant<MainModel>(
      builder: (context, child, model){
        return Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: TextField(
              controller: _browseStringController,
              decoration: InputDecoration(
                prefixIcon: Container(
                  margin: EdgeInsets.only(right: 10.0),
                  child: IconButton(icon: Icon(Icons.home, color: Colors.white), onPressed: (){
                    FocusScope.of(context).requestFocus(FocusNode());
                    model.goToPage('https://www.google.com/', widget._tabs[widget._currentTabIndex]);
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
                //suffixIcon: _isVisible ? null : IconButton(
                //icon: Icon(Icons.cancel),
                //onPressed: (){
                //  
                //  }
                //),
                hintText: 'Enter your address',
                  hintStyle: TextStyle(color: Colors.grey),
                  contentPadding: EdgeInsets.symmetric(horizontal: 5.0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Color(0xFFc1c1c1))
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Color(0xFFc1c1c1))
                  ),
                  filled: true,
                  fillColor: (model.darkMode) ? Color(0xFF191919): Color(0xFFc1c1c1)
              ),
            ),
            actions: <Widget>[
              GestureDetector(
                onTap: (){
                  FocusScope.of(context).requestFocus(FocusNode());
                  model.goToPage(_browseStringController.text, widget._tabs[widget._currentTabIndex]);
                },
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.only(right: 15.0),
                  child: Center(child: Icon(Icons.send)),
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
            //bottom: (widget._tabs.progress == 1.0) ? null : PreferredSize(
              //child: LinearProgressIndicator(
                //value: widget._tabs.progress,
                //backgroundColor: Colors.grey,
              //),
              //preferredSize: null
            //)
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
              initialUrl: (widget._tabs[widget._currentTabIndex].url != '') ? widget._tabs[widget._currentTabIndex].url : 'https://google.com',
              initialHeaders: {},
              initialOptions: InAppWebViewWidgetOptions(
                inAppWebViewOptions: InAppWebViewOptions(
                    debuggingEnabled: true,
                )
              ),
              onWebViewCreated: (InAppWebViewController controller) {
                widget._tabs[widget._currentTabIndex].controller = controller;
              },
              onLoadStart: (InAppWebViewController controller, String url) async {
                _browseStringController.text = url;
                model.setTabDetails(widget._currentTabIndex, url, 'Loading');
              },
              onLoadStop: (InAppWebViewController controller, String url) async {
                _browseStringController.text = url;
                String pageTitle = await model.fetchPageTitle(controller);
                model.setTabDetails(widget._currentTabIndex, url, pageTitle);
                //String getUrl = await controller.getUrl();
                //model.setTabUrl(widget.index, getUrl);
              },
              onProgressChanged: (InAppWebViewController controller, int progress) {
                print(progress / 100);
                model.updateProgress(progress / 100, widget._tabs[widget._currentTabIndex]);
                //model.updateProgress(widget.index, progress / 100);
              },
            )
          ),
        );
      },
    );
  }
}