import 'package:flutter/material.dart';
import 'package:lab/drawer.dart';
import 'package:lab/budget.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _judul = "";
  int _nominal = 0;
  String? _jenis;
  DateTime _date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Budget"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: "Contoh: Jajan Gorengan",
                    labelText: "Judul",
                    // icon: Icon(Icons.people),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                  // Menambahkan behavior saat nama diketik
                  onChanged: (String? value) {
                    setState(() {
                      _judul = value!;
                    });
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                      _judul = value!;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Judul tidak boleh kosong';
                    }
                    return null;
                  },
                ),
              ),
              // tambahkan komponen seperti input field disini
              // TextField(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Nominal",
                    labelText: "Nominal",
                    // icon: Icon(Icons.people),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                  // Menambahkan behavior saat nama diketik
                  onChanged: (String? value) {
                    setState(() {
                      if (value == null || value.isEmpty) {
                        _nominal = 0;
                      } else {
                        _nominal = int.parse(value);
                      }
                    });
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                      if (value == null || value.isEmpty) {
                        _nominal = 0;
                      } else {
                        _nominal = int.parse(value);
                      }
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nominal tidak boleh kosong';
                    }
                    if (int.parse(value) == 0) {
                      return 'Nominal tidak boleh 0';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton(
                  value: _jenis,
                  hint: const Text("Pilih Jenis"),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: ["Pemasukkan", "Pengeluaran"]
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _jenis = value ?? "";
                    });
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
              ),
              Padding(
                // Input Date
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.blue,
                    ),
                    const SizedBox(width: 4.0),
                    TextButton(
                      onPressed: (() {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2999),
                        ).then((value) {
                          setState(() {
                            _date = value!;
                          });
                        });
                      }),
                      child: Text(
                        _date.toString().split(' ')[0],
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  child: const Text(
                    "Simpan",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      final data = Budget(
                        judul: _judul,
                        nominal: _nominal,
                        jenis: _jenis.toString(),
                        date: _date,
                      );
                      Budget.addBudget(data);
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 15,
                            child: ListView(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              shrinkWrap: true,
                              children: <Widget>[
                                Center(
                                  child: Text(
                                    "Berhasil menambahkan $_jenis $_judul sebesar Rp${_nominal.toString()}",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Kembali'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                    _formKey.currentState!.reset();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
