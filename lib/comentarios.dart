// Row(
//   children: <Widget>[
//     Expanded(child: Container(width: 50, height: 50, color: Colors.red)),
//     Expanded(child: Container(width: 50, height: 50, color: Colors.blue)),
//   ],
// ),
// Container(
//   height: 1,
//   width: 100,
//   margin: EdgeInsets.symmetric(vertical: 20),
//   color: Color(0xffaaaaaa),
// ),
// Row(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: <Widget>[
//     CircleContainer(child: Icon(Icons.add), height: 55, width: 55),
//     SizedBox(width: 20),
//     CircleContainer(child: Icon(Icons.edit), height: 55, width: 55),
//   ],
// ),

// appBar: AppBar(
//   backgroundColor: Colors.white,
//   elevation: 0,
//   brightness: Brightness.light,
//   title: Text('LOGO', style: TextStyle(color: Colors.black)),
//   iconTheme: IconThemeData(color: Colors.blue),
//   leading: IconButton(icon: Icon(Icons.menu), onPressed: (){}),
//   actions: <Widget>[
//     IconButton(icon: Icon(Icons.send), onPressed: (){}),
//     IconButton(icon: Icon(Icons.more_vert), onPressed: (){}),
//   ],
// ),

// Container(
//   height: 120,
//   child: ListView.builder(
//     itemBuilder: (_, index) {
//       return Container(
//         width: 120,
//         height: 120,
//         margin: EdgeInsets.all(5),
//         color: Colors.black12,
//       );
//     },
//     itemCount: 10,
//     scrollDirection: Axis.horizontal,
//   ),
// ),
// SizedBox(height: 10),
// Container(
//   height: 120,
//   child: ListView.builder(
//     itemBuilder: (_, index) {
//       return Container(
//         width: 120,
//         height: 120,
//         margin: EdgeInsets.all(5),
//         color: Colors.black12,
//       );
//     },
//     itemCount: 10,
//     scrollDirection: Axis.horizontal,
//   ),
// ),
// SizedBox(height: 10),
// Container(
//   height: 120,
//   child: ListView.builder(
//     itemBuilder: (_, index) {
//       return Container(
//         width: 120,
//         height: 120,
//         margin: EdgeInsets.all(5),
//         color: Colors.black12,
//       );
//     },
//     itemCount: 10,
//     scrollDirection: Axis.horizontal,
//   ),
// ),
// SizedBox(height: 10),
// _isEnabled ? Cronometro(initTime: 90, fontSize: 40) : Container(),
// SizedBox(height: 20),
// CupertinoButton(
//   color: Colors.blue,
//   child: Text('enabled: $_isEnabled'),
//   onPressed: () {
//     setState(() {
//       _isEnabled = !_isEnabled;
//     });
//   },
// ),
// SizedBox(height: 20),
// CupertinoButton(
//   color: Colors.green,
//   child: Text('Go to Chat'),
//   onPressed: () {},
// ),
// MyBtn(
//   label: "My Posts",
//   onPressed: () {
//     Navigator.pushNamed(context, PostPage.routeName);
//   },
// ),