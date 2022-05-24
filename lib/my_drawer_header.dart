import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  MyHeaderDrawer({Key? key}) : super(key: key);

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[700],
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(
                        'assets/images/for_hm_thati_profile_pic.png'))),
          ),
          const Text("Rapid Tech",
              style: TextStyle(color: Colors.white, fontSize: 20)),
          Text("info@grapidtech.dev",
              style: TextStyle(color: Colors.grey[200], fontSize: 14)),
        ],
      ),
    );
  }
}
