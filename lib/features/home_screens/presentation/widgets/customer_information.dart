import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/customer_photo.dart';

class CustomerInformation extends StatelessWidget {
  const CustomerInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:EdgeInsets.only(left:context.width*0.045,top:context.height*0.0165),
      child: const Row(
        children: [
          CustomerPhoto(),
        ],
      ),
    );
  }
}
