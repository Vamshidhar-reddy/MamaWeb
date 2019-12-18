import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import './Data/variables.dart' as global;
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      global.loading = true;
    });
    // var data;
    print("hai");
    var response = await http.get(
        // Uri.encodeFull(
        "https://cors-anywhere.herokuapp.com/http://wielabs.esy.es/MamaGang/gear.php"
        // ),
        // headers: {"Accept": "application/json"}
        );
    if (response.statusCode == 200) {
      print("after hi");
      setState(() {
        global.itemsResponse = true;
        global.items = json.decode(response.body);
      });
    } else {
      print("error in getting api");
    }

    // print(data[1]);
    print("hai ra puk");
    // print(global.items[0]['img_url1']);
    setState(() {
      global.loading = false;
    });

    // return "Success!";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MamaGang',
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Mamagang"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // SizedBox(
            //   child: Text(!global.loading ? global.items[0]['title'] : "mama"),
            // ),
            // SizedBox(
            //     child: Image.network(!global.loading
            //         ? global.items[0]['img_url1']
            //         : "http://wielabs.esy.es/mamaGear/TShirts/img.jpg")
            //         ),
            Expanded(
              child: !global.itemsResponse
                  ? Center(
                      child: Text('loading...'),
                    )
                  : ListView.builder(
                      // controller: _scrollController,
                      itemCount: !global.loading ? global.items.length : 2,
                      itemBuilder: (context, index) {
                        return Column(
                          children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 6,
                              height: MediaQuery.of(context).size.height / 6,
                              child: Image.network(!global.loading
                                  ? global.items[0]['img_url1']
                                  : "http://wielabs.esy.es/mamaGear/TShirts/img.jpg"),
                            ),
                            SizedBox(
                              // height: MediaQuery.of(context).size.height / 10,
                              // width: MediaQuery.of(context).size.width / 10,
                              child: Text(global.itemsResponse
                                  ? global.items[index]['title']
                                  : "Wait"),
                            ),
                            Text("\n"),
                            SizedBox(
                                // height: MediaQuery.of(context).size.height / 10,
                                width: MediaQuery.of(context).size.width / 10,
                                child: Row(
                                  children: <Widget>[
                                    Text("₹"),
                                    Text(global.itemsResponse
                                        ? global.items[index]['mrp']
                                        : "Price"),
                                  ],
                                )),
                            SizedBox(
                                // height: MediaQuery.of(context).size.height / 10,
                                width: MediaQuery.of(context).size.width / 3,
                                child: RaisedButton(
                                  child: Text("ADD TO CART"),
                                  color: Colors.pinkAccent,
                                  onPressed: () {},
                                  textColor: Colors.white,
                                )),
                            Divider(
                              color: Colors.lightBlue,
                            ),
                            // Card(
                            //     child: ListTile(
                            //   // leading: CircleAvatar(
                            //   //   backgroundImage: NetworkImage(!global.loading
                            //   //       ? global.items[0]['img_url1']
                            //   //       : "http://wielabs.esy.es/mamaGear/TShirts/img.jpg"),
                            //   // ),
                            //   // contentPadding: EdgeInsets.all(5),
                            //   title: Text(
                            //       !global.loading
                            //           ? global.items[0]['title']
                            //           : "mama",
                            //       style: TextStyle(
                            //         color: Colors.black,
                            //         fontWeight: FontWeight.w600,
                            //         // fontSize: SizeConfig.blockSizeVertical * 2.9,
                            //       )),
                            //   // subtitle: Text("Price Starts from ₹ " +
                            //   //             global.items[index]['mrp'] ==
                            //   //         null
                            //   //     ? "Will be updated"
                            //   //     : global.items[index]['mrp']),
                            //   // dense: true,
                            //   onTap: () {
                            //     // Navigator.pushNamed(context,"ContactUs");
                            //     Navigator.pushNamed(context, "SubCategory");
                            //     // SubCategory(index);
                            //     global.TempIndex = index;

                            //     // print("clicked" +
                            //     //     global.items[index]['title'] +
                            //     //     global.TempIndex.toString());
                            //   },
                            //   // onLongPress: (){
                            //   //   //  CategoryData(index);
                            //   //   Navigator.pushNamed(context, "ContactForm");
                            //   // },
                            //   // onTap: (){
                            //   //   print("clicked"+category[index].data['a']);
                            //   //   // CategoryData();
                            //   //   // Navigator.pushNamed(context,"CategoryData");
                            //   //   // CategoryData(index);
                            //   //   Navigator.pushNamed(context,"Account");
                            //   //   print("clicked 2 nd tinem  "+category[index].data['a']);

                            //   // },
                            //   // onTap:(){
                            //   //   print("clicked"+category[index].data['a']);
                            //   //   msg=category[index].data['a'];
                            //   //   // SubCategory(msg
                            //   //   //   );

                            //   //   Navigator.push(
                            //   //     context,
                            //   //     MaterialPageRoute(
                            //   //         builder: (context) => SubCategory(msg
                            //   //             )
                            //   //             )
                            //   //             );

                            //   //   },
                            //   // e=category[index].data['a'],
                            //   // onTap: SubCategory(ca
                            //   // tegory[index].data['a'],index),
                            //   // subtitle: Text(category[index].data['short_desc']),
                            // ))
                          ],
                        );
                      },
                    ),
            ),
            global.loading
                ? Container(
                    child: Text("Loading"),
                    // width: MediaQuery.of(context).size.width,
                    // padding: EdgeInsets.all(5),
                    // color: Colors.yellowAccent,
                    // child: Text(
                    //   'Loading',
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
