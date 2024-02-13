import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        // useMaterial3: true
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
          Column(
              children: [
                AppBar(
                        toolbarHeight: 100,
                        backgroundColor: Colors.white,

                        flexibleSpace: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade700,
                            borderRadius: BorderRadius.vertical(bottom: Radius.circular(60))
                          ),
                        ),
                        // leading: Image.asset("assets/images/profile.jpg"),

                        title: Container(
                          margin: EdgeInsets.only(bottom: 43),
                            child:
                               top_bar()),
                      ),
                Container(
                   margin: EdgeInsets.only(top: 30),
                   child: Stack(
                    children: [
                      Container(
                      margin: EdgeInsets.only(top: 0),
                      height: 175,
                      width: 340,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade700,
                        borderRadius: BorderRadius.circular(30)
                      ),

                          child:
                            Container(
                              margin: EdgeInsets.only(top: 20 , left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('What Would' , style: TextStyle(color: Colors.white , fontWeight: FontWeight.w700 , fontSize: 20) ),
                                  Text('You Like To ' ,style: TextStyle(color: Colors.white ,fontWeight: FontWeight.w700 , fontSize: 20)),
                                  Text('Learn Today?' , style: TextStyle(color: Colors.white , fontWeight: FontWeight.w700 , fontSize: 20)),
                                  SizedBox(height: 8,),
                                  Container(
                                    height: 35,
                                    width: 110,
                                    child: ElevatedButton(onPressed: (){}, child: Text('SIGN UP' , style: TextStyle(color: Colors.blue , fontSize: 15 , fontWeight: FontWeight.w600 ),),
                                      // style: ElevatedButton.styleFrom(
                                      //
                                      // ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                    ),

                      Positioned(
                        left: 138,
                          bottom: 0,
                          child: Image.asset('assets/images/boyyedited.png' , height:140 )),

                      Positioned(
                        left: 135,
                          bottom:  80,
                          child: Image.asset('assets/images/picturebulbedited.png' , height:120)),

                        ]
                                 ),
                 ),
                Container(
                  margin: EdgeInsets.only(top: 13),
                  width: 340,
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Top Mentors' , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w900)),
                      Text('See All' , style: TextStyle(fontSize: 13  , fontWeight: FontWeight.bold , color: Colors.blue.shade600 , fontFamily: 'Classic'),),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 3),
                  width: 340,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ) ,

                        color: Colors.lightBlue.shade50,
                        child: Container(
                          height: 90,
                          width: 90 ,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 22,
                                backgroundImage: AssetImage('assets/images/profile.jpg'),),
                              Text('Jacob' , style: TextStyle(fontSize: 13 , fontWeight: FontWeight.w900),),
                              Text('Web Designer', style: TextStyle(fontSize: 10 , fontWeight: FontWeight.w400 ,),)
                            ],
                          ),
                        )

                      ),
                      Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ) ,

                          color: Colors.lightBlue.shade50,
                          child: Container(
                            height: 90,
                            width: 90 ,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 22,
                                  backgroundImage: AssetImage('assets/images/clare.jpg'),),
                                Text('Clare' , style: TextStyle(fontSize: 13 , fontWeight: FontWeight.w900),),
                                Text('Web Designer', style: TextStyle(fontSize: 10 , fontWeight: FontWeight.w400),),
                              ],
                            ),
                          )

                      ),
                      Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ) ,

                          color: Colors.lightBlue.shade50,
                          child: Container(
                            height: 90,
                            width: 90,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 22,
                                  backgroundImage: AssetImage('assets/images/Wade.jpg'),),
                                Text('Wade' , style: TextStyle(fontSize: 13 , fontWeight: FontWeight.w900),),
                                Text('Web Designer', style: TextStyle(fontSize: 10 , fontWeight:FontWeight.w400),),
                              ],
                            ),
                          )

                      ),


                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 340,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Most Popular Courses' , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w900)),
                      Text('See All' , style: TextStyle(fontSize: 13  , fontWeight: FontWeight.bold , color: Colors.blue.shade600 , fontFamily: 'Classic'),),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  width: 340,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 30,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade700,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20) , bottomRight: Radius.circular(20)),
                          border: Border.all(
                            width: 3,
                            color: Colors.blue.shade700
                          )
                        ),
                        child: Center(child: Text('All', style: TextStyle(fontSize: 14, color: Colors.white , fontWeight: FontWeight.w600 ))),
                      ),
                      Container(
                        height: 30,
                        width: 107,
                        decoration: BoxDecoration(
                            // color: Colors.blue.shade700,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20) , bottomRight: Radius.circular(20)),
                            border: Border.all(
                                width: 3,
                                color: Colors.blue.shade700
                            )
                        ),
                        child: Center(child: Text('Develop', style: TextStyle(fontSize: 14, color: Colors.blue.shade700 , fontWeight: FontWeight.w600 ))),
                      ),
                      Container(
                        height: 30,
                        width: 107,
                        decoration: BoxDecoration(
                          // color: Colors.blue.shade700,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20) , bottomRight: Radius.circular(20)),
                            border: Border.all(
                                width: 3,
                                color: Colors.blue.shade700
                            )
                        ),
                        child: Center(child: Text('Business', style: TextStyle(fontSize: 14, color: Colors.blue.shade700 , fontWeight: FontWeight.w600 ))),
                      ),
                    ]
                  )
                ),
                Container(
                  margin:EdgeInsets.only(top: 28 ) ,
                  width: 348,
                  height: 130,
                  child: Card(
                    elevation: 5,
                      color: Colors.lightBlue.shade50,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                             Padding(
                               padding: EdgeInsets.only(left: 7),
                               child: ClipRRect(
                                 borderRadius: BorderRadius.circular(20),
                                   child: SizedBox(
                                     height: 95,
                                       width: 112,
                                       child: Image.asset('assets/images/logo3dedited2.jpg'  ))),
                             ),
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Container(
                                   margin: EdgeInsets.only(left: 5),
                                   width : 210,
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Container(
                                         margin: EdgeInsets.only(top: 13 ,),
                                         height: 27,
                                         width: 65,
                                         child :Card(
                                           color: Colors.lightBlue.shade100,
                                               child: Center(child: Text('3d Design' , style: TextStyle(fontSize: 9 , fontWeight: FontWeight.w700 , color: Colors.blue.shade700),)),
                                           ),
                                       ),
                                       Container(
                                         margin: EdgeInsets.only(top:13),
                                           child: Icon(Icons.bookmark , color: Colors.blue.shade600)),
                                     ],
                                   ),
                                 ),
                                 Container(margin: EdgeInsets.only(left: 10),
                                          child: Text('3D Design Illustration' , style: TextStyle(fontWeight: FontWeight.w800 , fontSize: 17),)),
                                 Container(
                                   margin: EdgeInsets.only(left: 9),
                                   child: Row(
                                     children: [
                                       Icon(Icons.currency_rupee , size: 14 , color: Colors.blue.shade600, weight: 30,),
                                       Text('5000/- ' , style: TextStyle(fontSize: 14 , color: Colors.blue.shade600,fontWeight: FontWeight.w600),),
                                       Icon(Icons.currency_rupee , size: 11, color: Colors.grey,),
                                       Text('7000' , style: TextStyle(fontSize: 11 , color: Colors.grey , fontWeight: FontWeight.w600),),

                                     ]
                                   )
                                 ),
                                 Container(
                                   margin: EdgeInsets.only(left: 9),
                                   child: Row(
                                     children: [
                                       Icon(Icons.star , size: 18, color: Colors.orange,),
                                       Text('4,8   |   8,367 Students' , style: TextStyle(fontSize: 11 , color: Colors.grey , fontWeight: FontWeight.w600),),
                                     ],
                                   ),
                                 )
                               ],
                             )

                      ],
                    )

                  ),
                ),
                Container(
                  margin:EdgeInsets.only(top: 28 ) ,
                  width: 348,
                  height: 130,
                  child: Card(
                      elevation: 5,
                      color: Colors.lightBlue.shade50,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 7),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: SizedBox(
                                    height: 95,
                                    width: 112,
                                    child: Image.asset('assets/images/logo3dedited2.jpg'  ))),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                width : 210,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 13 ,),
                                      height: 27,
                                      width: 65,
                                      child :Card(
                                        color: Colors.lightBlue.shade100,
                                        child: Center(child: Text('3d Design' , style: TextStyle(fontSize: 9 , fontWeight: FontWeight.w700 , color: Colors.blue.shade700),)),
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(top:13),
                                        child: Icon(Icons.bookmark , color: Colors.blue.shade600)),
                                  ],
                                ),
                              ),
                              Container(margin: EdgeInsets.only(left: 10),
                                  child: Text('3D Design Illustration' , style: TextStyle(fontWeight: FontWeight.w800 , fontSize: 17),)),
                              Container(
                                  margin: EdgeInsets.only(left: 9),
                                  child: Row(
                                      children: [
                                        Icon(Icons.currency_rupee , size: 14 , color: Colors.blue.shade600, weight: 30,),
                                        Text('5000/- ' , style: TextStyle(fontSize: 14 , color: Colors.blue.shade600,fontWeight: FontWeight.w600),),
                                        Icon(Icons.currency_rupee , size: 11, color: Colors.grey,),
                                        Text('7000' , style: TextStyle(fontSize: 11 , color: Colors.grey , fontWeight: FontWeight.w600),),

                                      ]
                                  )
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 9),
                                child: Row(
                                  children: [
                                    Icon(Icons.star , size: 18, color: Colors.orange,),
                                    Text('4,8   |   8,367 Students' , style: TextStyle(fontSize: 11 , color: Colors.grey , fontWeight: FontWeight.w600),),
                                  ],
                                ),
                              )
                            ],
                          )

                        ],
                      )

                  ),
                ),

               ]
            ),


            // Search bar
            Positioned(
                top: 120,
                left: 55,
                child: search_bar()),
          ]
        ),
      ),



       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Widget top_bar(){
  return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          CircleAvatar(
            maxRadius: 23,
              backgroundImage: AssetImage('assets/images/profile.jpg' )),
          SizedBox(width: 10),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hi, John Smith" , style: TextStyle(fontSize: 18 , color: Colors.white , fontWeight: FontWeight.w500)),
                Text("Id: 6437484 z | Student" , style: TextStyle(fontSize: 12 , color: Colors.white , fontWeight: FontWeight.w500 ),),
              ],
            ),
          SizedBox(width: 131,),
          CircleAvatar(
            backgroundColor: Colors.blue.shade600,
            maxRadius: 24,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              maxRadius: 16,
                child: Icon(Icons.notifications ,size: 18, color: Colors.black,)),
          ),
        ],
      ),
    );

}
Widget search_bar(){
  var searchController = TextEditingController();
  return
     SizedBox(
      width: 280,
      height: 43,

        child: Material(
          elevation: 6,
            borderRadius: BorderRadius.circular(25),
          child: TextFormField(
            controller: searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                        color: Colors.white
                    )
                ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                      color: Colors.white
                    )
                  ),

                  hintText:  'Search For Something'  ,
                hintStyle: TextStyle(fontFamily: 'Classic' ,fontSize: 15, fontWeight: FontWeight.w400 , color: Colors.grey),
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Icon(Icons.search , color: Colors.grey),
                suffixIcon: Icon(Icons.line_weight_sharp , color: Colors.grey,),
              ),

            ),
        ),


    );

}
