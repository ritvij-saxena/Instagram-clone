import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:camera/camera.dart';

List<CameraDescription> cameras;

Future<void> main() async {
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 0,
      child: Scaffold(
          resizeToAvoidBottomPadding: false,
          body: TabBarView(children: <Widget>[
            HomePage(),
            SearchPage(),
            Center(child:Text('YOUR GALLERY')),
            LikesPage(),
            Container(
              color: Colors.blueGrey,
            ),
          ]),
          bottomNavigationBar: Container(
            margin: EdgeInsets.only(bottom: 8.0),
            child: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                ),
                Tab(
                  icon: Icon(Icons.search),
                ),
                Tab(
                  icon: Icon(Icons.add),
                ),
                Tab(
                  icon: Icon(Icons.favorite),
                ),
                Tab(
                  icon: Icon(Icons.perm_identity),
                ),
              ],
              unselectedLabelColor: Colors.black,
              labelColor: Colors.red,
              indicatorColor: Colors.transparent,
            ),
          )),
    );
  }
}

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return Container(child: CameraPreview(controller));
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.camera_enhance,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).push(
                  CupertinoPageRoute<Null>(builder: (BuildContext context) {
                CameraPage();
              }));
            }),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.tv,
                color: Colors.black,
              ),
              onPressed: null),
          IconButton(
              icon: Icon(
                Icons.send,
                color: Colors.black,
              ),
              onPressed: null),
        ],
        title: Text(
          'Instagram',
          style: TextStyle(color: Colors.black, fontFamily: 'billabong'),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          Row(children: <Widget>[
            Expanded(
              child: Container(
                height: 50,
                width: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.red,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.green,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.yellow,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.lightGreen,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.purple,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.brown,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ]),
          Divider(
            color: Colors.black,
          ),
          Flexible(
              child: ListView(
            children: <Widget>[
              Card(
                elevation: 0.0,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: CircleAvatar(
                                backgroundColor: Colors.blue,
                              )),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'UserA',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.0,
                              ),
                            ),
                            Text('San Diego, California',
                                style: TextStyle(
                                  fontSize: 10.0,
                                ))
                          ],
                        ),
                        Expanded(child: SizedBox()),
                        IconButton(
                          icon: Icon(Icons.more_vert),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          color: Colors.blue,
                          constraints: BoxConstraints(maxHeight: 282),
                        ),
                        Row(
                          children: <Widget>[
                            IconButton(
                                icon: Icon(Icons.favorite_border),
                                onPressed: () {}),
                            IconButton(icon: Icon(Icons.insert_comment)),
                            IconButton(icon: Icon(Icons.send)),
                            Expanded(child: SizedBox()),
                            IconButton(icon: Icon(Icons.bookmark_border))
                          ],
                        )
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'UserA',
                              style: TextStyle(
                                  fontSize: 10.0, fontWeight: FontWeight.bold),
                            )))
                  ],
                ),
              ), //blue
              Card(
                elevation: 0.0,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: CircleAvatar(
                                backgroundColor: Colors.red,
                              )),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'UserB',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.0,
                              ),
                            ),
                            Text('Los Angeles, California',
                                style: TextStyle(
                                  fontSize: 10.0,
                                ))
                          ],
                        ),
                        Expanded(child: SizedBox()),
                        IconButton(
                          icon: Icon(Icons.more_vert),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          color: Colors.red,
                          constraints: BoxConstraints(maxHeight: 282),
                        ),
                        Row(
                          children: <Widget>[
                            IconButton(
                                icon: Icon(Icons.favorite_border),
                                onPressed: () {}),
                            IconButton(icon: Icon(Icons.insert_comment)),
                            IconButton(icon: Icon(Icons.send)),
                            Expanded(child: SizedBox()),
                            IconButton(icon: Icon(Icons.bookmark_border))
                          ],
                        )
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'UserB',
                              style: TextStyle(
                                  fontSize: 10.0, fontWeight: FontWeight.bold),
                            )))
                  ],
                ),
              ), //red
              Card(
                elevation: 0.0,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: CircleAvatar(
                                backgroundColor: Colors.green,
                              )),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'UserC',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.0,
                              ),
                            ),
                            Text('San Diego, California',
                                style: TextStyle(
                                  fontSize: 10.0,
                                ))
                          ],
                        ),
                        Expanded(child: SizedBox()),
                        IconButton(
                          icon: Icon(Icons.more_vert),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          color: Colors.green,
                          constraints: BoxConstraints(maxHeight: 282),
                        ),
                        Row(
                          children: <Widget>[
                            IconButton(
                                icon: Icon(Icons.favorite_border),
                                onPressed: () {}),
                            IconButton(icon: Icon(Icons.insert_comment)),
                            IconButton(icon: Icon(Icons.send)),
                            Expanded(child: SizedBox()),
                            IconButton(icon: Icon(Icons.bookmark_border))
                          ],
                        )
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'UserC',
                              style: TextStyle(
                                  fontSize: 10.0, fontWeight: FontWeight.bold),
                            )))
                  ],
                ),
              ), //green
              Card(
                elevation: 0.0,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: CircleAvatar(
                                backgroundColor: Colors.yellow,
                              )),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'UserD',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.0,
                              ),
                            ),
                            Text('Chicago, Illinois',
                                style: TextStyle(
                                  fontSize: 10.0,
                                ))
                          ],
                        ),
                        Expanded(child: SizedBox()),
                        IconButton(
                          icon: Icon(Icons.more_vert),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          color: Colors.yellow,
                          constraints: BoxConstraints(maxHeight: 282),
                        ),
                        Row(
                          children: <Widget>[
                            IconButton(
                                icon: Icon(Icons.favorite_border),
                                onPressed: () {}),
                            IconButton(icon: Icon(Icons.insert_comment)),
                            IconButton(icon: Icon(Icons.send)),
                            Expanded(child: SizedBox()),
                            IconButton(icon: Icon(Icons.bookmark_border))
                          ],
                        )
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'UserD',
                              style: TextStyle(
                                  fontSize: 10.0, fontWeight: FontWeight.bold),
                            )))
                  ],
                ),
              ), //yellow
              Card(
                elevation: 0.0,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: CircleAvatar(
                                backgroundColor: Colors.grey,
                              )),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'UserE',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.0,
                              ),
                            ),
                            Text('San Francisco, California',
                                style: TextStyle(
                                  fontSize: 10.0,
                                ))
                          ],
                        ),
                        Expanded(child: SizedBox()),
                        IconButton(
                          icon: Icon(Icons.more_vert),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          color: Colors.grey,
                          constraints: BoxConstraints(maxHeight: 282),
                        ),
                        Row(
                          children: <Widget>[
                            IconButton(
                                icon: Icon(Icons.favorite_border),
                                onPressed: () {}),
                            IconButton(icon: Icon(Icons.insert_comment)),
                            IconButton(icon: Icon(Icons.send)),
                            Expanded(child: SizedBox()),
                            IconButton(icon: Icon(Icons.bookmark_border))
                          ],
                        )
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'UserE',
                              style: TextStyle(
                                  fontSize: 10.0, fontWeight: FontWeight.bold),
                            )))
                  ],
                ),
              ), //grey
            ],
          )),
        ],
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context)=> SearchPageContent()));
              }),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Search',
              ),
            ),
          ),
          IconButton(
              icon: Icon(
                Icons.settings_overscan,
                color: Colors.black,
              ),
              onPressed: () {})
        ],
      ),
      body: Container(
        color: Colors.orangeAccent,
      ),
    );
  }
}

class SearchPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                child: Text('TOP',style: TextStyle(fontSize: 10.0,color: Colors.black),),
              ),
              Tab(
                child: Text('ACCOUNTS',style: TextStyle(fontSize: 10.0,color: Colors.black),),
              ),
              Tab(
                child: Text('TAGS',style: TextStyle(fontSize: 10.0,color: Colors.black),),
              ),
              Tab(
                child: Text('PLACES',style: TextStyle(fontSize: 10.0,color: Colors.black),),
              )
            ],
          ),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,), onPressed: (){
              Navigator.pop(context);
            }),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Search'),
              ),
            ),
          ],
        ),
        body: TabBarView(children: [
          Center(
            child: Text('TOP'),
          ),
          Center(
            child: Text('ACCOUNTS'),
          ),
          Center(
            child: Text('TAGS'),
          ),
          Center(
            child: Text('PLACES'),
          ),
        ]),
      ),
      length: 4,
    );
  }
}


class LikesPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: TabBar(tabs: [
            Padding(
              padding: EdgeInsets.only(top:35.0),
              child: Tab(child: Text('FOLLOWING',style: TextStyle(fontSize: 10.0,color: Colors.black),)),
            ),
            Padding(
              padding: const EdgeInsets.only(top:35.0),
              child: Tab(child: Text('YOU',style: TextStyle(fontSize: 10.0,color: Colors.black),),),
            )
          ])
        ,
          body: TabBarView(
            children: <Widget>[
              Center(child: Text('FOLLOWING',style: TextStyle(fontSize: 10.0,color: Colors.black),),),
              Center(child: Text('YOU',style: TextStyle(fontSize: 10.0,color: Colors.black),),)
            ],
          ),
        )
    );
  }

}
