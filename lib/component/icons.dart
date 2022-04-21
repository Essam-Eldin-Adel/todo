import 'package:flutter/material.dart';
import 'constant.dart';

class IconsScreen extends StatelessWidget {
  const IconsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: (){},
            icon: const Icon(Icons.create_new_folder_outlined,size: 35,color:Color(0xffa7b0d1))),
        const BoxSized1(),
        IconButton(onPressed: (){},
            icon: const Icon(Icons.flag_outlined,size: 35,color:Color(0xffa7b0d1))),
        const BoxSized1(),
        Transform.scale(
          scaleX: -1,
          child:IconButton(onPressed: (){},
              icon: const Icon(Icons.brightness_2_outlined,size: 35,color:Color(0xffa7b0d1) ,)),

        )
      ],
    );
  }
}
