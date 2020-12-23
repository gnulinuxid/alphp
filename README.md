alphp 5.6
=========
alphp adalah [Apache](https://httpd.apache.org/) dan [PHP](https://www.php.net/) dalam sebuah wadah. Ini seperti [XAMPP](https://www.apachefriends.org/index.html), dengan keunggulan yaitu Apache dan pengguna tidak saling berebut perijinan. Tidak perlu selalu melakukan *chown* atau *chmod*. Karena alphp dipasang di direktori **/home/pengguna** bukan di **/opt**, dan dijalankan tanpa akses root.

Pemasangan
----------
Silahkan pilih versi yang sesuai:

**Lite**

Pengunduhan versi "lite" hanya 15MB. Berisi Apache 2.4, PHP 5, dan PHP 7.

    Sedang tidak diperbarui, silahkan unduh versi "full"

**Full**

Pengunduhan versi "full" sekitar 60MB. Berisi Apache 2.4, PHP 5, PHP 7, MariaDB dan [phpMyAdmin](https://github.com/gnulinuxid/phpmyadmin).

64 bit:

    $ wget https://github.com/gnulinuxid/alphp/releases/download/v5.6-full/alphp-5.6-x86_64.run
    $ sh alphp-5.6-x86_64.run
32 bit:

    $ wget https://github.com/gnulinuxid/alphp/releases/download/v5.6-full/alphp-5.6-x86.run
    $ sh alphp-5.6-x86.run

Setelah terpasang, jalankan dengan:

    $ alphp
Jika shortcut tidak terpasang, jalankan dengan:

    $ $HOME/.alphp/5.6/bin/alphp

Bantuan:

    $ alphp -h
Konfigurasi
-----------
File config ada di .alphp/5.6-full/[alphp.conf](5.6-full/alphp.conf)

Catatan
-------
Karena alphp *rootless*, tidak mendukung port dibawah 1024. Standarnya adalah 8080. Tetapi jika menginginkan port misal 80, bisa menggunakan port forwarding. Berikut contoh jika menggunakan [socat](https://linux.die.net/man/1/socat):

    # socat tcp-listen:80,reuseaddr,fork tcp:localhost:8080
- MySQL / MariaDB?

PHP di alphp ada ekstensi *mysqli* untuk konek ke server database (terpisah). Jika menginginkan LAMP Stack silahkan unduh alphp versi "full".

- Versi PHP

Saat ini menggunakan PHP 5.6 dan 7.2. Bisa berpindah versi dengan mudah. Untuk informasi ketik "alphp -h".

Screenshot
----------
![alphp](screenshot.png)

Video
-----
[ ![alphp 5.6 Control Panel](http://img.youtube.com/vi/eUPFi6URxkc/0.jpg) ](http://www.youtube.com/watch?v=eUPFi6URxkc)

Made in ![Indonesia](ID.png)
