# Project Optimasi Algorithmic Trading MT5

Repository ini dibuat untuk menyimpan *source code* dan hasil *backtest* dari tugas mata kuliah Sains Manajemen. Fokus utama dari project ini adalah melakukan evaluasi dan optimasi pada 20 Expert Advisor (EA) di MetaTrader 5 (MT5) untuk mencari strategi mana yang paling *profitable*.

## 🤖 Algoritma & Strategi yang Dipakai
Dari total 20 EA yang diuji, masing-masing dibangun menggunakan dasar algoritma dan indikator teknikal yang berbeda untuk menentukan titik *entry* dan *exit* otomatis. Beberapa algoritma dan strategi yang dipakai di dalam project ini meliputi:
- Momentum & Trend (MACD, Moving Average)
- Volatility (Bollinger Bands, ATR Trailing)
- Price Action Patterns (Inside Bar, Pin Bar, Engulfing)
- Trend Filtering (Heiken Ashi)
- Dan beberapa variasi indikator gabungan lainnya.

## ⚙️ Detail Pengujian
- **Platform:** MetaTrader 5
- **Pair & Timeframe:** EURUSD / H1
- **Metode Optimasi:** Fast Genetic Algorithm
- **Parameter Target:** Stop Loss (range 50 - 1000, step 50) & Take Profit (range 100 - 2000, step 50)

## 📂 Struktur Folder
- `Project_20_EA` : Kumpulan file asli dari ke-20 EA yang dipakai (.mq5 / .ex5).
- `Reports/` : File laporan Excel yang berisi perbandingan performa EA sebelum (Before) dan sesudah (After) proses optimasi parameter.
