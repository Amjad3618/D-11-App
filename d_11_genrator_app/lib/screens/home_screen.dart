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
          fontSize: 20,
          fontWeight: FontWeight.bold,
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
                    gradient: const LinearGradient(
                        colors: [Colors.blue, Colors.black]),
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
                      text: " 68 hrs",
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
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white
                 ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(radius: 30, backgroundColor: Colors.grey,),
                        const SizedBox(
                          width: 10,
                        ),
                        CustomTextWidget(
                          text: "User name",
                          fontSize: 30,
                          color:btncolor,
                          fontWeight: FontWeight.bold,
                        ),
                        const Spacer(),
                        const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: CircularProgressIndicator(
                            strokeWidth: 5,
                            value: 50,
                            color: Colors.amber,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomTextWidget(
                              text: "Cutt of time ",
                              fontSize: 20,
                              color: Color.fromARGB(255, 168, 13, 2),
                              fontWeight: FontWeight.bold,
                            ),
                            CustomTextWidget(
                              text: "10:30 ",
                              fontSize: 15,
                              color: btncolor,
                              fontWeight: FontWeight.bold,
                            ),
                            const CustomTextWidget(
                              text: "Cutt of Date ",
                              fontSize: 20,
                              color: Color.fromARGB(255, 199, 15, 1),
                              fontWeight: FontWeight.bold,
                            ),
                            CustomTextWidget(
                              text: "20/12/2024 ",
                              fontSize: 15,
                              color: btncolor,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CustomTextWidget(
                              text: "Return time ",
                              fontSize: 20,
                              color: btncolor,
                              fontWeight: FontWeight.bold,
                            ),
                            const CustomTextWidget(
                              text: "10:30 ",
                              fontSize: 15,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                            CustomTextWidget(
                              text: "Return Date  ",
                              fontSize: 20,
                              color: btncolor,
                              fontWeight: FontWeight.bold,
                            ),
                            const CustomTextWidget(
                              text: "20/12/2024 ",
                              fontSize: 15,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
