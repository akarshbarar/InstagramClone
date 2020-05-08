import 'package:flutter/material.dart';

class PostDisplay extends StatefulWidget {
  @override
  _PostDisplayState createState() => _PostDisplayState();
}

class _PostDisplayState extends State<PostDisplay> with SingleTickerProviderStateMixin{

   TabController t;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    t=new TabController(length: 3, vsync: this,initialIndex: 0);
  }
  @override
  Widget build(BuildContext context) {
   return new Scaffold(
      appBar: new AppBar(
	backgroundColor: Colors.white,
	automaticallyImplyLeading: false,
        bottom: new TabBar(
          controller: t,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Tab(icon:Icon(Icons.grid_on,color: Colors.grey,)),
            Tab(icon: Icon(Icons.live_tv,color: Colors.grey,)),
            Tab(icon:Icon(Icons.person,color: Colors.grey,)),
          ],

        ),
      ),
      body: new TabBarView(
        controller: t,
          children:<Widget>[
                    
           GridView.count(
              crossAxisCount: 3,
              children: List.generate(100, (index) {
                return Center(
                  child: Image.network(
                    'https://picsum.photos/250?image=9',
                    height: 200,
                    width: 200,
                  )
                );
              }),
            ),
            Text("Two"),//IGTV Part
            Text("Three")          //TAG PART  
          ],
      ),


    );
  }
}
