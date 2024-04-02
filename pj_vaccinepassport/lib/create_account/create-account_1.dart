import 'package:flutter/material.dart';

class CreateAccount1 extends StatelessWidget {
  const CreateAccount1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    
    return Scaffold(
      body: Container(
      width: screenSize.width,
      height: 126,
      padding: const EdgeInsets.only(
        top: 57,
        left: 22,
        right: 123,
        bottom: 33,
      ),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.99, -0.12),
          end: Alignment(-0.99, 0.12),
          colors: [Color(0xFF2D4737), Color(0xE5B7BF96), Color(0xFF7C9670)],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 36,
            height: 36,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
                  ),
                ),
              ],
            ),
          ),
          Text(
            'สร้างบัญชี',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontFamily: 'Kanit',
              fontWeight: FontWeight.w400,
              height: 0.03,
              letterSpacing: 0.25,
            ),
          ),
        ],
      ),
    ));
  }
}
