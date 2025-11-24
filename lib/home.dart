import 'package:flutter/material.dart';
import 'package:payroll_project/models/payroll.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final hoursController = TextEditingController();
  final rateController = TextEditingController();
  final taxController = TextEditingController();
  final deductionController = TextEditingController();
  List <Payroll> payroll = [];
  void addPayroll(){
    if (hoursController.text.isEmpty || rateController.text.isEmpty || taxController.text.isEmpty || deductionController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please fill all fields")));
      return ;
    }
    Payroll p = Payroll(double.parse(hoursController.text), double.parse(rateController.text), double.parse(taxController.text), double.parse(deductionController.text));
    setState(() {
      payroll.add(p);
    });
    hoursController.clear();
    rateController.clear();
    taxController.clear();
    deductionController.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF009688),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            color: Colors.white,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Text(
          "Payroll Calculator",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.help_outline, color: Colors.white),
            onPressed: () => {},
          ),
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () => {},
          )
        ],
      ),

      drawer: Drawer(
        child: Container(
          color: Color(0xFF009688),
          child: ListView(
            children: [
              DrawerHeader(
                child: Text(
                  "Menu",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home, color: Colors.white),
                title: Text("Home", style: TextStyle(color: Colors.white)),
                onTap: () => {},
              ),
              ListTile(
                leading: Icon(Icons.calculate, color: Colors.white),
                title:
                    Text("Calculator", style: TextStyle(color: Colors.white)),
                onTap: () => {},
              )
            ],
          ),
        ),
      ),

      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              SizedBox(height: 20),

              Center(
                child: Text(
                  "Enter Payroll Details",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),

              SizedBox(height: 30),

              Text(
                "Hours Worked",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 5),
              TextField(
                controller: hoursController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter hours",
                  
                ),
              ),

              SizedBox(height: 20),

              Text(
                "Hourly Rate",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 5),
              TextField(
                controller: rateController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter hourly rate",
                ),
              ),

              SizedBox(height: 20),

              Text(
                "Tax %",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 5),
              TextField(
                controller: taxController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter tax percentage",
                ),
              ),

              SizedBox(height: 20),

              Text(
                "Deductions",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 5),
              TextField(
                controller: deductionController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter deductions",
                ),
              ),

              SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: addPayroll,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF009688),
                  ),
                  child: Text(
                    "Calculate Payroll",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: payroll.length,
                itemBuilder: (context , index){
                  final item = payroll[index];
                  return Card(
                    elevation: 3,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: Padding(padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child:Text(item.toString() , style: TextStyle(fontSize: 16)) 
                          ),
                          IconButton( icon: Icon(Icons.delete , color: Colors.red),onPressed: () => {
                            setState(() {
                              payroll.removeAt(index);
                            })

                          },)
                      ],
                    ),)
                    
                    

                  );
                },
              )
            ],
            
          ),
        ),
        
      ),

     
    );
  }
}
