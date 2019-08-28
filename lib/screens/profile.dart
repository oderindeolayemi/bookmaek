import 'package:bookmaek/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookmaek/widgets/gradient_button.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({ Key key }) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin{
  Container profileHero(BuildContext context){
    return Container(
      height: 350.0,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/25.jpg'),
          fit: BoxFit.cover
        )
      ),
      child: profileHeroContents(context),
    );
  }

  Stack profileHeroContents(BuildContext context){
    return Stack(
      children: <Widget>[
        Positioned(
          left: 5.0,
          top: 40.0,
          child: IconButton(
            onPressed: ()=> Navigator.pushReplacementNamed(context, '/home'),
            icon: Icon(Icons.arrow_back),
          ),
        ),
        Positioned(
          right: 2.5,
          top: 40.0,
          child: IconButton(
            onPressed: (){},
            icon: Icon(Icons.more_vert),
          ),
        ),
        Positioned(
          left: 20.0,
          bottom: 30.0,
          child: profileDetails()
        )
      ],
    );
  }

  Row profileDetails(){
    return Row(
      children: <Widget>[
        Container(
          width: 75.0,
          height: 75.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/images/16.jpg'),
              fit: BoxFit.cover
            )
          ),
        ),
        SizedBox(width: 10.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Jorge Curtis', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600)),
            Text('@jorgecurtis', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300))
          ],
        )
      ],
    );
  }

  Container profileSummary(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Text('128', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600)),
                Text('Posts')
              ],
            ),
          ),
          SizedBox(width: 5.0),
          Expanded(
            child: Column(
              children: <Widget>[
                Text('3120', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600)),
                Text('Following')
              ],
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: Column(
              children: <Widget>[
                Text('5024', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600)),
                Text('Followers')
              ],
            ),
          ),
          SizedBox(width: 10.0),
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
                    Colors.blue[100],
                    Colors.blue[400],
                    Colors.blue[700],
                    Colors.blue[900]
                  ]
                )
              ),
              child: IconButton(
                onPressed: (){
                  
                },
                icon: Icon(Icons.person_add)
              ),
            )
          ),
          Expanded(flex: 2, child: GradientButton(onPressed: (){}, text: 'BOOK'))
        ],
      ),
    );
  }

  Container profileTabs(TabController controller){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      color: kTabBarColor,
      child: TabBar(
        labelColor: kActiveTabBarIconColor,
        unselectedLabelColor: Colors.white,
        indicatorColor: kTabBarColor,
        controller: controller,
        tabs: <Widget>[
          Tab(
            icon: Icon(Icons.apps),
          ),
          Tab(
            icon: Icon(Icons.perm_media),
          ),
          Tab(
            icon: Icon(Icons.library_music),
          ),
          Tab(
            icon: Icon(Icons.store),
          )
        ]
      )
    );
  }

  TabBarView tabContent(TabController controller){
    return TabBarView(
      controller: controller,
      children: <Widget>[
       Column(children: <Widget>[ Text('First Tab'),],),
        Text('Second Tab'),
        Text('Third Tab'),
        Text('Fourth Tab')
      ]
    );
  }

  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this,initialIndex: 0, length: 4);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: profileHero(context),
          ),
          SliverToBoxAdapter(
            child: profileSummary(),
          ),
          SliverToBoxAdapter(
            child: profileTabs(_tabController),
          ),
        ],
      ),
    );
  }
}

// Column(
//         children: <Widget>[
//           profileHero(context),
//           profileSummary(),
//           profileTabs(_tabController),
//           // tabContent(_tabController),
//         ],
//       )