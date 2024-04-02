import 'package:flutter/material.dart';

class CreateAccount1 extends StatelessWidget {
  const CreateAccount1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // width: 360,
        // height: 800,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 752,
              child: Container(
                decoration: BoxDecoration(color: Color(0xFFF2F4F2)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 360,
                      height: 48,
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            child: Stack(
                              children: [
                                // Add your widgets here
                              ],
                            ),
                          ),
                          Container(
                            width: 44,
                            height: 44,
                            child: Stack(
                              children: [
                                // Add your widgets here
                              ],
                            ),
                          ),
                          Container(
                            width: 44,
                            height: 44,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 14.30,
                                  top: 14.30,
                                  child: Container(
                                    width: 16,
                                    height: 16,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFF3F4946),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 360,
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
                    colors: [
                      Color(0xFF2D4737),
                      Color(0xE5B7BF96),
                      Color(0xFF7C9670)
                    ],
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
              ),
            ),
            // Add other Positioned widgets here
          ],
        ),
      ),
    );
  }
}
