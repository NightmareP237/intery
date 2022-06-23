import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:interyapp/body/homepage.dart';

import 'date_time.dart';

class CleaningPage extends StatefulWidget {
  const CleaningPage({ Key? key }) : super(key: key);

  @override
  _CleaningPageState createState() => _CleaningPageState();
}

class _CleaningPageState extends State<CleaningPage> {
  // Rooms to clean
  List<dynamic> _rooms =[
    ['Salle A Manger', 'https://img.icons8.com/officel/2x/living-room.png', Colors.orange, 0],
    ['Chambre', 'https://img.icons8.com/fluency/2x/bedroom.png', Colors.orange, 1],
    ['Salle De Bain', 'https://img.icons8.com/color/2x/bath.png', Colors.orange, 1],
    ['Cuisine', 'https://img.icons8.com/dusk/2x/kitchen.png', Colors.orange, 0],
    ['Bureaux', 'https://img.icons8.com/color/2x/office.png', Colors.orange, 0]
  ];

  List<int> _selectedRooms = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: _selectedRooms.length > 0 ? FloatingActionButton(
        onPressed: () {
          print('cleaning');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DateAndTime()
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${_selectedRooms.length}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white)),
            SizedBox(width: 2),
            Icon(Icons.arrow_forward_ios, size: 18,color: Colors.white,),
          ],
        ),
        backgroundColor: Colors.orange,
      ) : null,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
             SliverAppBar(
            expandedHeight: 0,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'I N T E R Y',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
              // background: Image(
              //   image: AssetImage('images/f.jpg'),
              //   fit: BoxFit.cover,
              //   colorBlendMode: BlendMode.colorDodge,
              // ),
              
            ),
            leading:IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>home()));
            }, icon: Icon(Icons.arrow_back)),
          ),
            SliverToBoxAdapter(
              child:  Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/35, right: MediaQuery.of(context).size.height/30, left:MediaQuery.of(context).size.height/20),
                child: Text(
                  'Ou voulez-vous  \n nettoyer?',
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.grey.shade900,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ];
        },
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal:20,vertical: 0),
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: _rooms.length,
            itemBuilder: (BuildContext context, int index) {
              return room(_rooms[index], index);
            }
          ),
        ),
      )
    );
  }
  
  room(List room, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_selectedRooms.contains(index))
            _selectedRooms.remove(index);
          else 
            _selectedRooms.add(index);
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        margin: EdgeInsets.only(bottom: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: _selectedRooms.contains(index) ? room[2].shade50.withOpacity(0.5) : Colors.grey.shade100,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Row(
                  children: [
                    Image.network(room[1], width: 35, height: 35,),
                    SizedBox(width: 10.0,),
                    Text(room[0], style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                  ],
                ),
                Spacer(),
                _selectedRooms.contains(index) ? 
                  Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent.shade100.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Icon(Icons.check, color: Colors.green, size: 20,)
                  ) : 
                  SizedBox()
              ],
            ),
            (_selectedRooms.contains(index) && room[3] >= 1) ?
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.0,),
                  Text("Combien de ${room[0]}s?", style: TextStyle(fontSize: 15),),
                  SizedBox(height: 10.0,),
                  Container(
                    height: 45,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              room[3] = index + 1;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 10.0),
                            padding: EdgeInsets.all(10.0),
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: room[3] == index + 1 ? room[2].withOpacity(0.5) : room[2].shade200.withOpacity(0.5),
                            ),
                            child: Center(child: Text((index + 1).toString() , style: TextStyle(fontSize: 22, color: Colors.white),)),
                          ),
                        );
                      }
                    ),
                  )
                ],
              ),
            ) : SizedBox()
          ],
        )
      ),
    );
  }
}
