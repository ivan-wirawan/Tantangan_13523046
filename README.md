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
Program ini menyelesaikan masalah Traveling Salesman Problem (TSP) secara optimal menggunakan Dynamic Programming. Algoritma ini menghindari perhitungan ulang dengan menyimpan hasil submasalah dalam dictionary memo, dan melacak jalur optimal menggunakan dictionary parent.

Fungsi utama dp(current, visited) menghitung biaya minimum untuk menyelesaikan perjalanan dari kota current dengan status kunjungan visited, yang direpresentasikan dalam bentuk bitmask. Jika semua kota telah dikunjungi, fungsi mengembalikan jarak ke kota asal. Jika belum, algoritma mencoba semua kota yang belum dikunjungi, menghitung biaya total secara rekursif, dan memilih rute termurah.

Setelah seluruh biaya dihitung, algoritma merekonstruksi jalur optimal dari data parent. Kompleksitas waktunya adalah O(n² × 2ⁿ), dan ruang O(n × 2ⁿ).
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
0 10 15 20
5 0 9 10
6 13 0 12
8 8 9 0
```

**Output:**
```
============================================================
🚀 TRAVELING SALESMAN PROBLEM (TSP) SOLVER
📊 Menggunakan Dynamic Programming
============================================================

📋 Matriks Ketetanggaan:
      1   2   3   4
 1    0  10  15  20
 2    5   0   9  10
 3    6  13   0  12
 4    8   8   9   0

🔄 Memproses perhitungan TSP...
✅ Perhitungan selesai!

🎯 HASIL PERHITUNGAN TSP
========================================
📍 Jalur Optimal:
   1 → 2 → 3 → 4 → 1

💰 Total Biaya Minimum: 35

📊 Detail Perjalanan:
   Kota 1 → Kota 2
   Kota 2 → Kota 3
   Kota 3 → Kota 4
   Kota 4 → Kota 1
========================================

⏱️  Waktu eksekusi: 0.0012 detik
```

### Contoh 2: Graf 3 Kota Simetris

**Input:**
```
3
0 10 15
10 0 20
15 20 0
```

**Output:**
```
📍 Jalur Optimal: 1 → 2 → 3 → 1
💰 Total Biaya Minimum: 45
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

**Fungsi Utama:**
- **`tsp(distance:)`** - Implementasi algoritma TSP dengan DP
- **`dp(_:_:)`** - Fungsi rekursif untuk Dynamic Programming
- **`printMatrix(_:_:)`** - Menampilkan matriks ketetanggaan
- **`printResult(_:)`** - Menampilkan hasil perhitungan
- **`printHeader()`** - Header program

**Fungsi Utilitas:**
- **`readInt()`** - Membaca input integer
- **`readIntArray()`** - Membaca array integer
- **`main()`** - Fungsi utama program

**Data Structures:**
- **`memo`** - Dictionary untuk memoization
- **`parent`** - Dictionary untuk tracking path
- **`distance`** - Matriks ketetanggaan

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
