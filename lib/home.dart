import 'package:flutter/material.dart';
import 'clientmodel.dart';
import 'data.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var getData = <Clients>[];
  bool iscorrect = true;
  @override
  void initState() {
 
    super.initState();
    getD();
  }

  void getD() async {
    Data clientData = Data();
    await clientData.getdata();
    getData = clientData.data;
  
    setState(() {
      iscorrect = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Listexample"),
      ),
      body: iscorrect == true
          // ignore: avoid_unnecessary_containers
          ? Container(child: const Center(child: CircularProgressIndicator()))
          : SingleChildScrollView(
              // ignore: avoid_unnecessary_containers

              child: Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                  children: <Widget>[
                    // ignore: avoid_unnecessary_containers
                    Container(
                      child: ListView.builder(
                          itemCount: getData.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                           
                            return MainBody(
                                name: getData[index].name,
                                company: getData[index].company);
                          }),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

// ignore: must_be_immutable
class MainBody extends StatelessWidget {
  String name, company;
  // ignore: use_key_in_widget_constructors
  MainBody({required this.name, required this.company});
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 20),
          ),
          // ignore: prefer_const_constructors
          SizedBox(
            height: 3,
          ),
          Text(company),
          const SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
