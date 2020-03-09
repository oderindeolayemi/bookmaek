import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_models/main.dart';
import '../utilities/constants.dart';

class SearchBar extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SearchBarState();
  }
}

class _SearchBarState extends State<SearchBar>{
  TextEditingController _searchStringController = TextEditingController();
  bool searchMode;
  
  @override
  void initState() {
    searchMode = false;
    super.initState();
  }

  void _cancelSearch(){
    setState(() {
      searchMode = false;
      _searchStringController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (context, child, model){
        return Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextField(
                    controller: _searchStringController,
                    onChanged: (String value){
                      if (value.isNotEmpty){
                        setState(() {
                          searchMode = true;
                        });
                      }else{
                        setState(() {
                          searchMode = false;
                        });
                      }
                    },
                    style: TextStyle(color: Colors.white),
                    cursorColor: kActiveTabBarIconColor,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: (model.darkMode) ? Colors.white : Colors.black),
                      suffixIcon: (searchMode) ? IconButton(icon: Icon(Icons.cancel, color: (model.darkMode) ? Colors.white : Colors.black), onPressed: ()=> _cancelSearch()) : null,
                      hintText: 'Search',
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
                child: Container(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                  width: 45.0,
                  height: 45.0,
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
                  child: IconButton(
                    onPressed: (){
                      model.changeView();
                    },
                    icon: Icon(Icons.camera_alt)
                  ),
                )
              )
            ],
          )
        );
      }
    );
  }
}