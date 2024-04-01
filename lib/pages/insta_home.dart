import 'package:flutter/material.dart';
import 'package:journey_ii/widgets/insta_profile_followers.dart';

class InstaHome extends StatefulWidget {
  const InstaHome({super.key});

  @override
  State<InstaHome> createState() => _InstaHome();
}

class _InstaHome extends State<InstaHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Colors.white,
        title: const Text(
          "Vivek_Patel_01",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.amberAccent,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InstaProfileFollowers(
                                  count: "14.4k", lable: "Followers"),
                              InstaProfileFollowers(
                                  count: "23", lable: "Following"),
                              InstaProfileFollowers(
                                  count: "34", lable: "Posts"),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 8.0),
                            width: double.maxFinite,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                ),
                              ),
                              onPressed: () {},
                              child: const Text("Follow"),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  width: double.maxFinite,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Vivek Bhuva",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      Text(
                        "I M A Full Stack Developer",
                        style: TextStyle(color: Colors.greenAccent),
                      ),
                      Text(
                        "www.vivek.com",
                        style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),

          // Highlight
          Container(
              padding: const EdgeInsets.all(6),
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 100,
                  itemBuilder: (BuildContext context, i) {
                    return Padding(
                      padding: const EdgeInsets.all(4),
                      child: CircleAvatar(
                        radius: 40.0,
                        backgroundColor: i % 2 == 0 ? Colors.black : Colors.red,
                      ),
                    );
                  })),

          // Profile Grid
          Expanded(
            child: SizedBox(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 2.0,
                            mainAxisSpacing: 3.0),
                    itemCount: 100,
                    itemBuilder: (builder, index) {
                      return Container(
                          height: 100, width: 100, color: Colors.amber);
                    })),
          )
        ]),
      ),
    );
  }
}
