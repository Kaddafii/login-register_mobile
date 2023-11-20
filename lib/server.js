const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');

const app = express();
const port = 3308;

// Koneksi ke database MySQL
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'sewa_kontrakan',
});

db.connect((err) => {
  if (err) {
    console.error('Koneksi ke database gagal: ' + err.stack);
    return;
  }
  console.log('Terhubung ke database MySQL dengan ID ' + db.threadId);
});

// Middleware untuk mengizinkan CORS
app.use((req, res, next) => {
  res.header('Access-Control-Allow-Origin', '*');
  res.header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
  res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');

  res.header('Access-Control-Allow-Credentials', 'true');
  next();
});

app.use(bodyParser.json());

// Endpoint untuk registrasi
app.post('/register_pemilik', (req, res) => {
  const { email, noHP, alamat, password } = req.body;
  const query = 'INSERT INTO registrasi_pemilik (email, noHP, alamat, password) VALUES (?, ?, ?, ?)';
  db.query(query, [email, noHP, alamat, password], (err, result) => {
    if (err) {
      console.error('Gagal melakukan registrasi: ' + err.message);
      res.status(500).json({ error: 'Gagal melakukan registrasi' });
    } else {
      res.status(200).json({ message: 'Registrasi berhasil' });
    }
  });
});

// Endpoint untuk mendapatkan data registrasi
app.get('/registrasi_pemilik', (req, res) => { // Perbaiki nama endpoint
  const query = 'SELECT * FROM registrasi_pemilik'; // Tambahkan * untuk mendapatkan semua kolom
  db.query(query, (err, results) => {
    if (err) {
      console.error('Gagal mendapatkan data registrasi: ' + err.message);
      res.status(500).json({ error: 'Gagal mendapatkan data registrasi' });
    } else {
      res.status(200).json(results);
    }
  });
});
app.use(bodyParser.json());

// Endpoint untuk registrasi
app.post('/register_penyewa', (req, res) => { // Perbaiki nama endpoint
  const { email, noHP, alamat, password } = req.body;
  const query = 'INSERT INTO registrasi_penyewa (email, noHP, alamat, password) VALUES (?, ?, ?, ?)';
  db.query(query, [email, noHP, alamat, password], (err, result) => {
    if (err) {
      console.error('Gagal melakukan registrasi: ' + err.message);
      res.status(500).json({ error: 'Gagal melakukan registrasi' });
    } else {
      res.status(200).json({ message: 'Registrasi berhasil' });
    }
  });
});

// Endpoint untuk mendapatkan data registrasi
app.get('/registrasi_penyewa', (req, res) => { // Perbaiki nama endpoint
  const query = 'SELECT * FROM registrasi_penyewa'; // Tambahkan * untuk mendapatkan semua kolom
  db.query(query, (err, results) => {
    if (err) {
      console.error('Gagal mendapatkan data registrasi: ' + err.message);
      res.status(500).json({ error: 'Gagal mendapatkan data registrasi' });
    } else {
      res.status(200).json(results);
    }
  });
});


app.post('/login_pemilik', (req, res) => {
  const { email, password } = req.body;
  const query = 'SELECT * FROM registrasi_pemilik WHERE email = ? AND password = ?';
  db.query(query, [email, password], (err, results) => {
    if (err) {
      console.error('Gagal melakukan login: ' + err.message);
      res.status(500).json({ error: 'Gagal melakukan login' });
    } else {
      if (results.length > 0) {
        // User ditemukan, beri respons berhasil
        res.status(200).json({ message: 'Login berhasil' });
      } else {
        // User tidak ditemukan atau password salah
        res.status(401).json({ error: 'Email atau password salah' });
      }
    }
  });
});
app.post('/login_penyewa', (req, res) => {
  const { email, password } = req.body;
  const query = 'SELECT * FROM registrasi_penyewa WHERE email = ? AND password = ?';
  db.query(query, [email, password], (err, results) => {
    if (err) {
      console.error('Gagal melakukan login: ' + err.message);
      res.status(500).json({ error: 'Gagal melakukan login' });
    } else {
      if (results.length > 0) {
        // User ditemukan, beri respons berhasil
        res.status(200).json({ message: 'Login berhasil' });
      } else {
        // User tidak ditemukan atau password salah
        res.status(401).json({ error: 'Email atau password salah' });
      }
    }
  });
});

app.listen(port, () => {
  console.log(`Server berjalan di http://localhost:${port}`);
});