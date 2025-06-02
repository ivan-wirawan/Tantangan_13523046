# TSP Dynamic Programming



## Deskripsi Tugas
**Traveling Salesman Problem (TSP)** adalah salah satu masalah optimasi kombinatorial yang paling menarik. Masalah ini bertujuan untuk menemukan rute terpendek yang mengunjungi setiap kota tepat sekali dan kembali ke kota asal.



<p align="center">
  Dibuat dengan
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Swift-FA7343?style=for-the-badge&logo=swift&logoColor=white" alt="Swift">
</p>


## 🧮 Algoritma
Program ini mengimplementasikan **Traveling Salesman Problem (TSP)** menggunakan **Dynamic Programming** dengan pendekatan fungsi rekursif `f(i, S)` yang menghitung biaya minimum untuk mencapai kota asal dari kota `i` dengan mengunjungi semua kota dalam himpunan `S`. Algoritma menggunakan **memoization** untuk menghindari perhitungan berulang dengan menyimpan hasil submasalah dalam dictionary `memo`, dan melacak jalur optimal menggunakan dictionary `parent`. 

Base case terjadi ketika `S` kosong, dimana fungsi mengembalikan jarak langsung ke kota asal. Untuk kasus rekursif, algoritma mencoba semua kota dalam himpunan `S`, menghitung biaya total secara rekursif dengan formula `f(i, S) = min{c{i,j} + f(j, S-{j})}`, dan memilih rute dengan biaya minimum. Setelah perhitungan selesai, algoritma merekonstruksi jalur optimal dari data `parent` yang tersimpan. Kompleksitas waktu algoritma adalah **O(n² × 2ⁿ)** dan kompleksitas ruang **O(n × 2ⁿ)**, yang jauh lebih efisien dibandingkan pendekatan brute force dengan kompleksitas **O(n!)**.

### Cara Kerja



## 🛠️ Instalasi

### Kebutuhan

- **Swift 5.0+**

### Langkah Instalasi

1. **Download File**
   ```swift
   Unduh Swift dari 
   - URL : https://www.swift.org/
   ```

2. **Jalankan Program**
   ```swift
   swift TSP.swift
   ```

## 📖 Cara Penggunaan


### Format Input

Program mengharapkan input dalam format berikut:

1. **Jumlah kota** (satu angka)
2. **Matriks ketetanggaan** (n baris, masing-masing n angka)

### Contoh Input

```
4
0 10 15 20
5 0 9 10
6 13 0 12
8 8 9 0
```

## 💡 Contoh Penggunaan

### Contoh 1: Graf 4 Kota

**Input:**
```
4
0 7 12 16
4 0 8 11
9 15 0 13
6 5 10 0
```

**Output:**
```
🎯 HASIL PERHITUNGAN TSP
========================================
📍 Jalur Optimal:
   1 → 2 → 3 → 4 → 1

💰 Total Biaya Minimum: 34

📊 Detail Perjalanan:
   Kota 1 → Kota 2
   Kota 2 → Kota 3
   Kota 3 → Kota 4
   Kota 4 → Kota 1
========================================

⏱️  Waktu eksekusi: 0.0011 detik
```

### Contoh 2: Graf 3 Kota Simetris

**Input:**
```
3
0 12 18
12 0 25
18 25 0
```

**Output:**
```
 HASIL PERHITUNGAN TSP
========================================
📍 Jalur Optimal:
   1 → 2 → 3 → 1

💰 Total Biaya Minimum: 55

📊 Detail Perjalanan:
   Kota 1 → Kota 2
   Kota 2 → Kota 3
   Kota 3 → Kota 1
========================================
```

## ⚡ Kompleksitas

| Metrik | Kompleksitas |
|--------|--------------|
| **Waktu** | O(n² × 2ⁿ) |
| **Ruang** | O(n × 2ⁿ) |

## 📁 Struktur Proyek

```
Tantangan_13523046/
├── TSP.swift           
└── README.md          
```

### Komponen Kode

**Fungsi Core Algorithm:**
- **`tsp(distance:)`** - Implementasi algoritma TSP dengan Dynamic Programming menggunakan formula `f(i, S)`
- **`f(_:_:)`** - Fungsi rekursif internal untuk menghitung biaya minimum dari kota `i` dengan mengunjungi himpunan `S`

**Fungsi Input/Output:**
- **`readInt()`** - Membaca input integer dengan validasi error handling
- **`readIntArray()`** - Membaca array integer dari input (tidak digunakan dalam implementasi final)
- **`printHeader()`** - Menampilkan header program dengan format visual yang menarik
- **`printMatrix(_:_:)`** - Menampilkan matriks ketetanggaan dalam format tabel yang mudah dibaca
- **`printResult(_:)`** - Menampilkan hasil TSP termasuk jalur optimal dan total biaya

**Fungsi Utama:**
- **`main()`** - Fungsi utama yang mengatur alur program dari input hingga output, termasuk validasi input dan pengukuran waktu eksekusi

**Data Structures:**
- **`memo`** - Dictionary dengan key `String` untuk memoization hasil perhitungan `f(i, S)`
- **`parent`** - Dictionary untuk menyimpan pilihan optimal guna rekonstruksi jalur
- **`distance`** - Matriks ketetanggaan 2D yang menyimpan jarak antar kota

**Utility:**
- **`String * Int`** - Extension operator untuk membuat garis pembatas dengan perulangan string
- **`INF`** - Konstanta untuk nilai tak hingga (Int.max / 2) untuk mencegah overflow
## 📚 Referensi
1. **Program Dinamis (Bagian 1)** 
    - URL : https://informatika.stei.itb.ac.id/~rinaldi.munir/Stmik/2024-2025/25-Program-Dinamis-(2025)-Bagian1.pdf
2. **Program Dinamis (Bagian 2)** 
    - URL : https://informatika.stei.itb.ac.id/~rinaldi.munir/Stmik/2024-2025/26-Program-Dinamis-(2025)-Bagian2.pdf
       

## 👨‍💻 Author

**Ivan Wirawan**
- 📧 Email: 13523046@std.stei.itb.ac.id / ivanwirawan25@gmail.com
- 🎓 NIM: 13523046 
---
