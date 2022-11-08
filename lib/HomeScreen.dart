import 'package:flutter/material.dart';
import 'package:movia_app/Widget/Popular.dart';
import 'package:movia_app/Widget/Treading.dart';
import 'package:movia_app/Widget/Upcaming.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0,


        title: Text("Movia App"),
        centerTitle: true,
        leading: Icon(Icons.menu),
        actions: [

          Icon(Icons.search)
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [

          Text('Trending',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
      SizedBox(height: 20,),
      Treading(),
          SizedBox(height: 10,),
          Row(
            children: [
              Text('Upcoming Movie',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              SizedBox(width: 130,),
              Text('See More ',textAlign: TextAlign.right,style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal,color: Colors.red),),
            ],
          ),

          SizedBox(height: 10,),
          Upcoming(),
          SizedBox(height: 10,),
      Row(
        children: [
          Text('Most Popular Movie',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          SizedBox(width: 130,),
          Text('See More ',textAlign: TextAlign.right,style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal,color: Colors.red),),
        ],
      ),
          SizedBox(height: 10,),
      Popular()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.movie_outlined,),label: "Movie"),
          BottomNavigationBarItem(icon: Icon(Icons.watch_later_outlined,),label: "Watchlist"),
        ],
      ),
    );
  }
}
