import 'package:flutter/material.dart';
import 'package:iban_utilities/applogger.dart';
import 'package:iban_utilities_lib/bank.dart';
import 'package:iban_utilities_lib/enums_countries.dart';
import 'package:iban_utilities_lib/extensions.dart';
import 'package:iban_utilities_lib/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IBAN Utilities Library Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'IBAN Utilities Demo Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myController = TextEditingController();
  bool ibanStatus = true;
  String ibanStatusText = "DOĞRU";
  Color textColor = Colors.green;

  String countryCode = "";
  String checkDigits = "";
  String bankCode = "";
  String nationalCheckDigit = "";
  String bankAccountNumber = "";
  String bankName = "";
  String bankImage = "";
  late Bank bankObj;

  @override
  void initState() {
    super.initState();
    myController.addListener(_printLatestValue);
    myController.text = "TR330006100519786457841326";
  }

  void _printLatestValue() {
    AppLogger.log('Text field value: ${myController.text}');
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  autofocus: false,
                  controller: myController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'IBAN Numarası giriniz',
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue, // foreground
                      ),
                      onPressed: () {
                        setState(() {
                          AppLogger.log(myController.text
                              .ibanValidate(Country.turkish)
                              .toString());
                          ibanStatus =
                              (myController.text.ibanValidate(Country.turkish))
                                  ? true
                                  : false;
                          ibanStatusText =
                              (myController.text.ibanValidate(Country.turkish))
                                  ? "DOĞRU"
                                  : "YANLIŞ";
                          textColor =
                              (myController.text.ibanValidate(Country.turkish))
                                  ? Colors.green
                                  : Colors.red;
                          if (ibanStatus) {
                            bankObj = Utils.getBankObject(Country.turkish,
                                myController.text.getBankCode(Country.turkish));
                            if (bankObj.bankName != "" &&
                                bankObj.bankImage != "") {
                              bankName = bankObj.bankName;
                              bankImage = bankObj.bankImage;
                            } else {
                              bankName = "";
                              bankImage = "";
                            }
                          } else {
                            bankName = "";
                            bankImage = "";
                          }
                          countryCode =
                              myController.text.getCountryCode(Country.turkish);
                          checkDigits =
                              myController.text.getCheckDigits(Country.turkish);
                          bankCode =
                              myController.text.getBankCode(Country.turkish);
                          nationalCheckDigit = myController.text
                              .getNationalCheckDigit(Country.turkish);
                          bankAccountNumber = myController.text
                              .getBankAccountNumber(Country.turkish);
                        });
                      },
                      child: const Text('Kontrol Et'),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue, // foreground
                      ),
                      onPressed: () {
                        setState(() {
                          var newIban = Utils.generateIban(Country.turkish);
                          AppLogger.log("Generate IBAN: $newIban");
                          myController.text = newIban;
                          ibanStatus =
                              (myController.text.ibanValidate(Country.turkish))
                                  ? true
                                  : false;
                          ibanStatusText =
                              (myController.text.ibanValidate(Country.turkish))
                                  ? "DOĞRU"
                                  : "YANLIŞ";
                          textColor =
                              (myController.text.ibanValidate(Country.turkish))
                                  ? Colors.green
                                  : Colors.red;
                          if (ibanStatus) {
                            bankObj = Utils.getBankObject(Country.turkish,
                                myController.text.getBankCode(Country.turkish));
                            if (bankObj.bankName != "" &&
                                bankObj.bankImage != "") {
                              bankName = bankObj.bankName;
                              bankImage = bankObj.bankImage;
                            } else {
                              bankName = "";
                              bankImage = "";
                            }
                          }
                          countryCode =
                              myController.text.getCountryCode(Country.turkish);
                          checkDigits =
                              myController.text.getCheckDigits(Country.turkish);
                          bankCode =
                              myController.text.getBankCode(Country.turkish);
                          nationalCheckDigit = myController.text
                              .getNationalCheckDigit(Country.turkish);
                          bankAccountNumber = myController.text
                              .getBankAccountNumber(Country.turkish);
                        });
                      },
                      child: const Text('TR IBAN Üret'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue, // foreground
                      ),
                      onPressed: () {
                        setState(() {
                          myController.text = "TR330006100519786457841326";
                          ibanStatus =
                              (myController.text.ibanValidate(Country.turkish))
                                  ? true
                                  : false;
                          ibanStatusText =
                              (myController.text.ibanValidate(Country.turkish))
                                  ? "DOĞRU"
                                  : "YANLIŞ";
                          textColor =
                              (myController.text.ibanValidate(Country.turkish))
                                  ? Colors.green
                                  : Colors.red;
                          if (ibanStatus) {
                            bankObj = Utils.getBankObject(Country.turkish,
                                myController.text.getBankCode(Country.turkish));
                            if (bankObj.bankName != "" &&
                                bankObj.bankImage != "") {
                              bankName = bankObj.bankName;
                              bankImage = bankObj.bankImage;
                            } else {
                              bankName = "";
                              bankImage = "";
                              //countryCode = "";
                              //checkDigits = "";
                              //bankCode = "";
                              //nationalCheckDigit = "";
                              //bankAccountNumber = "";
                            }
                          }
                          countryCode =
                              myController.text.getCountryCode(Country.turkish);
                          checkDigits =
                              myController.text.getCheckDigits(Country.turkish);
                          bankCode =
                              myController.text.getBankCode(Country.turkish);
                          nationalCheckDigit = myController.text
                              .getNationalCheckDigit(Country.turkish);
                          bankAccountNumber = myController.text
                              .getBankAccountNumber(Country.turkish);
                        });
                      },
                      child: const Text('TR Doğru IBAN'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue, // foreground
                      ),
                      onPressed: () {
                        setState(() {
                          myController.text = "TR770006100519786457841326";
                          ibanStatus =
                              (myController.text.ibanValidate(Country.turkish))
                                  ? true
                                  : false;
                          ibanStatusText =
                              (myController.text.ibanValidate(Country.turkish))
                                  ? "DOĞRU"
                                  : "YANLIŞ";
                          textColor =
                              (myController.text.ibanValidate(Country.turkish))
                                  ? Colors.green
                                  : Colors.red;
                          if (ibanStatus) {
                            bankObj = Utils.getBankObject(Country.turkish,
                                myController.text.getBankCode(Country.turkish));
                            if (bankObj.bankName != "" &&
                                bankObj.bankImage != "") {
                              bankName = bankObj.bankName;
                              bankImage = bankObj.bankImage;
                            } else {
                              bankName = "";
                              bankImage = "";
                              //countryCode = "";
                              //checkDigits = "";
                              //bankCode = "";
                              //nationalCheckDigit = "";
                              //bankAccountNumber = "";
                            }
                          } else {
                            bankName = "";
                            bankImage = "";
                          }
                          countryCode =
                              myController.text.getCountryCode(Country.turkish);
                          checkDigits =
                              myController.text.getCheckDigits(Country.turkish);
                          bankCode =
                              myController.text.getBankCode(Country.turkish);
                          nationalCheckDigit = myController.text
                              .getNationalCheckDigit(Country.turkish);
                          bankAccountNumber = myController.text
                              .getBankAccountNumber(Country.turkish);
                        });
                      },
                      child: const Text('TR Hatalı IBAN'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue, // foreground
                      ),
                      onPressed: () {
                        setState(() {
                          var tempIban = myController.text;
                          myController.text = tempIban.prepareIban();
                          ibanStatus =
                              (myController.text.ibanValidate(Country.turkish))
                                  ? true
                                  : false;
                          ibanStatusText =
                              (myController.text.ibanValidate(Country.turkish))
                                  ? "DOĞRU"
                                  : "YANLIŞ";
                          textColor =
                              (myController.text.ibanValidate(Country.turkish))
                                  ? Colors.green
                                  : Colors.red;
                        });
                      },
                      child: const Text('Elektronik Formatı'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue, // foreground
                      ),
                      onPressed: () {
                        setState(() {
                          var tempIban = myController.text;
                          myController.text = tempIban.toPrintFormat();
                          ibanStatus =
                              (myController.text.ibanValidate(Country.turkish))
                                  ? true
                                  : false;
                          ibanStatusText =
                              (myController.text.ibanValidate(Country.turkish))
                                  ? "DOĞRU"
                                  : "YANLIŞ";
                          textColor =
                              (myController.text.ibanValidate(Country.turkish))
                                  ? Colors.green
                                  : Colors.red;
                        });
                      },
                      child: const Text('Baskı Formatı'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: Center(
                    child: Table(
                      border: TableBorder.all(),
                      columnWidths: const {
                        0: FractionColumnWidth(.35),
                        1: FractionColumnWidth(.65)
                      },
                      children: [
                        TableRow(children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "IBAN DURUMU:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              ibanStatusText,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: textColor),
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "BANKA:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              (bankName != "") ? bankName : "",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "BANKA:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: (bankImage != "")
                                ? Image.asset('assets/images/$bankImage.png')
                                : Image.asset(
                                    'assets/images/bos.png',
                                    width: 3,
                                    height: 3,
                                  ),
                          ),
                        ]),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Center(
                  child: Table(
                    border: TableBorder.all(),
                    columnWidths: const {
                      0: FractionColumnWidth(.55),
                      1: FractionColumnWidth(.45)
                    },
                    children: [
                      const TableRow(children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Bilgi",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Karakter Grubu",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ]),
                      TableRow(children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child:
                              Text("Ülke Kodu", style: TextStyle(fontSize: 10)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(countryCode,
                              style: const TextStyle(fontSize: 10)),
                        ),
                      ]),
                      TableRow(children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Kontrol Numarası",
                              style: TextStyle(fontSize: 10)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(checkDigits,
                              style: const TextStyle(fontSize: 10)),
                        ),
                      ]),
                      TableRow(children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Banka Kodu",
                              style: TextStyle(fontSize: 10)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(bankCode,
                              style: const TextStyle(fontSize: 10)),
                        ),
                      ]),
                      TableRow(children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Ulusal Kontrol Sayısı",
                              style: TextStyle(fontSize: 10)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(nationalCheckDigit,
                              style: const TextStyle(fontSize: 10)),
                        ),
                      ]),
                      TableRow(children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Banka Hesap Numarası",
                              style: TextStyle(fontSize: 10)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(bankAccountNumber,
                              style: const TextStyle(fontSize: 10)),
                        ),
                      ]),
                    ],
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
