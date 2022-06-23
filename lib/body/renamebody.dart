import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:interyapp/body/menu.dart';
import 'package:interyapp/body/navigator.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool change = true;
  void onchanged() {
    !change;
  }

  bool click = true;
  void clicker() {
    click != click;
  }

  List imglocal = [
    'images/f2.jpg',
    'images/reserver.jpg',
    'images/home.jpg',
    'images/concep.jpg',
    'images/site3.jpg',
    'images/21.jpg',
    'images/site.png',
  ];
  @override
  Widget items(
      String name, String categorie, String image, Icon icon, Widget nom) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => nom));
          },
          child: Container(
            width: MediaQuery.of(context).size.height / 2.5,
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover),
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  clicker();
                                });
                              },
                              icon: icon,
                              color: Colors.white),
                          Text(
                            name,
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.height * 0.015,
                        height: MediaQuery.of(context).size.height * 0.15,
                      ),
                      Container(
                        height: 20,
                        width: 120,
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(3)),
                        child: Center(
                          child: Text(
                            categorie,
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ]),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: menu(),
      backgroundColor: Colors.orange.shade100,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => navigate()));
                    });
                  },
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  )),
            ],
            // leading: IconButton(
            //     onPressed: () {
            //       setState(() {});
            //     },
            //     icon: Icon(
            //       Icons.menu,
            //       color: Colors.white,
            //     )),
            expandedHeight: 300,
            pinned: true,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'I N T E R Y',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
              background: Image(
                image: AssetImage('images/f.jpg'),
                fit: BoxFit.cover,
                colorBlendMode: BlendMode.colorDodge,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.orange.shade200,
                    borderRadius: BorderRadius.circular(20)),
                child: items('Driver/Livraison', 'Disponible 7j/7', imglocal[0],
                    Icon(Icons.favorite), navigate()),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.orange.shade200,
                    borderRadius: BorderRadius.circular(20)),
                child: items('E-commerce', 'Disponible 7j/7', imglocal[1],
                    Icon(Icons.favorite), navigate()),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.orange.shade200,
                    borderRadius: BorderRadius.circular(20)),
                child: items('Home', 'Disponible 7j/7', imglocal[2],
                    Icon(Icons.favorite), navigate()),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.orange.shade200,
                    borderRadius: BorderRadius.circular(20)),
                child: items('Restauration', 'Disponible 7j/7', imglocal[5],
                    Icon(Icons.favorite), navigate()),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.orange.shade200,
                    borderRadius: BorderRadius.circular(20)),
                child: items('Restauration', 'Disponible 7j/7', imglocal[5],
                    Icon(Icons.favorite), navigate()),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.orange.shade200,
                    borderRadius: BorderRadius.circular(20)),
                child: items('Entreprenariat', 'Disponible 7j/7', imglocal[3],
                    Icon(Icons.favorite), navigate()),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.orange.shade200,
                    borderRadius: BorderRadius.circular(20)),
                child: items('Restauration', 'Disponible 7j/7', imglocal[5],
                    Icon(Icons.favorite), navigate()),
              ),
            ),
          )
        ],
      ),
    );
  }
}
