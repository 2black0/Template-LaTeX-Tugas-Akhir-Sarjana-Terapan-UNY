
# Template LaTeX Laporan Proyek Akhir D4 Teknik Elektronika UNY

Repo ini berisi template LaTeX yang digunakan dalam penulisan Laporan Proyek Akhir mahasiswa D4 Teknik Elektronika UNY. Semua mahasiswa D4 Teknik Elektronika wajib menggunakan template LaTeX ini karena dengan menggunakan template ini penulisan laporan akan menjadi lebih cepat dengan format yang seragam sehingga mahasiswa dapat fokus pada konten dan tidak terkendala dengan format laporan yang kadang kala menjadi kendala tersendiri. Selain itu penyimpanan file laporan menjadi lebih mudah karena dapat di simpan di Github sehingga mudah untuk diakses.

## Changelog
- 16 Januari 2023: Pembuatan template dari Laporan Proyek Akhir
- 28 Februari 2023: Mengubah sub-bab dari Bab I Pendahuluan, Mengubah susunan daftar isi, Fix surat Pernyataan untuk judul yang panjang, Fix Halaman Pengesahan tidak 2 halaman, Menambahkan Halaman Persembahan
- 15 Juni 2023: Perbaikan format Halaman Pengesahan, Perbaikan contoh tabel, Penambahan hyperlink untuk gambar, tabel, dan persamaan pada bacaan berdasarkan label
- 22 Juni 2023: Perbaikan nama file untuk memudahkan idefitikasi

## Penjelasan Isi File

Unduh repo ini dengan menggunakan git atau dengan klik Download Zip yang ada di pojok kanan atas dari repo ini. Terdapat beberapa file dalam repo ini, dan berikut adalah penjelasan dari masing-masing file:

    .
    ├── build                   # Compiled files (alternatively `dist`)
    ├── docs                    # Documentation files (alternatively `doc`)
    ├── src                     # Source files (alternatively `lib` or `app`)
    ├── test                    # Automated tests (alternatively `spec` or `tests`)
    ├── tools                   # Tools and utilities
    ├── LICENSE
    └── README.md

file yang diawali dengan nama xx- terlarang untuk diedit selain itu silahkan edit sesuai dengan kebutuhan.

## Petunjuk Penggunaan

### Overleaf - Browser
Versi template overleaf dapat diklik pada link berikut https://www.overleaf.com/latex/templates/template-laporan-tugas-akhir-sarjana-terapan-teknik-elektro-dan-elektronika-15062023/vpjkgjwzcdrv

### Windows / MacOS / Linux
1. Unduh dan Install MikTeX (https://miktex.org/download) sebagai distribusi dari LaTeX dan TeXstudio (https://www.texstudio.org/) sebagai editor untuk Sistem Operasi Windows, MacOS atau Linux
2. Apabila menggunakan sistem operasi MacOS **harus** pilih as Administrator saat menjalankan MikTex Console, untuk sistem operasi lain bisa next sesuai dgn tampilan saat instalasi
3. Pada MikTex Console pilih opsi _Always_ pada Installed on-the-fly seperti pada gambar berikut
![MikTeX Setup](gambar/screenshot-miktex.png "MikTeX Setup")
3. Unduh Repo ini dan extract, kemudian Open _laporan.tex_
4. Pada sisi kiri terdapat daftar file yang terkoneksi dengan _laporan.tex_, salah satunya adalah _identitas.tex_
5. Isi file _identitas.tex_ sesuai dengan data diri dan pembimbing kemudian simpan
6. edit file _abstrak.tex_, _abstract.tex_, _katapengantar.tex_, _bab1.tex_ hingga _bab5.tex_, _lampiran.tex_, dan _pustaka.bib_ sesuai dengan kebutuhan
7. Terdapat beberapa tutorial dalam _laporan.tex_ yang dapat dibaca pada _laporan.pdf_ seperti memasukkan gambar, membuat tabel, menuliskan persamaan, menuliskan sumber kode, dan membuat referensi dan sitasi
8. Pastikan komputer sudah terhubung dengan internet karena diperlukan beberapa paket yang diunduh secara otomatis, kemudian setelah semua selesai bisa klik tombol **run & view** maka dokumen LaTeX akan digenerate dan outputnya adalah _laporan.pdf_

## Screenshot
![TexStudio on MacOS](gambar/screenshot-texstudio.png "TexStudio on MacOS")

## Catatan
Apabila ada pertanyaan dan konsultasi terkait template ini bisa tanyakan lewat email ke ardyseto@uny.ac.id

## Pengembang

- [@2black0](https://www.github.com/2black0)

