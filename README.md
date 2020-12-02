alphp 5.6
=========
alphp adalah [Apache](https://httpd.apache.org/) dan [PHP](https://www.php.net/) dalam sebuah wadah. Ini seperti [XAMPP](https://www.apachefriends.org/index.html), dengan keunggulan yaitu Apache dan pengguna tidak saling berebut perijinan. Lupakan masalah perijinan. Terima kasih kepada [PRoot](https://proot-me.github.io/). alphp ditenagai oleh [Alpine Linux](https://alpinelinux.org/) (minirootfs), hanya 6MB.

Pemasangan
----------
Pengunduhan hanya 15MB. Silahkan pilih versi yang sesuai:

64 bit:

    $ wget https://github.com/gnulinuxid/alphp/releases/download/v5.6-1/alphp-5.6-x86_64.run
    $ chmod +x alphp-5.6-x86_64.run
    $ ./alphp-5.6-x86_64.run
32 bit:

    $ wget https://github.com/gnulinuxid/alphp/releases/download/v5.6-1/alphp-5.6-x86.run
    $ chmod +x alphp-5.6-x86.run
    $ ./alphp-5.6-x86.run

Setelah terpasang, jalankan dengan:

    $ alphp
Jika shortcut tidak terpasang, jalankan dengan:

    $ $HOME/.alphp/5.6/bin/alphp

Bantuan:

    $ alphp -h
Konfigurasi
-----------
File config ada di .alphp/5.6/[alphp.conf](5.6/alphp.conf)

Catatan
-------
Karena alphp *rootless*, tidak mendukung port dibawah 1024. Standarnya adalah 8080. Tetapi jika menginginkan port misal 80, bisa menggunakan port forwarding. Berikut contoh jika menggunakan [socat](https://linux.die.net/man/1/socat):

    # socat tcp-listen:80,reuseaddr,fork tcp:localhost:8080
- MySQL / MariaDB?

Saat ini belum disertakan, tetapi PHP di alphp ada ekstensi mysqli untuk konek ke server database (terpisah).

- Versi PHP

Saat ini menggunakan PHP 5.6 dan 7.2. Bisa berpindah versi dengan mudah. Untuk informasi ketik "alphp -h".

Screenshot
----------
![alphp](screenshot.png)
