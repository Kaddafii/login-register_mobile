import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'loginPenyewa.dart';

class RegistPenyewa extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController noHPController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RegistPenyewa({Key? key}) : super(key: key);

  Future<void> registerPenyewa(BuildContext context, String email, String noHP,
      String alamat, String password) async {
    if (email.isEmpty || noHP.isEmpty || alamat.isEmpty || password.isEmpty) {
      print('Semua kolom harus diisi!');
      return;
    }

    final response = await http.post(
      Uri.parse('http://10.0.2.2:3308/register_penyewa'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'noHP': noHP,
        'alamat': alamat,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      print('Registrasi penyewa berhasil!');

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPenyewa()),
      );
    } else {
      print('Registrasi gagal!');
    }
  }

  String getEmailValue() => emailController.text;
  String getNoHPValue() => noHPController.text;
  String getAlamatValue() => alamatController.text;
  String getPasswordValue() => passwordController.text;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => LoginPenyewa()),
                ),
              );
            },
            icon: Image.asset('assets/images/arrow.png'),
          ),
          title: Text(
            'Registrasi penyewa',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 24,
              color: Color.fromRGBO(29, 77, 79, 1.0),
            ),
          ),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: constraints.maxHeight * 0.05,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Image.asset('assets/images/Klogo3.png'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 5, left: 20, right: 20),
                      child: Text(
                        "Alamat Email",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          color: Color.fromRGBO(29, 77, 79, 1),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 1, bottom: 5, left: 20, right: 20),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "user@gmail.com",
                          hintStyle: TextStyle(color: Colors.grey[300]),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 1, bottom: 5, left: 20, right: 20),
                      child: Text(
                        "No. Handphone",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          color: Color.fromRGBO(29, 77, 79, 1),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 1, bottom: 5, left: 20, right: 20),
                      child: TextField(
                        controller: noHPController,
                        decoration: InputDecoration(
                          hintText: "No. Handphone",
                          hintStyle: TextStyle(color: Colors.grey[300]),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 1, bottom: 5, left: 20, right: 20),
                      child: Text(
                        "Alamat",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          color: Color.fromRGBO(29, 77, 79, 1),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 1, bottom: 5, left: 20, right: 20),
                      child: TextField(
                        controller: alamatController,
                        decoration: InputDecoration(
                          hintText: "Alamat",
                          hintStyle: TextStyle(color: Colors.grey[300]),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 1, bottom: 5, left: 20, right: 20),
                      child: Text(
                        "Password",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          color: Color.fromRGBO(29, 77, 79, 1),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 1, bottom: 5, left: 20, right: 20),
                      child: TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.grey[300]),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 1, top: 1, right: 50, left: 50),
                        child: ElevatedButton(
                          onPressed: () {
                            String email = getEmailValue();
                            String noHP = getNoHPValue();
                            String alamat = getAlamatValue();
                            String password = getPasswordValue();

                            registerPenyewa(
                                context, email, noHP, alamat, password);
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.only(
                                top: 3, bottom: 3, right: 80, left: 80),
                            backgroundColor:
                                const Color.fromRGBO(40, 48, 72, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                          ),
                          child: Text(
                            "Daftar",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: 1, bottom: 50, left: 80, right: 80),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Sudah punya Akun?",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              color: Colors.grey[500],
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPenyewa()),
                              );
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.grey[500],
                            ),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                color: Color.fromRGBO(60, 139, 23, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
