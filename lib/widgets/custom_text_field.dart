import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({Key? key}) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'COMMENTS',
                textAlign: TextAlign.left,
                style: TextStyle(
                  letterSpacing: 2,
                  fontFamily: 'FiraSans',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
            child: TextField(
              onTap: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                hintText: 'Write',
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.zero,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
          Visibility(
            visible: isVisible,
            child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(children: [
                  Container(
                    height: 24,
                    width: 64,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero),
                          padding: EdgeInsets.all(5),
                          backgroundColor: Color(0xFF1D49BA).withOpacity(0.16)),
                      onPressed: () {},
                      child: Text(
                        "SEND",
                        style: TextStyle(
                          fontFamily: 'FiraSans',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2,
                          color: Color(0xFF1D49BA),
                        ),
                      ),
                    ),
                  ),
                ])),
          )
        ],
      ),
    );
  }
}
