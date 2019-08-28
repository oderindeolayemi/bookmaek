import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_models/main.dart';
import '../utilities/constants.dart';

class AddressBar extends StatefulWidget {
  final String url;
  AddressBar(this.url);

  @override
  _AddressBarState createState() => _AddressBarState();
}

class _AddressBarState extends State<AddressBar> {
  TextEditingController _browseStringController = TextEditingController();
  bool browseMode;
  
  @override
  void initState() {
    if(widget.url != null){
      _browseStringController.text = widget.url;
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
          color: kTabBarColor,
          padding: EdgeInsets.symmetric(vertical: 10.0),
          margin: EdgeInsets.only(top: 40.0),
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
                      suffixIcon: (browseMode) ? IconButton(icon: Icon(Icons.send), onPressed: (){}) : null,
                      hintText: 'Enter your address',
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(color: Colors.blueGrey[800])
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(color: Colors.blueGrey[800])
                      ),
                      filled: true,
                      fillColor: Colors.blueGrey[800]
                    ),
                  )
                )
              ),
              Expanded(
                  child: GestureDetector(
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