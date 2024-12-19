import 'package:d_11_genrator_app/Utils/colors.dart';
import 'package:d_11_genrator_app/Widgets/text_widget.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomTextWidget(
          text: "H O M E",
          color: Colors.white,
          fontSize: 20,fontWeight: FontWeight.bold,
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: btncolor,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextWidget(
                      text: "Total Hours",
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_upward,
                          color: Colors.green,
                        ),
                        Icon(
                          Icons.arrow_downward,
                          color: Colors.red,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CustomTextWidget(
                      text: " 68",
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              decoration: const BoxDecoration(color: Colors.amber),
            )
          ],
        ),
      ),
    );
  }
}
