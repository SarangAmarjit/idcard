import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:screenshot/screenshot.dart';

class IDCard extends StatelessWidget {
  IDCard({super.key});

  final ScreenshotController _screenshotController = ScreenshotController();
  final GlobalKey _globalKey = GlobalKey();
  final doc = pw.Document();
  Future<void> _captureAndPrint(BuildContext context) async {
    try {
      final image2 = await _screenshotController.capture();

      // Check if image is null
      if (image2 == null) {
        throw Exception("Failed to capture image. Please try again.");
      }

      doc.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Center(
              child: pw.Image(
                pw.MemoryImage(image2), // Use pw.MemoryImage here
              ),
            );
          },
        ),
      );

      // Use the printing package to print or share the PDF
      await Printing.layoutPdf(onLayout: (format) async => doc.save());
    } catch (e) {
      print("Error capturing and printing: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ID Card'),
        actions: [
          IconButton(
            icon: const Icon(Icons.print),
            onPressed: () => _captureAndPrint(context),
          ),
        ],
      ),
      body: Center(
        child: Screenshot(
          controller: _screenshotController,
          child: Container(
            width: 300,
            height: 550,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(
                    'assets/images/idbg.png'), // Your background image
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
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
                  const SizedBox(height: 80),
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                        'https://thumbs.dreamstime.com/b/profile-picture-caucasian-male-employee-posing-office-happy-young-worker-look-camera-workplace-headshot-portrait-smiling-190186649.jpg'),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'James Thokchom',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.phone, color: Colors.green, size: 16),
                            SizedBox(width: 5),
                            Text(
                              '+91 7005234973',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.phone_android,
                                color: Colors.orange, size: 16),
                            SizedBox(width: 5),
                            Text(
                              'Emergency : +91 7005738245',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.email, color: Colors.red, size: 16),
                            SizedBox(width: 5),
                            Text(
                              'james@gmail.com',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.location_on,
                                color: Colors.blue, size: 16),
                            SizedBox(width: 3),
                            Expanded(
                              child: Text(
                                'Singjamei Thongam Leikai, Imphal dfs',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
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
                  const Text(
                    'ID: 123456789',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    color: Colors.white,
                    child: BarcodeWidget(
                      data: '123456789',
                      barcode: Barcode.code128(),
                      width: 200,
                      height: 35,
                      drawText: false,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
