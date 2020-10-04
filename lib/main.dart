import 'package:flutter/material.dart';
// import 'product_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Home Page'),
    );
  }
}

Widget bottomBar() {
  return Container();
}

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Page",
        ),
        leading: GestureDetector(
          onTap: () {/* Write listener code here */},
          child: Icon(
            Icons.arrow_back, // add custom icons also
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: null,
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(1.0),
                  padding: const EdgeInsets.all(5.0),
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        // <--- left side
                        color: Colors.redAccent,
                        width: 3.0,
                      ),
                    ),
                  ),
                  child: Text(
                    'New Product',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            listNewProduct(),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(2.0),
                  padding: const EdgeInsets.all(6.0),
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        // <--- left side
                        color: Colors.redAccent,
                        width: 3.0,
                      ),
                    ),
                  ),
                  child: Text(
                    'Hot Product',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            listHotProduct(),
          ],
        ),
      ),
      bottomNavigationBar: _bottomNormal(),
    );
  }
}

Widget listNewProduct() {
  return Container(
    height: 190,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: EdgeInsets.all(4.0),
        child: ProductItem('Tart Cheese', 10, 'New'),
      ),
    ),
  );
}

Widget listHotProduct() {
  return Flexible(
    child: Container(
      height: 400,
      // width: double.infinity,
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 8,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) => Padding(
          padding: EdgeInsets.all(4.0),
          child: ProductItem('Tart Cheese', 20, 'Hot'),
        ),
      ),
    ),
  );
}

class ProductItem extends StatelessWidget {
  final String name;
  final num price;
  final String feature;
  const ProductItem(this.name, this.price, this.feature);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      decoration: BoxDecoration(
        color: Colors.lightBlue[200],
      ),
      child: Stack(
        alignment: const Alignment(1, 0.5),
        children: [
          Image(
            image: AssetImage('assets/images/cake.jpg'),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: EdgeInsets.all(2),
              margin: EdgeInsets.all(2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    feature,
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            // alignment: Alignment.bottomCenter,
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(2),
              color: Colors.redAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\$' + price.toDouble().toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _bottomNormal() => BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          backgroundColor: Colors.redAccent,
          icon: Icon(
            Icons.home,
            size: 30,
          ),
          title: Text(
            "Home",
            style: TextStyle(fontSize: 20),
          ),
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.redAccent,
          icon: Icon(
            Icons.cake,
            size: 30,
          ),
          title: Text(
            "My Cake",
            style: TextStyle(fontSize: 20),
          ),
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.redAccent,
          icon: Icon(
            Icons.settings,
            size: 30,
          ),
          title: Text(
            "Setting",
            style: TextStyle(fontSize: 20),
          ),
        ),
        //   BottomNavigationBarItem(
        //     backgroundColor: Colors.redAccent,
        //     icon: Icon(
        //       Icons.contacts,
        //       size: 30,
        //     ),
        //     title: Text(
        //       "Contact",
        //       style: TextStyle(fontSize: 20),
        //     ),
        //   )
      ],
    );
