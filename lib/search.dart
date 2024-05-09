import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final _list = List.generate(
    1,
    (index) => Container(
      height: 25,
      child: Row(
        children: [
          Container(
            width: 80,
            color: Color.fromARGB(255, 240, 240, 240),
            child: const Center(
              child: Text(
                "City",
                style: TextStyle(
                  color: Color.fromARGB(255, 189, 189, 189),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              color: Color.fromARGB(255, 240, 240, 240),
              child: Center(
                child: Text(
                  "Title",
                  style: TextStyle(
                    color: Color.fromARGB(255, 189, 189, 189),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _list.addAll([
      Container(
        height: 25,
        child: Row(
          children: [
            Container(
              width: 80,
              child: const Center(
                child: Text(
                  "Ramalla",
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Expanded(
              child: Center(
                child: Text(
                  "بحاجة وحدات دم مستعجلة",
                  style: TextStyle(
                    color: Color.fromARGB(255, 2, 2, 2),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ].toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color.fromARGB(255, 36, 161, 145),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back,color: Colors.white,),
        ),
        actions: [
          IconButton(
            hoverColor: const Color.fromARGB(92, 172, 87, 87),
            onPressed: () {},
            icon: const Icon(Icons.search),
           color: Colors.white,
          ),
          IconButton(
            hoverColor: const Color.fromARGB(92, 172, 87, 87),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => Scaffold(
                  body: Center(
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DropdownButton(items: const[
                          DropdownMenuItem(
                            value: "1",
                            child: Text("data"),
                          ),
                          DropdownMenuItem(
                            value: "2",
                            child: Text("data"),
                          ),
                        ], onChanged: (v) {}),
                        DropdownButton(items: const[
                          DropdownMenuItem(
                            value: "1",
                            child: Text("data"),
                          ),
                          DropdownMenuItem(
                            value: "2",
                            child: Text("data"),
                          ),
                        ], onChanged: (v) {}),
                        FloatingActionButton(onPressed: (){}, child: Text("finish"),),
                      ],
                    ),
                  ),
                ),
              );
            },
            icon: const Icon(Icons.filter_list_rounded),
            color: Colors.white,
          )
        ],
        title: const TextField(
           style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Type',
            labelText: 'Search',
            hoverColor:Colors.white ,
            hintStyle: TextStyle(color: Colors.white),
            labelStyle: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _list.length,
        itemBuilder: (BuildContext context, int index) {
          return _list[index];

          // ListTile(
          //   title: Text(_list[index]),
          // );
        },
      ),
    );
  }
}
