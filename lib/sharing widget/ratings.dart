import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  const Rating({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(bottom: 2),
      
      decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
      child: Column(
        children: [
          Row(
            children: [
              Container(margin:const EdgeInsets.only(left: 10),
                height: 40,
                width: 40,
                color: Colors.green,
                child:const Image(image: AssetImage('Images/volunteer.jpg')),
              ),
              const SizedBox(width: 4,),
              const Text(
                "100",
                style: TextStyle(fontSize: 22),
              ),
              const Text(
                ",",
                style: TextStyle(color: Colors.blueGrey, fontSize: 19),
              ),
              const Text(
                "0",
                style: TextStyle(fontSize: 15),
              ),
              const Text(
                " Vcoin",
                style: TextStyle(fontSize: 15,color: Color.fromRGBO(255, 160, 0, 1)),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text("joining",style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 156, 196, 156),),),
                    Text("12",style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 156, 196, 156),),),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text("Others rate",style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 159, 156, 196),),),
                    Text("1000",style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 159, 156, 196),),),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text("my activity rate",style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 196, 156, 173),),),
                    Text("200",style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 180, 144, 159),),),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
