
# Template LaTeX Laporan Proyek Akhir D4 Teknik Elektronika UNY

Repo ini berisi template LaTeX yang digunakan dalam penulisan Laporan Proyek Akhir mahasiswa D4 Teknik Elektronika UNY. Semua mahasiswa D4 Teknik Elektronika wajib menggunakan template LaTeX ini karena dengan menggunakan template ini penulisan laporan akan menjadi lebih cepat dengan format yang seragam sehingga mahasiswa dapat fokus pada konten dan tidak terkendala dengan format laporan yang kadang kala menjadi kendala tersendiri. Selain itu penyimpanan file laporan menjadi lebih mudah karena dapat di simpan di Github sehingga mudah untuk diakses.

## Catatan Perubahan

- 16 Januari 2023: Pembuatan template dari Laporan Proyek Akhir
- 28 Februari 2023: Mengubah sub-bab dari Bab I Pendahuluan, Mengubah susunan daftar isi, Fix surat Pernyataan untuk judul yang panjang, Fix Halaman Pengesahan tidak 2 halaman, Menambahkan Halaman Persembahan
- 15 Juni 2023: Perbaikan format Halaman Pengesahan, Perbaikan contoh tabel, Penambahan hyperlink untuk gambar, tabel, dan persamaan pada bacaan berdasarkan label
- 22 Juni 2023: Perbaikan nama file untuk memudahkan idefitikasi
- 05 November 2023: Pemberian titik pada chapater di daftar isi, perbaikan hirarki penomoran
- 06 November 2023: Perbaikan susunan abstrak (3 paragraf), Perbaikan Abstrak 1 spasi dan Konten 2 spasi
- 07 November 2023: Perbaikan format pada beberapa bagian, penggantian format daftar pustaka dari IEEE -> APA 7th, Menambahkan contoh penulisan code beserta penomorannya, menambahkan contoh penulisan persamaan
- 08 November 2023: Pengisian contoh isi Lampiran, Perbaikan contoh gambar dan tabel dan daftar singkatan
- 12 November 2023: Penambahan contoh sumber daftar pustaka (artikel, prosiding, buku)
- 06 Juni 2024: Update opsi bibliographystyle untuk overleaf agar tidak error (pada file xx-preambles.tex, baris 129, \bibliographystyle{**newapa**} % ganti newapa dengan apalike apabila menggunakan overleaf)
- 07 Juni 2024: Menambahkan tutorial mengedit LaTeX pada overleaf.com di readme
- 27 Juli 2024: mengganti penulisan sitasi APA Narrative citation (\cite{}) ke Parenthetical citation (\citep{}). Source: https://gking.harvard.edu/files/natnotes2.pdf
- 01 Agutus 2024: Perbaikan judul dari BAB
- 07 November 2024: Perbaikan preamble, Penambahan lembar pengesahan untuk Seminar Proposal TA, dan perbaikan format
- 11 Desember 2024: Penambahan README terkait instalasi pada MacOS
- 18 Desember 2024: Penambahan pemilihan Proposal atau Laporan yang dapat dipilih pada \newcommand{\Jenis}{Laporan} atau \newcommand{\Jenis}{Proposal} pada file laporan.tex. Penambahan contoh penggunaan Tikz untuk gambar / grafik

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

## Pengaturan Proposal / Laporan Tugas Akhir
Perlu diketahui bahwa template ini dapat digunakan untuk pembuatan Proposal dan Laporan Tugas Akhir, namun untuk menggenerate Proposal atau Laporan perlu dipilih melalui file `laporan.tex` pada baris 12 dan 13 dan berikan tanda % untuk menutup salah satu yang tidak diinginkan:
```
%\newcommand{\Jenis}{Proposal} %Pilih salah satu antara Proposal atau Laporan
\newcommand{\Jenis}{Laporan} %Pilih salah satu antara Proposal atau Laporan
```

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

## Petunjuk Instalasi Penggunaan Secara Lokal
1. Unduh dan Install MikTeX (https://miktex.org/download) sebagai distribusi dari LaTeX (pilih sesuai sistem operasi yang digunakan), catatan bagi pengguna Windows **Wajib Memilih for All User** saat proses instalasi serta pilih opsi _Always_ pada Installed on-the-fly
2. Unduh dan Install TeXstudio (https://www.texstudio.org/) sebagai editor untuk Sistem Operasi Windows, MacOS atau Linux
3. Sebelum unduh repo ini pastikan telah mengupdate semua paket yang ada pada MikTex Console kemudian unduh Repo ini dan extract, kemudian Open _laporan.tex_ pada TexStudio
4. Pada sisi kiri terdapat daftar file yang berada dalam folder kemudian edit file sesuai dengan kebutuhan
5. Terdapat beberapa contoh dalam _laporan.tex_ yang dapat dibaca pada _laporan.pdf_ seperti memasukkan gambar, membuat tabel, menuliskan persamaan, menuliskan sumber kode, dan membuat referensi dan sitasi
6. Pastikan komputer sudah terhubung dengan internet karena diperlukan beberapa paket yang diunduh secara otomatis, kemudian setelah semua selesai bisa klik tombol **build & view** maka dokumen LaTeX akan digenerate dan outputnya adalah _laporan.pdf_ yang berada di sisi kanan

## Petunjuk Instalasi (MacOS) Penggunaan Secara Lokal - Alternatif
source: `https://sudorealm.com/blog/how-to-write-latex-documents-with-visual-studio-code-on-mac`
1. Install Brew
> /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
2. Install MacTex
> brew install --cask mactex-no-gui
3. Update Path Zsh / Bash
> eval "$(/usr/libexec/path_helper)"
4. Update LaTeX
> sudo tlmgr update --self
> sudo tlmgr update --all
5. Konfigurasi Path
cek apakah ada tlmgr pada folder ini
>  ls /usr/local/texlive/2024/bin/universal-darwin
kemudian tambahkan path ke zsh / bash
> nano ~/.zshrc
atau
> nano ~/.bashrc
kemudian tambahkan path ke zsh / bash
> export PATH="/usr/local/texlive/2024/bin/universal-darwin:$PATH"
simpan, keluar dan reload ulang dengan perintah
> source ~/.zshrc
6. Install Visual Studio Code dan Addons Latex Workshop
7. Visual Studio Code dapat digunakan untuk menulis dengan format LaTeX, build dan view.

## Petunjuk Penggunaan Secara Online (via Overleaf)
Cara ini adalah yang paling praktis, karena tidak perlu menginstall aplikasi apapun ke Laptop / Komputer. Cukup membuka browser sudah dapat melakukan proses edit file LaTeX secara langsung.
Buka website overleaf.com dan register kemudian login. Klik new project dan upload file zip dari project ini. Silahkan edit sesuai kebutuhan.
![TexStudio on MacOS](gambar/screenshot-overleaf.png "Editing LaTeX on Overleaf")

## Pembuatan isi file bib (bibliography)
Pembuatan isi file bib (bibliography) dapat dilakukan dengan software Mendeley (https://www.mendeley.com/search/) atau Zotero (https://www.zotero.org/). Selain itu sangat direkomendasikan menggunakan JabRef (https://www.jabref.org/).

## Screenshot
![TexStudio on MacOS](gambar/screenshot-texstudio-macos.png "TexStudio on MacOS")

![TexStudio on Windows](gambar/screenshot-texstudio-windows.png "TexStudio on Windows")

## Catatan
Apabila ada pertanyaan dan konsultasi terkait template ini bisa tanyakan lewat email ke ardyseto@uny.ac.id

## Pengembang

- [@2black0](https://www.github.com/2black0)

