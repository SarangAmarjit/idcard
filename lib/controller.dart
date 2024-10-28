import 'dart:developer';

import 'package:demoap/idcard.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:screenshot/screenshot.dart';
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart';
import 'dart:html' as html;
import 'package:js/js.dart';
import 'package:printing/printing.dart';

class IdController extends GetxController {
  final ScreenshotController _screenshotController = ScreenshotController();

  // Future<void> captureAndPrint(BuildContext context) async {
  //   final doc = pw.Document();
  //   try {
  //     final image2 = await _screenshotController.captureFromLongWidget(
  //       pixelRatio: 2,
  //       const MediaQuery(
  //           data: MediaQueryData(),
  //           child: MaterialApp(
  //               debugShowCheckedModeBanner: false,
  //               home: Material(child: IDcardWidget()))),
  //       delay: const Duration(milliseconds: 100),
  //       context: context,
  //     );

  //     // Check if image is null
  //     final profileImage = pw.MemoryImage((image2));
  //     doc.addPage(
  //       pw.Page(
  //         pageFormat: PdfPageFormat.undefined,
  //         build: (pw.Context context) {
  //           return pw.Center(child: pw.Image(profileImage));
  //         },
  //       ),
  //     );
  //     final pdfData = await doc.save();

  //     final blob = html.Blob([pdfData], 'application/pdf');
  //     final url = html.Url.createObjectUrlFromBlob(blob);
  //     final downloadLink = html.AnchorElement(href: url)
  //       ..setAttribute('download', 'ID_Card.pdf') // File name for download
  //       ..style.display = 'none'; // Hide the link
  //     html.document.body?.append(downloadLink);
  //     downloadLink.click(); // Trigger the download
  //     downloadLink.remove(); // Remove the link after download is triggered

  //     final newWindow =
  //         html.window.open(url, '_blank'); // Open in a new tab for preview

  //     // Trigger the print dialog after a short delay
  //     openPrintDialog(
  //         newWindow); // Use the JS function to open the print dialog
  //     html.Url.revokeObjectUrl(url);

  //   } catch (e) {
  //     print("Error capturing and printing: $e");
  //   }
  // }
}
