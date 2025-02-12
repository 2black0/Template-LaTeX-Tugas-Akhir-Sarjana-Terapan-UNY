
# Template LaTeX Laporan Proyek Akhir D4 Teknik Elektronika UNY

Repo ini berisi template LaTeX yang digunakan untuk penulisan Proposal dan Laporan Tugas Akhir mahasiswa D4 Teknik Elektronika Universitas Negeri Yogyakarta (UNY). Template ini dirancang untuk mempermudah mahasiswa dalam menulis laporan dengan format yang seragam dan sesuai dengan standar yang ditetapkan oleh program studi.

Dengan menggunakan template ini, mahasiswa dapat fokus pada konten laporan tanpa perlu khawatir tentang format penulisan. Template ini juga mendukung penyimpanan dan kolaborasi melalui GitHub, sehingga memudahkan akses dan pengelolaan dokumen.

## Fitur Utama

- **Format Standar**: Template ini mengikuti format penulisan yang telah ditetapkan oleh program studi D4 Teknik Elektronika UNY.
- **Kemudahan Penggunaan**: Template ini dirancang agar mudah digunakan oleh mahasiswa, dengan dokumentasi yang jelas dan contoh-contoh yang dapat diikuti.
- **Dukungan Gambar dan Kode**: Template ini mendukung penyertaan gambar dan kode program dalam berbagai format.
- **Referensi dan Sitasi**: Template ini mendukung pembuatan referensi dan sitasi dengan mudah menggunakan BibTeX.
- **Kompilasi Mudah**: Template ini dapat dikompilasi dengan mudah menggunakan perintah `pdflatex` dan `bibtex`.


## Catatan Perubahan

### 2024
- **24 Desember 2024**: 
  - Perbaikan penomoran persamaan yang awalnya (1.1) menjadi 1.1 tanpa tanda kurung ().
  - Ketika persamaan dimention akan menghasilkan "persamaan 1.1" dimana sebelumnya hanya "1.1" saja.
- **18 Desember 2024**: 
  - Penambahan pemilihan Proposal atau Laporan yang dapat dipilih pada `\newcommand{\Jenis}{Laporan}` atau `\newcommand{\Jenis}{Proposal}` pada file `laporan.tex`.
  - Penambahan contoh penggunaan Tikz untuk gambar / grafik.
- **11 Desember 2024**: 
  - Penambahan README terkait instalasi pada MacOS.
- **07 November 2024**: 
  - Perbaikan preamble.
  - Penambahan lembar pengesahan untuk Seminar Proposal TA.
  - Perbaikan format.
- **01 Agustus 2024**: 
  - Perbaikan judul dari BAB.
- **27 Juli 2024**: 
  - Mengganti penulisan sitasi APA Narrative citation (`\cite{}`) ke Parenthetical citation (`\citep{}`).
  - Source: [Harvard Notes](https://gking.harvard.edu/files/natnotes2.pdf).
- **07 Juni 2024**: 
  - Menambahkan tutorial mengedit LaTeX pada overleaf.com di README.
- **06 Juni 2024**: 
  - Update opsi bibliographystyle untuk overleaf agar tidak error (pada file `xx-preambles.tex`, baris 129, `\bibliographystyle{**newapa**}` ganti `newapa` dengan `apalike` apabila menggunakan overleaf).

### 2023
- **12 November 2023**: 
  - Penambahan contoh sumber daftar pustaka (artikel, prosiding, buku).
- **08 November 2023**: 
  - Pengisian contoh isi Lampiran.
  - Perbaikan contoh gambar dan tabel serta daftar singkatan.
- **07 November 2023**: 
  - Perbaikan format pada beberapa bagian.
  - Penggantian format daftar pustaka dari IEEE ke APA 7th.
  - Menambahkan contoh penulisan kode beserta penomorannya.
  - Menambahkan contoh penulisan persamaan.
- **06 November 2023**: 
  - Perbaikan susunan abstrak (3 paragraf).
  - Perbaikan Abstrak 1 spasi dan Konten 2 spasi.
- **05 November 2023**: 
  - Pemberian titik pada chapter di daftar isi.
  - Perbaikan hirarki penomoran.
- **22 Juni 2023**: 
  - Perbaikan nama file untuk memudahkan identifikasi.
- **15 Juni 2023**: 
  - Perbaikan format Halaman Pengesahan.
  - Perbaikan contoh tabel.
  - Penambahan hyperlink untuk gambar, tabel, dan persamaan pada bacaan berdasarkan label.
- **28 Februari 2023**: 
  - Mengubah sub-bab dari Bab I Pendahuluan.
  - Mengubah susunan daftar isi.
  - Fix surat Pernyataan untuk judul yang panjang.
  - Fix Halaman Pengesahan tidak 2 halaman.
  - Menambahkan Halaman Persembahan.
- **16 Januari 2023**: 
  - Pembuatan template dari Laporan Proyek Akhir.

## Penjelasan Isi File

Clone repo ini dengan menggunakan git clone atau unduh dengan klik Download Zip yang ada di pojok kanan atas dari repo ini. Terdapat beberapa file dalam repo ini, dan berikut adalah penjelasan dari masing-masing file:

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
        ├──b6-bab6.tex                 # bab 6 HANYA BERISI TUTORIAL PENULISAN PADA LATEX
        ├──laporan.pdf                 # file laporan dalam format pdf
        ├──laporan.tex                 # file utama, jangan edit file ini 
        ├──README.md                   # file yang sedang anda baca
        ├──untouch                     # folder berisi file yang tidak boleh diedit 
                xx-daftar.tex               
                xx-daftarpustaka.tex        
                xx-pengesahan.tex           
                xx-pernyataan.tex           
                xx-persetujuan-proposal.tex
                xx-persetujuan-ujian.tex             
                xx-preambles.tex            
                xx-sampul-proposal.tex               
                xx-sampuldalam-proposal.tex
                xx-sampul-laporan.tex               
                xx-sampuldalam-laporan.tex            
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

## Petunjuk Instalasi Penggunaan Secara Lokal - Windows
1. Unduh dan Install MikTeX (https://miktex.org/download) sebagai distribusi dari LaTeX (pilih sesuai sistem operasi yang digunakan), catatan bagi pengguna Windows **Wajib Memilih for All User** saat proses instalasi serta pilih opsi _Always_ pada Installed on-the-fly
2. Unduh dan Install TeXstudio (https://www.texstudio.org/) sebagai editor untuk Sistem Operasi Windows, MacOS atau Linux
3. Sebelum unduh repo ini pastikan telah mengupdate semua paket yang ada pada MikTex Console kemudian unduh Repo ini dan extract, kemudian Open _laporan.tex_ pada TexStudio
4. Pada sisi kiri terdapat daftar file yang berada dalam folder kemudian edit file sesuai dengan kebutuhan
5. Terdapat beberapa contoh dalam _laporan.tex_ yang dapat dibaca pada _laporan.pdf_ seperti memasukkan gambar, membuat tabel, menuliskan persamaan, menuliskan sumber kode, dan membuat referensi dan sitasi
6. Pastikan komputer sudah terhubung dengan internet karena diperlukan beberapa paket yang diunduh secara otomatis, kemudian setelah semua selesai bisa klik tombol **build & view** maka dokumen LaTeX akan digenerate dan outputnya adalah _laporan.pdf_ yang berada di sisi kanan

## Petunjuk Instalasi (MacOS) Penggunaan Secara Lokal - Alternatif
source: `https://sudorealm.com/blog/how-to-write-latex-documents-with-visual-studio-code-on-mac`
1. Install Brew
``` 
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
2. Install MacTex
```
brew install --cask mactex-no-gui
``` 
3. Update Path Zsh / Bash
``` 
eval "$(/usr/libexec/path_helper)"
``` 
4. Update LaTeX
``` 
sudo tlmgr update --self
sudo tlmgr update --all
``` 
5. Konfigurasi Path
cek apakah ada tlmgr pada folder ini
``` 
ls /usr/local/texlive/2024/bin/universal-darwin
``` 
kemudian tambahkan path ke zsh / bash
``` 
nano ~/.zshrc
``` 
atau
``` 
nano ~/.bashrc
``` 
kemudian tambahkan path ke zsh / bash
``` 
export PATH="/usr/local/texlive/2024/bin/universal-darwin:$PATH"
``` 
simpan, keluar dan reload ulang dengan perintah
``` 
source ~/.zshrc
``` 
6. Install Visual Studio Code dan Addons Latex Workshop
7. Setelah itu buka VSCode dan tekan Shift + Ctrl + P (Windows) atau Shift + Cmd + P (macOS) untuk melihat seluruh perintah dan pilih "Open User Settings JSON" kemudian tambahkan kode berikut
<details>
<summary>Klik untuk buka kode JSON</summary>

```json
"latex-workshop.latex.tools": [
 {
  "name": "latexmk",
  "command": "latexmk",
  "args": [
   "-synctex=1",
   "-interaction=nonstopmode",
   "-file-line-error",
   "-pdf",
   "-outdir=%OUTDIR%",
   "%DOC%"
  ],
  "env": {}
 },
 {
  "name": "xelatex",
  "command": "xelatex",
  "args": [
   "-synctex=1",
   "-interaction=nonstopmode",
   "-file-line-error",
   "%DOC%"
  ],
  "env": {}
 },
 {
  "name": "pdflatex",
  "command": "pdflatex",
  "args": [
   "-synctex=1",
   "-interaction=nonstopmode",
   "-file-line-error",
   "%DOC%"
  ],
  "env": {}
 },
 {
  "name": "bibtex",
  "command": "bibtex",
  "args": [
   "%DOCFILE%"
  ],
  "env": {}
 }
],
"latex-workshop.latex.recipes": [
 {
  "name": "pdfLaTeX",
  "tools": [
   "pdflatex"
  ]
 },
 {
  "name": "latexmk 🔃",
  "tools": [
   "latexmk"
  ]
 },
 {
  "name": "xelatex",
  "tools": [
   "xelatex"
  ]
 },
 {
  "name": "pdflatex ➞ bibtex ➞ pdflatex`×2",
  "tools": [
   "pdflatex",
   "bibtex",
   "pdflatex",
   "pdflatex"
  ]
 },
 {
 "name": "xelatex ➞ bibtex ➞ xelatex`×2",
 "tools": [
   "xelatex",
   "bibtex",
   "xelatex",
   "xelatex"
  ]
 }
]
```
</details>

8. Visual Studio Code dapat digunakan untuk menulis dengan format LaTeX

## Langkah Pengerjaan
1. Edit file `a0-identitas.tex` dengan mengisi judul, nama mahasiswa, nim, dosen pembimbing, dan lain-lain sesuai kebutuhan
2. Edit file `b1-bab1.tex` sampai `b5-bab5.tex` dengan mengisi konten laporan sesuai dengan bab yang diinginkan. Jangan lupa hapus atau exclude file `b6-bab6.tex` pada `laporan.tex`
3. Edit file `a7-pustaka.bib` dengan mengisi daftar pustaka
4. Edit file `a8-lampiran.tex` dengan mengisi daftar lampiran
5. Edit file `a5-katapengantar.tex`, `a6-daftarsingkatan.tex`, `a4-persembahan.tex`, `a2-abstrak.tex` dan `a3-abstract.tex` sesuai kebutuhan

## Pengaturan Proposal / Laporan Tugas Akhir
Perlu diketahui bahwa template ini dapat digunakan untuk pembuatan Proposal dan Laporan Tugas Akhir, namun untuk menggenerate Proposal atau Laporan perlu dipilih melalui file `laporan.tex` pada baris 12 dan 13 dan berikan tanda % untuk menutup salah satu yang tidak diinginkan:
```
%\newcommand{\Jenis}{Proposal} %Pilih untuk Penulisan Proposal
\newcommand{\Jenis}{Laporan} %Pilih untuk Penulisan Laporan
```

## Pembuatan isi file bib (bibliography)
Pembuatan isi file bib (bibliography) dapat dilakukan dengan software Mendeley (https://www.mendeley.com/search/) atau Zotero (https://www.zotero.org/). Selain itu sangat direkomendasikan menggunakan JabRef (https://www.jabref.org/).

## Video Tutorial
1. Tutorial LaTeX 1 - Penggunaan Template untuk Penulisan Laporan Tugas Akhir D4 Teknik Elektronika UNY
[![Tutorial LaTeX 1 - Penggunaan Template untuk Penulisan Laporan Tugas Akhir D4 Teknik Elektronika UNY](https://i.ytimg.com/vi/lnPTVrOGB90/hqdefault.jpg)](https://www.youtube.com/watch?v=lnPTVrOGB90)

1. Tutorial LaTeX 2 - Penulisan Isi pada Template LaTeX
[![Tutorial LaTeX 2 - Penulisan Isi pada Template LaTeX](https://i.ytimg.com/vi/4Qk_2pknhsM/hqdefault.jpg)](https://www.youtube.com/watch?v=4Qk_2pknhsM)

1. Tutorial Latex 3 - Penambahan Gambar dan Tabel
[![Tutorial Latex 3 - Penambahan Gambar dan Tabel](https://i.ytimg.com/vi/oxY1mbZgv94/hqdefault.jpg)](https://www.youtube.com/watch?v=oxY1mbZgv94)

1. Tutorial LaTeX 4 - Pembuatan Daftar Pustaka dan Sitasi
[![Tutorial LaTeX 4 - Pembuatan Daftar Pustaka dan Sitasi](https://i.ytimg.com/vi/goq-IS4WJW4/hqdefault.jpg)](https://www.youtube.com/watch?v=goq-IS4WJW4)

1. Tutorial LaTeX 5 - Penulisan Kode Program pada LaTeX
[![Tutorial LaTeX 5 - Penulisan Kode Program pada LaTeX](https://i.ytimg.com/vi/JeSJ0mYfxA0/hqdefault.jpg)](https://www.youtube.com/watch?v=JeSJ0mYfxA0)

6. Workshop Lengkap Penulisan Proposal dan Laporan dengan LaTeX
[![Workshop Lengkap Penulisan Proposal dan Laporan dengan LaTeX](https://i.ytimg.com/vi/anMLRydjDOE/hqdefault.jpg)](https://www.youtube.com/watch?v=anMLRydjDOE)

## Screenshot
![TexStudio on MacOS](gambar/screenshot-texstudio-macos.png "TexStudio on MacOS")

![TexStudio on Windows](gambar/screenshot-texstudio-windows.png "TexStudio on Windows")

## Lisensi
Template ini dilisensikan di bawah MIT License.

## Kontribusi
Kontribusi sangat diterima. Silakan buat pull request atau buka issue untuk perbaikan atau penambahan fitur.

## Kontak
Unutuk pertanyaan lebih lanjut, silahkan hubungi [@2black0](https://www.github.com/2black0) atau email ardyseto@uny.ac.id

