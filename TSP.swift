import Foundation

let INF = Int.max / 2

func readInt() -> Int {
    guard let line = readLine(), let val = Int(line.trimmingCharacters(in: .whitespaces)) else {
        fatalError("Input tidak valid")
    }
    return val
}

func readIntArray() -> [Int] {
    guard let line = readLine() else {
        fatalError("Input tidak valid")
    }
    return line.split(separator: " ").compactMap { Int($0) }
}

func printHeader() {
    print("=" * 60)
    print("🚀 TRAVELING SALESMAN PROBLEM (TSP) SOLVER")
    print("📊 Menggunakan Dynamic Programming")
    print("=" * 60)
}

func printMatrix(_ matrix: [[Int]], _ n: Int) {
    print("\n📋 Matriks Ketetanggaan:")
    print("   ", terminator: "")
    for i in 0..<n {
        print(String(format: "%4d", i + 1), terminator: "")
    }
    print("")
    
    for i in 0..<n {
        print(String(format: "%2d ", i + 1), terminator: "")
        for j in 0..<n {
            if matrix[i][j] == INF {
                print("  ∞ ", terminator: "")
            } else {
                print(String(format: "%4d", matrix[i][j]), terminator: "")
            }
        }
        print("")
    }
    print("")
}

func printResult(_ result: (cost: Int, path: [Int])) {
    print("🎯 HASIL PERHITUNGAN TSP")
    print("=" * 40)
    
    print("📍 Jalur Optimal:")
    let pathStr = result.path.map { String($0) }.joined(separator: " → ")
    print("   \(pathStr)")
    
    print("\n💰 Total Biaya Minimum: \(result.cost)")
    print("\n📊 Detail Perjalanan:")
    for i in 0..<(result.path.count - 1) {
        let from = result.path[i]
        let to = result.path[i + 1]
        print("   Kota \(from) → Kota \(to)")
    }
    print("=" * 40)
}

func tsp(distance: [[Int]]) -> (cost: Int, path: [Int]) {
    let n = distance.count
    var memo = [String: Int]()
    var parent = [String: Int]()
    
    func f(_ i: Int, _ S: Set<Int>) -> Int {
        if S.isEmpty {
            return distance[i-1][0]
        }
        
        let key = "\(i),\(S.sorted())"
        if let val = memo[key] {
            return val
        }
        
        var minCost = INF
        var bestNext = -1
        
        for j in S {
            let newS = S.subtracting([j])
            let cost = distance[i-1][j-1] + f(j, newS)
            if cost < minCost {
                minCost = cost
                bestNext = j
            }
        }
        
        memo[key] = minCost
        parent[key] = bestNext
        return minCost
    }
    
    print("🔄 Memproses perhitungan TSP menggunakan f(i, S)...")
    
    var minTotalCost = INF
    var firstNext = -1
    
    for k in 2...n {
        let S = Set((2...n).filter { $0 != k })
        let cost = distance[0][k-1] + f(k, S)
        if cost < minTotalCost {
            minTotalCost = cost
            firstNext = k
        }
    }
    
    var path = [1]
    var current = firstNext
    var remaining = Set((2...n).filter { $0 != firstNext })
    
    path.append(current)
    
    while !remaining.isEmpty {
        let key = "\(current),\(remaining.sorted())"
        guard let next = parent[key] else { break }
        path.append(next)
        remaining.remove(next)
        current = next
    }
    
    path.append(1)
    
    return (minTotalCost, path)
}

extension String {
    static func * (string: String, count: Int) -> String {
        return String(repeating: string, count: count)
    }
}

func main() {
    printHeader()
    print("🔢 Masukkan jumlah kota (minimal 2):")
    print("   Contoh: 4")
    print("   Input jumlah kota: ", terminator: "")
    
    let n = readInt()
    
    if n < 2 {
        print("❌ Error: Minimal harus ada 2 kota!")
        return
    }
    
    if n > 20 {
        print("⚠️  Peringatan: Jumlah kota > 20 dapat membutuhkan waktu komputasi yang lama.")
    }
    
    print("\n📊 Masukkan matriks ketetanggaan (\(n)×\(n)):")
    print("   • Masukkan \(n) baris")
    print("   • Setiap baris berisi \(n) angka dipisahkan spasi")
    print("   • Diagonal utama (jarak kota ke dirinya) = 0")
    print("   • Gunakan angka positif untuk jarak antar kota")
    print("")
    print("   Contoh untuk \(n) kota:")
    if n == 3 {
        print("   0 10 15")
        print("   10 0 20")
        print("   15 20 0")
    } else if n == 4 {
        print("   0 10 15 20")
        print("   5 0 9 10")
        print("   6 13 0 12")
        print("   8 8 9 0")
    } else {
        print("   0 [jarak ke kota 2] [jarak ke kota 3] ...")
        print("   [jarak dari kota 2] 0 [jarak ke kota 3] ...")
        print("   ... dst")
    }
    print("")
    print("🖊️  Silakan masukkan matriks:")
    print("   Input dibawah ini:")
    
    var distance = [[Int]]()
    
    for i in 0..<n {
        guard let line = readLine() else {
            print("❌ Error: Input tidak valid pada baris \(i + 1)")
            return
        }
        
        let row = line.split(separator: " ").compactMap { Int($0.trimmingCharacters(in: .whitespaces)) }
        
        if row.count != n {
            print("❌ Error: Baris \(i + 1) harus memiliki \(n) elemen, tetapi diberikan \(row.count)")
            return
        }
        
        for j in 0..<n {
            if row[j] < 0 {
                print("❌ Error: Jarak tidak boleh negatif! Ditemukan \(row[j]) pada posisi (\(i + 1), \(j + 1))")
                return
            }
        }
        
        distance.append(row)
    }
    
    print("\n🔍 Memverifikasi matriks...")
    var hasWarning = false
    
    for i in 0..<n {
        if distance[i][i] != 0 {
            print("⚠️  Peringatan: Jarak dari kota \(i + 1) ke dirinya sendiri bukan 0 (nilai: \(distance[i][i]))")
            hasWarning = true
        }
    }
    
    var isSymmetric = true
    for i in 0..<n {
        for j in 0..<n {
            if distance[i][j] != distance[j][i] {
                isSymmetric = false
                break
            }
        }
        if !isSymmetric { break }
    }
    
    if !isSymmetric {
        print("ℹ️  Info: Matriks tidak simetris (jarak A→B ≠ B→A)")
    }
    
    if !hasWarning {
        print("✅ Matriks valid!")
    }
    
    printMatrix(distance, n)
    
    let startTime = Date()
    let result = tsp(distance: distance)
    let endTime = Date()
    let executionTime = endTime.timeIntervalSince(startTime)
    
    print("✅ Perhitungan selesai!")
    printResult(result)
    
    print("\n⏱️  Waktu eksekusi: \(String(format: "%.4f", executionTime)) detik")
    print("\n🎉 TSP Solver dengan Dynamic Programming!")
    print("=" * 60)
}

main()