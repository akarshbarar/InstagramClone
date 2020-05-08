import 'package:flutter/material.dart';
import 'package:instagramcloneflutter/Pages/PostDisplay.dart';

TabController tabController;

Widget profile(BuildContext context) {
  // tabController = new TabController(length: 3, vsync: this);
  return Scaffold(
    appBar: AppBar(
      title: Text("myCodecave"),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.menu), onPressed: () {  },)
      ],
    ),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Container(
          height: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              child: Image.network("https://cdn2.iconfinder.com/data/icons/ui-v-1-circular-glyph/48/UI_v.1-Circular-Glyph-20-512.png"),
             radius: 50,
            ),
            Column(
              children: <Widget>[
                Text("0",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                Text("Post")
              ],
            ),
            Column(
              children: <Widget>[
                Text("0",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                Text("Followers")
              ],
            ),
            Column(
              children: <Widget>[
                Text("0",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                Text("Following")
              ],
            ),
          ],
        ),
              Text("CodeCave",style: TextStyle(fontWeight: FontWeight.bold),),
              Text("Description",),
              Text("Description",),
              Text("Description",),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    child: Text("Edit Profile"),
                    onPressed: (){},
                    hoverColor: Colors.grey,
                  ),
                   FlatButton(
                    child: Text("Promotions"),
                    onPressed: (){},
                    hoverColor: Colors.grey,
                  ),
                  FlatButton(
                    child: Text("Contact"),
                    onPressed: (){},
                    hoverColor: Colors.grey,
                  ),
                ],
              ),
        
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child:PostDisplay(),
        ),
          
        ],
      ),
    ),
  );

}
