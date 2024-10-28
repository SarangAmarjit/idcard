import 'dart:html' as html;
import 'dart:typed_data';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:js/js.dart';

class IDcardWidget extends StatelessWidget {
  final String name;

  final String phone;
  final String emergennumber;
  final String email;
  final int membershipsid;
  final String address;
  const IDcardWidget({
    super.key,
    required this.name,
    required this.phone,
    required this.emergennumber,
    required this.email,
    required this.membershipsid,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 476,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/idcard4.png'),
              fit: BoxFit.cover,
            ),
            // borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 70),
                const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/prof.jpg')),
                const SizedBox(height: 20),
                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.phone,
                              color: Colors.green, size: 16),
                          const SizedBox(width: 5),
                          Text(
                            phone,
                            style: const TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const Icon(Icons.phone_android,
                              color: Colors.orange, size: 16),
                          const SizedBox(width: 5),
                          Text(
                            'Emergency : $emergennumber',
                            style: const TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const Icon(Icons.email, color: Colors.red, size: 16),
                          const SizedBox(width: 5),
                          Text(
                            email,
                            style: const TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.location_on,
                              color: Colors.blue, size: 16),
                          const SizedBox(width: 3),
                          Expanded(
                            child: Text(
                              address,
                              style: const TextStyle(
                                color: Colors.white70,
                              ),
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Text(
                  'ID: ${membershipsid.toString()}',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  color: Colors.white,
                  child: BarcodeWidget(
                    data: membershipsid.toString(),
                    barcode: Barcode.code128(),
                    width: 200,
                    height: 30,
                    drawText: false,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
