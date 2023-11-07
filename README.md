
# Template LaTeX Laporan Proyek Akhir D4 Teknik Elektronika UNY

Repo ini berisi template LaTeX yang digunakan dalam penulisan Laporan Proyek Akhir mahasiswa D4 Teknik Elektronika UNY. Semua mahasiswa D4 Teknik Elektronika wajib menggunakan template LaTeX ini karena dengan menggunakan template ini penulisan laporan akan menjadi lebih cepat dengan format yang seragam sehingga mahasiswa dapat fokus pada konten dan tidak terkendala dengan format laporan yang kadang kala menjadi kendala tersendiri. Selain itu penyimpanan file laporan menjadi lebih mudah karena dapat di simpan di Github sehingga mudah untuk diakses.

## Changelog
- 16 Januari 2023: Pembuatan template dari Laporan Proyek Akhir
- 28 Februari 2023: Mengubah sub-bab dari Bab I Pendahuluan, Mengubah susunan daftar isi, Fix surat Pernyataan untuk judul yang panjang, Fix Halaman Pengesahan tidak 2 halaman, Menambahkan Halaman Persembahan
- 15 Juni 2023: Perbaikan format Halaman Pengesahan, Perbaikan contoh tabel, Penambahan hyperlink untuk gambar, tabel, dan persamaan pada bacaan berdasarkan label
- 22 Juni 2023: Perbaikan nama file untuk memudahkan idefitikasi
- 05 November 2023: Pemberian titik pada chapater di daftar isi, perbaikan hirarki penomoran
- 06 November 2023: Perbaikan susunan abstrak (3 paragraf), Perbaikan Abstrak 1 spasi dan Konten 2 spasi
- 07 November 2023: Perbaikan format, penggantian format daftar pustaka dari IEEE -> APA 7th, Menambahkan contoh penulisan code

## Penjelasan Isi File

Unduh repo ini dengan menggunakan git atau dengan klik Download Zip yang ada di pojok kanan atas dari repo ini. Terdapat beberapa file dalam repo ini, dan berikut adalah penjelasan dari masing-masing file:

        .
        ├──a0-identitas.tex            # file pertama yang harus diedit berisi identitas dari tugas akhir seperti judul, nama mahasiswa, dll
        ├──a1-database.hyphenate.tex   # berisi daftar kata yang perlu dipenggal
        ├──a2-abstrak.tex              # abstrak dalam bahasa indonesia
        ├──a3-abstract.tex             # abstrak dalam bahasa inggris
        ├──a4-persembahan.tex          # halaman persembahan, edit sesuai kebutuhan
        ├──a5-katapengantar.tex        # kata pengantar, edit sesuai kebutuhan
        ├──a6-daftarsingkatan.tex      # daftar singkatan dalam bentuk tabel, edit sesuai dengan penggunaan singkatan yang ada pada laporan
        ├──a7-pustaka.bib              # daftar referensi dalam format bib, untuk menggenerate bagian ini gunakan mendeley / zotero
        ├──a8-lampiran.tex             # daftar lampiran, edit sesuai dengan kebutuhan
        ├──b1-bab1.tex                 # bab 1
        ├──b2-bab2.tex                 # bab 2
        ├──b3-bab3.tex                 # bab 3
        ├──b4-bab4.tex                 # bab 4
        ├──b5-bab5.tex                 # bab 5
        ├──laporan.pdf                 # file laporan dalam format pdf
        ├──laporan.tex                 # file utama, jangan edit file ini 
        ├──README.md                   # file yang sedang anda baca
        ├──gambar                      # folder berisi file yang tidak boleh diedit 
                xx-daftar.tex               
                xx-daftarpustaka.tex        
                xx-pengesahan.tex           
                xx-pernyataan.tex           
                xx-persetujuan.tex          
                xx-preambles.tex            
                xx-sampul.tex               
                xx-sampuldalam.tex          
        ├──gambar                      # folder berisi gambar, copy gambar yang dimasukkan pada laporan kesini dalam format jpg/png
               gambar-kucing.jpg
               logo-uny.png
               screenshot-miktex.png
               screenshot-texstudio.png
        ├──kode                         # folder berisi kode program, simpan dengan format sesuai dengan bahasa pemrograman yang digunakan
               code_sample.cpp
               code_sample.ino
               code_sample.java
               code_sample.py

file yang diawali dengan nama xx- terlarang untuk diedit selain itu silahkan edit sesuai dengan kebutuhan.

## Petunjuk Penggunaan

### OverleafBrowser
Versi template overleaf dapat diklik pada link berikut https://www.overleaf.com/read/vvrrxrtfgwjg

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

## Pembuatan isi file bib (bibliography)
Pembuatan isi file bib (bibliography) dapat dilakukan dengan software Mendeley (download mendeley di https://www.mendeley.com/search/) atau Zoteor (download zotero di https://www.zotero.org/). Sebelum melakukan generate bib, pastikan format yang dipilih adalah format IEEE.

## Screenshot
![TexStudio on MacOS](gambar/screenshot-texstudio.png "TexStudio on MacOS")

## Catatan
Apabila ada pertanyaan dan konsultasi terkait template ini bisa tanyakan lewat email ke ardyseto@uny.ac.id

## Pengembang

- [@2black0](https://www.github.com/2black0)

