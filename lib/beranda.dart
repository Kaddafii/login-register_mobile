import 'package:flutter/material.dart';
import 'package:program_registrasi/loginPemilik.dart';

class Beranda extends StatelessWidget {
  const Beranda({super.key});

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
                  builder: ((context) => LoginPemilik()),
                ),
              );
            },
            icon: Image.asset('assets/images/arrow.png'),
          ),
          title: Text(
            'Beranda',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 24,
              color: Color.fromRGBO(29, 77, 79, 1.0),
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Login berhasil masuk beranda pemilik'),
          ],
        ),
      ),
    );
  }
}
