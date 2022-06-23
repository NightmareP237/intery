import 'package:flutter/material.dart';
import 'package:interyapp/animation/FadeAnimation.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
class Date extends StatefulWidget {
  const Date({ Key? key }) : super(key: key);

  @override
  _DateState createState() => _DateState();
}

class _DateState extends State<Date> {
  int _selectedDay = 2;
  int _selectedRepeat = 0;
  String _selectedHour = '13:30';
  List<int> _selectedExteraCleaning = [];
  final ItemScrollController _scrollController = ItemScrollController();
  final List<dynamic> _days = [
    [1, 'Lun'],
    [2, 'Sam'],
    [3, 'Dim'],
    [4, 'Lun'],
    [5, 'Mar'],
    [6, 'Mer'],
    [7, 'Jeu'],
    [8, 'Ven'],
    [9, 'Sam'],
    [10, 'Dim'],
    [11, 'Lun'],
    [12, 'Mar'],
    [13, 'Mer'],
    [14, 'Jeu'],
    [15, 'Ven'],
    [16, 'Sam'],
    [17, 'Dim'],
    [18, 'Lun'],
    [19, 'Mar'],
    [20, 'Mer'],
    [21, 'Jeu'],
    [22, 'Ven'],
    [23, 'Sam'],
    [24, 'Dim'],
    [25, 'Lun'],
    [26, 'Mar'],
    [27, 'Mer'],
    [28, 'Jeu'],
    [29, 'Ven'],
    [30, 'Sam'],
    [31, 'Dim']
  ];

  final List<String> _hours = <String>[
    '01:00',
    '01:30',
    '02:00',
    '02:30',
    '03:00',
    '03:30',
    '04:00',
    '04:30',
    '05:00',
    '05:30',
    '06:00',
    '06:30',
    '07:00',
    '07:30',
    '08:00',
    '08:30',
    '09:00',
    '09:30',
    '10:00',
    '10:30',
    '11:00',
    '11:30',
    '12:00',
    '12:30',
    '13:00',
    '13:30',
    '14:00',
    '14:30',
    '15:00',
    '15:30',
    '16:00',
    '16:30',
    '17:00',
    '17:30',
    '18:00',
    '18:30',
    '19:00',
    '19:30',
    '20:00',
    '20:30',
    '21:00',
    '21:30',
    '22:00',
    '22:30',
    '23:00',
    '23:30',
  ];

  final List<String> _repeat = [
    "Une journee",
    'De 3 jours',
    ' 1 semaine',
    ' 1 mois'
  ];

  final List<dynamic> _exteraCleaning = [
    ['lessives', 'https://as2.ftcdn.net/v2/jpg/00/62/64/79/1000_F_62647924_N9GBmhiNmgOyilrIjIxaY6ymOg0Y4i8I.jpg', '4000'],
    ['Garde mange', 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRBEong9gbhSoIcVSFKpE0d-lLqHBHR9qou3mtusTeRkiwH22mf', '2500'],
    ['Cuisiner', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.dakaractu.com%2FOrange-lance-Orange-Money-en-France-pour-faciliter-les-transferts-d-argent-vers-l-Afrique-et-en-metropole_a112919.html&psig=AOvVaw1eX3JbwF6u90EU_hm8OiKP&ust=1646017943175000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCMjg_ej0nvYCFQAAAAAdAAAAABAS', '5000'],
    ['Entretien', 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQ4mpn4jP9N6x8ZS3WeiUBzbP_NhMAkvIfYO60eGtlz5OhXF4oC', '2000'],
    ['Vitrage', 'https://img.icons8.com/external-kiranshastry-lineal-color-kiranshastry/2x/external-window-interiors-kiranshastry-lineal-color-kiranshastry-1.png', '2000'],
  ];

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 500), () {
      _scrollController.scrollTo(
        index: 24,
        duration: Duration(seconds: 3),
        curve: Curves.easeInOut,
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Datetime');
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => HomePage(),
          //   ),
          // );
        },
        child: Icon(Icons.arrow_forward_ios,color: Colors.white,),
      ),
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
            ),
          ),
            SliverToBoxAdapter(
              child: FadeAnimation(1,
               Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/35, 
              right: MediaQuery.of(context).size.height/30, 
              left: MediaQuery.of(context).size.height/20),
                child: Text(
                  "Choisissez le jour et l'heure du rendez-vous.",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.grey.shade900,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ))
          ];
        },
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30,),
                FadeAnimation(1, Row(
                  children: [
                    Text("Aujourd'huir: ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year} "),
                    Spacer(),
                    IconButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {
                        
                      }, 
                      icon: Icon(Icons.arrow_drop_down_circle_outlined, color: Colors.grey.shade700,),
                    )
                  ],
                )),
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(width: 1.5, color: Colors.grey.shade200),
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _days.length,
                    itemBuilder: (BuildContext context, int index) {
                      return FadeAnimation((1 + index) / 6, GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedDay = _days[index][0];
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 350),
                          width: 62,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: _selectedDay == _days[index][0] ? Colors.blue.shade100.withOpacity(0.6) : Colors.blue.withOpacity(0),
                            border: Border.all(
                              color: _selectedDay == _days[index][0] ? Colors.blue : Colors.white.withOpacity(0),
                              width: 1.5,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(_days[index][0].toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Text(_days[index][1], style: TextStyle(fontSize: 16),),
                            ],
                          ),
                        ),
                      ));
                    }
                  ),
                ),
                SizedBox(height: 10,),
                FadeAnimation(1.2, Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(width: 1.5, color: Colors.grey.shade200),
                  ),
                  child: ScrollablePositionedList.builder(
                    itemScrollController: _scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: _hours.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedHour = _hours[index];
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: _selectedHour == _hours[index] ? Colors.orange.shade100.withOpacity(0.5) : Colors.orange.withOpacity(0),
                            border: Border.all(
                              color: _selectedHour == _hours[index] ? Colors.orange : Colors.white.withOpacity(0),
                              width: 1.5,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(_hours[index], style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                            ],
                          ),
                        ),
                      );
                    }
                  ),
                )),
                SizedBox(height: 40,),
                FadeAnimation(1.2, Text("Periode de location", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),)),
                SizedBox(height: 10,),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _repeat.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedRepeat = index;
                          });
                        },
                        child: FadeAnimation((1.2 + index) / 4, Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: _selectedRepeat == index ? Colors.orange.shade300 : Colors.grey.shade100,
                          ),
                          margin: EdgeInsets.only(right: 20),
                          child: Center(child: Text(_repeat[index], 
                            style: TextStyle(fontSize: 18, color: _selectedRepeat == index ? Colors.white : Colors.grey.shade800),)
                          ),
                        )),
                      );
                    },
                  )
                ),
                //  SizedBox(height: 40,),
                // FadeAnimation(1.4, Text("Modes de paiements", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),)),
                // SizedBox(height: 10,),
                // Container(
                //   height: 120,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     color: Colors.white,
                //   ),
                //   child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     itemCount: _exteraCleaning.length,
                //     itemBuilder: (context, index) {
                //       return GestureDetector(
                //         onTap: () {
                //           setState(() {
                //             if (_selectedExteraCleaning.contains(index)) {
                //               _selectedExteraCleaning.remove(index);
                //             } else {
                //               _selectedExteraCleaning.add(index);
                //             }
                //           });
                //         },
                //         child: FadeAnimation((1.4 + index) / 4, Container(
                //           width: 110,
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(15),
                //             color: _selectedExteraCleaning.contains(index) ? Colors.orange.shade300 : Colors.transparent,
                //           ),
                //           margin: EdgeInsets.only(right: 20),
                //           child: Column(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             children: [
                //               Image.network(_exteraCleaning[index][1], height: 40,),
                //               SizedBox(height: 10,),
                //               Text(_exteraCleaning[index][0], style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: _selectedExteraCleaning.contains(index) ? Colors.white : Colors.grey.shade800),),
                //               SizedBox(height: 5,),
                //               Text("+${_exteraCleaning[index][2]} Fcfa", style: TextStyle(color: Colors.black),)
                //             ],
                //           )
                //         )
                //         ) );
                    // })
            ],
            ), 
          ),
        ),
      )
    );
  }
}