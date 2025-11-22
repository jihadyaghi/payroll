import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF009688),
        leading: Builder(builder:(context)=>IconButton( icon: Icon(Icons.menu) , color: Colors.white ,
        onPressed: ()  {
          Scaffold.of(context).openDrawer();
        },
         )),
        
        title: Text("Payroll Calculator" , style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 20
        ),),
        actions: [
          IconButton( icon: Icon(Icons.help_outline , color: Colors.white ), 
          onPressed: () => {
           },
          ),
          IconButton( icon: Icon(Icons.settings , color: Colors.white,) , onPressed: () => {},)
        ],
        
      ),
      drawer: Drawer(
        child: Container(
          color: Color(0xFF009688),
          child: ListView(
            children: [
              DrawerHeader(
                child: Text("Menu" , style: TextStyle(color: Colors.white , fontSize: 22), ),
              ),
              ListTile(
                leading: Icon(Icons.home , color: Colors.white,),
                title: Text("Home" , style: TextStyle(color: Colors.white)),
                onTap: ()=>{},
              ),
              ListTile(
                leading: Icon(Icons.calculate , color: Colors.white,),
                title: Text("Calculator" , style: TextStyle(color: Colors.white), ),
                onTap: () => {},

              )
              
            ],
          ),
        ),
      ),
    ) ;
  }
}