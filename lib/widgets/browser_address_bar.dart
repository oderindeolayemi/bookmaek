import 'package:bookmaek/models/tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_models/main.dart';
import '../utilities/constants.dart';

class AddressBar extends StatefulWidget {
  final MainModel model;
  final Tabs tab;
  AddressBar(this.model, this.tab);

  @override
  _AddressBarState createState() => _AddressBarState();
}

class _AddressBarState extends State<AddressBar> {
  TextEditingController _browseStringController = TextEditingController();
  bool browseMode;
  
  @override
  void initState(){
    if(widget.tab.url != null){
      _browseStringController.text = widget.model.getCurrentUrl(widget.tab);
    }
    browseMode = false;
    super.initState();
  }

  void _cancelbrowse(){
    setState(() {
      browseMode = false;
      _browseStringController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (context, child, model){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          // margin: EdgeInsets.only(top: 10.0),
          decoration: BoxDecoration(
            color: (model.darkMode) ? Colors.black : Colors.white,
            border: Border(
              bottom: BorderSide(color: Colors.grey, width: 0.5)
            ),
            boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 1.0, blurRadius: 10.0)]
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 6,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: TextField(
                    // autofocus: false,
                    controller: _browseStringController,
                    onChanged: (String value){
                      if (value.isNotEmpty){
                        setState(() {
                          // _browseStringController.text = value;
                          browseMode = true;
                        });
                      }else{
                        setState(() {
                          browseMode = false;
                        });
                      }
                    },
                    style: TextStyle(color: Colors.white),
                    cursorColor: kActiveTabBarIconColor,
                    decoration: InputDecoration(
                      prefixIcon: (browseMode) ? IconButton(icon: Icon(Icons.cancel), onPressed: ()=> _cancelbrowse()) : Icon(Icons.home),
                      suffixIcon: (browseMode) ? IconButton(icon: Icon(Icons.send), onPressed: (){
                        browseMode = false;
                        FocusScope.of(context).requestFocus(FocusNode());
                        print(_browseStringController.text);
                        model.goToPage('https://' + _browseStringController.text, widget.tab);
                        // widget._webViewController.loadUrl('https://' + _browseStringController.text);
                      }) : null,
                      hintText: 'Enter your address',
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
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
                  )
                )
              ),
              Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pop(context, _browseStringController.text);
                      // Navigator.push();
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
                        ]
                      )
                    ),
                  )
                  )
              )
            ],
          )
        );
      }
    );
  }
}