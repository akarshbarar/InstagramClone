import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagramcloneflutter/Pages/Profile.dart';
import 'package:instagramcloneflutter/model.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
 int id=0;
  final List<ModelClass> item=<ModelClass>[
    ModelClass("CodeCave1","My Art","http://www.kanpursahodaya.org/images/icagenda/thumbs/themes/stock-vector-art-pop-art-illustration-pop-art-design-template-for-art-gallery-art-studio-school-of-the-arts-550002070.jpg",00),
    ModelClass("CodeCave2","My Art","http://www.kanpursahodaya.org/images/icagenda/thumbs/themes/stock-vector-art-pop-art-illustration-pop-art-design-template-for-art-gallery-art-studio-school-of-the-arts-550002070.jpg",00),
    ModelClass("CodeCave2","My Art","http://www.kanpursahodaya.org/images/icagenda/thumbs/themes/stock-vector-art-pop-art-illustration-pop-art-design-template-for-art-gallery-art-studio-school-of-the-arts-550002070.jpg",00),
  ];
  final List<String> status=["A","B","c","d","e","f","g","h","i","j"];
  @override



  Widget build(BuildContext context) {

    final tab=<Widget>[
      CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            floating: false,
            expandedHeight: 25.0,
            flexibleSpace: FlexibleSpaceBar(title: Text("Instragram "),),
            leading: IconButton(icon: Icon(Icons.camera_alt), onPressed: (){}),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.live_tv),onPressed: (){},),
              IconButton(icon: Icon(Icons.send),onPressed: (){},),
              PopupMenuButton(
                itemBuilder: (BuildContext context){
                  return [
                    PopupMenuItem(child:ListTile(title: Text("LogOut"),onTap:(){
                      FirebaseAuth.instance.signOut();
                      Navigator.pushNamed(context, '/login');
                    },)),
                  ];
                },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 100.0,
              child:ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: status.length,
                itemBuilder: (context,index){
                  return Container(
                    width: 100.0,
                    child: ListTile(
                      contentPadding: EdgeInsets.only(top: 20.0),
                      leading: CircleAvatar(child: Text("${status[index]}"),minRadius: 40.0,),
                      onTap: (){
                        print("${status[index]} clicked");
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(5.0),
            sliver: SliverFixedExtentList(
              itemExtent: 350.0,
              delegate: SliverChildBuilderDelegate((builder,index)=>post(item[index]),childCount: item.length),
            ),
          ),

        ],
      ),
      Center(child: Text("two"),),
      Center(child: Text("three"),),
      Center(child: Text("four"),),
      profile(context)
    ];
    final bnbi=<BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home,size: 30.0,),title: Text("")),
      BottomNavigationBarItem(icon: Icon(Icons.search,size: 30.0,),title: Text("")),
      BottomNavigationBarItem(icon: Icon(Icons.add_box,size: 30.0,),title: Text("")),
      BottomNavigationBarItem(icon: Icon(Icons.thumb_up,size: 30.0,),title: Text("")),
      BottomNavigationBarItem(icon: Icon(Icons.person,size: 30.0,),title: Text("")),
    ];
    final bottomnavbar=BottomNavigationBar(
      items: bnbi,
      currentIndex: id,
      type: BottomNavigationBarType.fixed,
      onTap: (int index){
        setState(() {
          id=index;
        });
      },
    );
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: tab[id],
      bottomNavigationBar: bottomnavbar,
    );
  }

  Widget post(ModelClass index){
    return GestureDetector(
      child: Card(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  child: FlutterLogo(size: 42.0,),
                ),
                Text(" "+index.UserName,style: TextStyle(fontWeight: FontWeight.bold, fontSize:30.0),),
              ],
            ),
            SizedBox(
              height: 180.0,
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                      child: Image.network(index.ImageUrl)
                  )
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 5.0),),
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.thumb_up),
                  onPressed: (){
                   setState(() {
                     index.Likes=index.Likes+1;
                   });
                  },),
                IconButton(icon: Icon(Icons.comment),onPressed: null,),
                IconButton(icon: Icon(Icons.share),onPressed: null,),
              ],
            ),
            Row(
              children: <Widget>[
                Text("   ${index.Likes}")
              ],
            ),
            Row(
              children: <Widget>[
                Text(index.UserName+" "+index.Description),
              ],
            ),
          ],
        ),
      ),
      onDoubleTap: (){
        setState(() {
          index.Likes=index.Likes+1;
        });
      },
    );

  }
}
