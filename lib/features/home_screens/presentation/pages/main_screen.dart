import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/customer_information.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(
        preferredSize:Size(double.infinity, context.height*0.174 ), //width and height
        child:  const SafeArea(
          child: Column(
            children: [
              CustomerInformation(),
            ],
          )
        ),
      ),
    );
  }
}
