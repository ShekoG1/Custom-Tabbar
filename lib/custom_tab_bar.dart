import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class customTabbar extends StatefulWidget{
  @override
  State<customTabbar> createState() => _customTabbarState();
}

class _customTabbarState extends State<customTabbar> {

  List<String> items = [
    "Home",
    "Explore",
    "Search",
    "Feed",
    "Post",
    "Activity",
    "Settings",
    "Profile"
  ];
  
  List<IconData> icons = [
    Icons.home,
    Icons.explore,
    Icons.search,
    Icons.feed,
    Icons.post_add,
    Icons.local_activity,
    Icons.settings,
    Icons.person,
  ];
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: items.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          current = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.all(5),
                        width: 80,
                        height: 45,
                        decoration: BoxDecoration(
                          color: current == index 
                          ? Colors.blue 
                          : Color.fromARGB(255, 255, 255, 255),
                          borderRadius: current == index 
                          ? BorderRadius.circular(15) 
                          : BorderRadius.circular(10),
                          border: current == index
                          ? Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 2)
                          : null
                        ),
                        child: Center(
                          child: Text(
                            items[index],
                            // style: GoogleFonts.laila(),
                          ),
                        ),
                      )
                    ),
                    Visibility(
                      visible: current == index,
                      child: Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.black),
                      )
                    )
                  ],
                );
            }
            ),
          ),
          //MAIN BODY
          Container(
            margin: const EdgeInsets.only(top: 30),
            width: double.infinity,
            height: 500,
            color: Colors.white,
            child: Column(
              children: [
                Icon(
                  icons[current],
                  size: 200,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(items[current],style: const TextStyle(// styling the text
                  fontSize: 30.0
                ),)
              ],
            ),
          )
        ],
      ),
    );
  }
}