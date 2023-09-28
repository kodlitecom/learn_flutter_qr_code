import 'dart:io';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class HomeController extends GetxController {
  void downloadCatalog() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (context) {
            return pw.Column(children: [
              pw.Center(
                child: pw.Text(
                  "CATALOG PRODUCTS",
                  textAlign: pw.TextAlign.center,
                  style: const pw.TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Table(
                  border: pw.TableBorder.all(
                    color: PdfColors.black,
                    width: 2,
                  ),
                  children: [
                    pw.TableRow(children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(10),
                        child: pw.Text(
                          "No",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                            fontSize: 12,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(10),
                        child: pw.Text(
                          "Product Code",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                            fontSize: 12,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(10),
                        child: pw.Text(
                          "Product Name",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                            fontSize: 12,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(10),
                        child: pw.Text(
                          "Quantity",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                            fontSize: 12,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(10),
                        child: pw.Text(
                          "QR Code",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                            fontSize: 12,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ),
                    ]),
                    ...List.generate(5, (index) {
                      return pw.TableRow(children: [
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(10),
                          child: pw.Text(
                            "${index + 1}",
                            style: const pw.TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(10),
                          child: pw.Text(
                            "425344423",
                            style: const pw.TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(10),
                          child: pw.Text(
                            "Midasforce",
                            style: const pw.TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(10),
                          child: pw.Text(
                            "74",
                            style: const pw.TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(10),
                          child: pw.Text(
                            "QR Code",
                            textAlign: pw.TextAlign.center,
                            style: const pw.TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ]);
                    })
                  ]),
            ]);
          }),
    );

    Uint8List bytes = await pdf.save();

    final dir = await getExternalStorageDirectory();
    final file = File('${dir!.path}/mydocument.pdf');

    await file.writeAsBytes(bytes);

    await OpenFile.open(file.path);
  }
}
