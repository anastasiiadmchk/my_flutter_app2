
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  File imageFile;
  //PersistentBottomSheetController _controller;
  //final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController text = TextEditingController();
  TextEditingController subtext = TextEditingController();
  TextEditingController price = TextEditingController();

  List<Container> containers = [Container(decoration: BoxDecoration(color: Colors.purpleAccent[700], borderRadius: BorderRadius.circular(21), ),
    child: Center(
      child: Row(
        children: [
        Container(
          padding: EdgeInsets.only(left:25),
          child: SizedBox(child: Text("Best deals of today", textAlign: TextAlign.left, maxLines: 2,
      //overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.yellow),), width: 130,),),
        Expanded(
          //padding: EdgeInsets.only(right: 10),
          child: Container(
            padding: EdgeInsets.only(left: 30, top:5, bottom: 5, right: 20),
            child: Image.asset('assets/images/f598f02b-113f-46e6-a568-bbef00a91c11.png',  fit: BoxFit.fill,),))]
      ),
    ),
  ),
    Container(decoration: BoxDecoration(color: Colors.pink[100], borderRadius: BorderRadius.circular(21), ),
      child: Center(
        child: Row(
            children: [
              Expanded(
                child: Container(padding: EdgeInsets.only(left:25, right: 40, top:5, bottom: 5, ),
                    child: Image.asset('assets/images/b5ad10fd-90a8-4c4b-bf9f-632f623f6358.png',  fit: BoxFit.fill,),),),
              Container(
                  padding: EdgeInsets.only(right: 10),
                  child: SizedBox(child: Text("25% offer today", textAlign: TextAlign.left, maxLines: 2,
                  //overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.orange),), width: 120,),
  ),]
        ),
      ),
    )
  ];

  List<ListTile> bestOffers = [ListTile(
    leading: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset('assets/images/31_social-512.png', ),
    ),
    title: Text("McDonald's", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),),
    subtitle: Text("5% discounts"),
    trailing: Container(decoration: BoxDecoration(color: Colors.orange[100], borderRadius: BorderRadius.circular(10), ),
        height: 40,
        width: 40,
        child: Center(
          child:
          Text("\$1", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange, fontSize: 18),),)),
  ),
    ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset('assets/images/31_social-512.png', ),
      ),
      title: Text("McDonald's", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),),
      subtitle: Text("5% discounts"),
      trailing: Container(decoration: BoxDecoration(color: Colors.orange[100], borderRadius: BorderRadius.circular(10), ),
          height: 40,
          width: 40,
          child: Center(
            child:
            Text("\$1", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange, fontSize: 18),),)),
    ),
    ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset('assets/images/31_social-512.png', ),
      ),
      title: Text("McDonald's", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),),
      subtitle: Text("5% discounts"),
      trailing: Container(decoration: BoxDecoration(color: Colors.orange[100], borderRadius: BorderRadius.circular(10), ),
          height: 40,
          width: 40,
          child: Center(
            child:
            Text("\$1", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange, fontSize: 18),),)),
    ),
  ];


  Widget _buildUpperField(){
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.only(top: 32, left: 13, right: 13, bottom: 50),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('assets/images/photo-1555445091-5a8b655e8a4a.jfif', width: 50, height: 70, fit: BoxFit.fill,),
            ),
            trailing: Icon(Icons.search),),
        ),
        Container(
          padding:EdgeInsets.only(left: 20),
          child:Text("Trading Offers", style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold,),),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: containers.length,
          itemBuilder: (BuildContext ctxt, int index){
            return Container(
              child: containers[index],
              height: 130,
              margin: EdgeInsets.only(left:20, right:25, top:13, bottom: 3),);
            },
        ),
        Container(
          padding:EdgeInsets.only(left: 20, top:40),
          child:Text("Best Offers", style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold,),),
        ),
        ListView.builder(
          padding: EdgeInsets.only(top:8, bottom: 20),
          shrinkWrap: true,
          itemCount: bestOffers.length,
          itemBuilder: (BuildContext ctxt, int index){
            return new Container(
              child: bestOffers[index],
              height: 65,
              margin: EdgeInsets.only(left:7, right:25),);
          },
        ),
      ],
    //shrinkWrap: true,
    );
  }


  void _addBestOffers(File image, String text, String subtext, String price){
    if (image!=null && text!=null && subtext!=null && price!=null){
    setState(() {
    bestOffers.add(ListTile(leading: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.file(image, fit: BoxFit.fill, width: 55, height: 55,),
    ),
      title: Text("$text", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),),
      subtitle: Text("$subtext"),
      trailing: Container(decoration: BoxDecoration(color: Colors.orange[100], borderRadius: BorderRadius.circular(10), ),
          height: 40,
          width: 40,
          child: Center(
            child:
            Text("\$$price", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange, fontSize: 18),),)),));
    });
    }
  }

  _openGallery() async{
    // ignore: deprecated_member_use
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (image!=null){
        imageFile = image;}
    });
    //Navigator.of(context).pop();
  }

  Widget _chooseImage(){
      if (imageFile!= null) {
        return Container (
          width: 50,
          height: 50,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10), child: Image.file(imageFile, fit: BoxFit.fill)));
      } else{
        return Container(
          child: Icon(Icons.check_box_outline_blank, size: 40,),
    );}
  }

  void dispose() {
    text.dispose();
    subtext.dispose();
    price.dispose();
    super.dispose();
    imageFile = null;
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      /*appBar: AppBar(
        //title: Text(widget.title),
        backgroundColor: Colors.white,
      ),*/
      body: Center(
        child:
            _buildUpperField(),
            /*Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),*/
            ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          fixedColor: Colors.deepPurple,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home,),
              title: Text(""),
          ),
            BottomNavigationBarItem(
                icon: Icon(Icons.credit_card,),
              title: Text(""),
            ),
            BottomNavigationBarItem(
                icon: IconButton(icon: Icon(Icons.add_box, ),
                onPressed: () {
                  showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return new StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return new Container(
                      height: 350.0,
                        color: Color(0xFF737373),
                        child: new Container(
                          decoration: new BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.only(topLeft: const Radius.circular(20.0), topRight: const Radius.circular(20.0))),
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Container(padding: EdgeInsets.only(top:22, bottom: 5), child: Text("Add your Best Offer", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),),),
                                ListTile(
                                  leading: _chooseImage(),
                                  title: Text("Choose an image"),
                                  trailing: IconButton(
                                    icon: Icon(Icons.add_a_photo),
                                    onPressed: _openGallery,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 10),
                                  height: 60,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                                      labelText: 'Enter title',),
                                    controller: text,
                                ),),
                                Container(
                                  padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 10),
                                  height: 60,
                                  child: TextField(decoration: InputDecoration(
                                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                                    labelText: 'Enter subtitle',
                                  ),
                                    controller: subtext,
                                  ),),
                                Container(padding:EdgeInsets.only(left: 10, right: 5), height: 60, child: ListTile(
                                  title: Text("Type your price"),
                                  trailing: Container(width: 60, height:40, child:TextField(
                                    decoration: new InputDecoration(
                                      labelText: "\$",
                                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      WhitelistingTextInputFormatter.digitsOnly
                                    ],
                                  controller: price,),),
                                ),),
                                ButtonTheme(
                                  minWidth: 130,
                                    child:RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  color: Colors.orange,
                                  padding: EdgeInsets.only(top:5, bottom: 5),
                                  child: const Text('Done', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),),
                                  onPressed: () {
                                    _addBestOffers(imageFile, text.text, subtext.text, price.text);
                                    Navigator.pop(context);
                                  }
                                ))
                              ],
                            ),
                          ),
                        ),
                    );
                        });
                  }
                  );
                },
                ),
              title: Text(""),

            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.card_giftcard, ),
              title: Text(""),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings, ),
              title: Text(""),
            ),
          ]
      ),
    );
  }
}

