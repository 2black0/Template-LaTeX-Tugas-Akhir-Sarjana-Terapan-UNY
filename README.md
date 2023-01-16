
# Template LaTeX Laporan Proyek Akhir D4 Teknik Elektronika UNY

Repo ini berisi template LaTeX yang digunakan dalam penulisan Laporan Proyek Akhir mahasiswa D4 Teknik Elektronika UNY. Semua mahasiswa D4 Teknik Elektronika wajib menggunakan template LaTeX ini karena dengan menggunakan template ini penulisan laporan akan menjadi lebih cepat dengan format yang seragam sehingga mahasiswa dapat fokus pada konten dan tidak terkendala dengan format laporan yang kadang kala menjadi kendala tersendiri. Selain itu penyimpanan file laporan menjadi lebih mudah karena dapat di simpan di Github sehingga mudah untuk diakses.

## Penjelasan Isi File

Unduh repo ini dengan menggunakan git atau dengan klik Download Zip yang ada di pojok kanan atas dari repo ini. Terdapat beberapa file dalam repo ini, dan berikut adalah penjelasan dari masing-masing file:

    .
    ├─e─ gambar                 # folder dimana semua gambar yang akan dimasukkan pada laporan disimpan, format gambar adalah jpg / png
    ├─── README.md              # file yang sedang anda baca ini
    ├─e─ abstract.tex           # abstrak bahasa inggris
    ├─e─ abstrak.tex            # abstrak bahasa indonesia
    ├─e─ bab1.tex               # bab 1 pendahuluan
    ├─e─ bab2.tex               # bab 2 tinjauan pustaka
    ├─e─ bab3.tex               # bab 3 desain dan implementasi
    ├─e─ bab4.tex               # bab 4 hasil dan pengujian
    ├─e─ bab5.tex               # bab 5 kesimpulan dan saran
    ├─── daftargambar.tex       # file untuk membuat daftar gambar
    ├─── daftarisi.tex          # file untuk membuat daftar isi
    ├─── daftarpustaka.tex      # file untuk membuat daftar pustaka
    ├─e─ daftarsingkatan.tex    # file untuk membuat daftar singkatan
    ├─── daftartabel.tex        # file untuk membuat daftar tabel
    ├─e─ database.hyphenate.tex # file untuk membuat daftar kata yang terpotong / hypehenate
    ├─e─ identitas.tex          # identitas dari penulis, dll
    ├─e─ katapengantar.tex      # kata pengantar
    ├─e─ lampiran1.tex          # lampiran A
    ├─e─ lampiran2.tex          # lampiran B
    ├─── laporan.pdf            # file pdf hasil generate
    ├─e─ laporan.tex            # file utama
    ├─── pengesahan.tex         # halaman pengesahan
    ├─── pernyataan.tex         # surat pernyataan
    ├─── persetujuan.tex        # lembar persetujuan
    ├─e─ pustaka.bib            # daftar referensi
    ├─── sampul.tex             # sampul luar
    ├─── sampuldalam.tex        # sampul dalam

pada file dengan tanda -e- di atas adalah file yang diperkenankan untuk diedit, sedangkan yang tidak ada -e- dilarang untuk diedit.

## Petunjuk Penggunaan

### Overleaf - Browser
Versi template overleaf masih on going, setelah approved akan diupdate

### Windows / MacOS / Linux
1. Unduh dan Install MikTeX (https://miktex.org/download) dan TeXstudio (https://www.texstudio.org/) untuk Sistem Operasi Windows, MacOS atau Linux
2. Apabila menggunakan sistem operasi MacOS **harus** pilih as Administrator saat menjalankan MikTex Console, untuk sistem operasi lain bisa next sesuai dgn tampilan saat instalasi
3. Pada MikTex Console pilih opsi _Always_ pada Installed on-the-fly seperti pada gambar berikut
![MikTeX Setup](gambar/screenshot-miktex.png "MikTeX Setup")
3. Unduh Repo ini dan extract, kemudian Open _laporan.tex_
4. Pada sisi kiri terdapat daftar file yang terkoneksi dengan _laporan.tex_, salah satunya adalah _identitas.tex_
5. Isi file _identitas.tex_ sesuai dengan data diri dan pembimbing kemudian simpan
6. edit file _abstrak.tex_, _abstract.tex_, _katapengantar.tex_, _bab1.tex_ hingga _bab5.tex_, _lampiran.tex_, dan _pustaka.bib_ sesuai dengan kebutuhan
7. Terdapat beberapa tutorial dalam _laporan.tex_ yang dapat dibaca pada _laporan.pdf_ seperti memasukkan gambar, membuat tabel, menuliskan persamaan, menuliskan sumber kode, dan membuat referensi dan sitasi
7. Pastikan komputer sudah terhubung dengan internet karena diperlukan beberapa paket yang diunduh secara otomatis, kemudian setelah semua selesai bisa klik tombol **run & view** maka dokumen LaTeX akan digenerate dan outputnya adalah _laporan.pdf_

## Screenshot
![TexStudio on MacOS](gambar/screenshot-texstudio.png "TexStudio on MacOS")

## Catatan
Apabila ada pertanyaan dan konsultasi terkait template ini bisa tanyakan lewat email ke ardyseto@uny.ac.id

## Pengembang

- [@2black0](https://www.github.com/2black0)

