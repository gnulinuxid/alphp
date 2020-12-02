export APACHE_CONF_CUSTOM=/etc/apache2/conf.d/custom.conf
export APACHE_LOG_DIR=/var/log/apache2
export APACHE_LOG_ACCESS="$APACHE_LOG_DIR/access.log"
export APACHE_LOG_ERROR="$APACHE_LOG_DIR/error.log"
export APACHE_PID_FILE=/run/apache2/httpd.pid

printf "Memulai Apache HTTP Server"

pid=$( pgrep -o httpd )
if [ -n "$pid" ]; then
    echo "$pid" > $APACHE_PID_FILE
    echo "httpd (pid $pid) sudah berjalan" > $APACHE_LOG_ERROR
    [ -f $APACHE_CONF_CUSTOM ] && PHP_VERSION=$( grep -o '/php-cgi[5-7]' $APACHE_CONF_CUSTOM | sed 's/[^5-7]//g' )
else
    echo "# Jangan mengedit file ini, dibuat oleh .profile" > $APACHE_CONF_CUSTOM
    cat <<EOL >> $APACHE_CONF_CUSTOM
DocumentRoot $DOCUMENT_ROOT
Listen $APACHE_PORT
ServerName $HOST:$APACHE_PORT
AddHandler php-script .php
Action php-script /cgi-bin/php-cgi$PHP_VERSION
EOL
    ( httpd -k start > $APACHE_LOG_ERROR 2>&1 & )
fi

while [ ! -s $APACHE_LOG_ERROR ]; do
    printf "."
    sleep .1
done

trap '. $HOME/.logout; exit' 0

if pidof -s httpd > /dev/null 2>&1; then
    if [ -n "$pid" ]; then
        info="Jika terjadi konflik, coba: kill $pid"
    else
        info=$( printf '%s\e[1;32m%s\e[0m%s' "[" "OK" "] Server $HOST telah berhasil dimulai di Port $APACHE_PORT" )
        info=$( echo "$info"; php-cgi"$PHP_VERSION" -v )
    fi
else
    info=$( printf '%s\e[1;31m%s\e[0m%s' "[" "Error" "] Terjadi kesalahan!" )
fi

cat <<EOL

         _         _              _____     __  
        | |       | |            | ____|   / /  
   __ _ | | _ __  | |__   _ __   | |__    / /_  
  / _\` || || '_ \ | '_ \ | '_ \  |___ \  | '_ \ 
 | (_| || || |_) || | | || |_) |  ___) |_| (_) |
  \__,_||_|| .__/ |_| |_|| .__/  |____/(_)\___/ 
           | |           | |                    
           |_|           |_|                    
Selamat datang di alphp!
https://github.com/gnulinuxid/alphp
-------------------------------------------------------------
$( tail -n5 $APACHE_LOG_ERROR )
$info
-------------------------------------------------------------
Ketik "exit" lalu Enter untuk logout.
EOL
