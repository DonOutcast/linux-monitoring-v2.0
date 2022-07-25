!/bin/bash

function info() {
cpu="$(sudo cat /proc/stat | grep cpu | awk 'NR==1{print $0}')"
mem_free="$(free | awk 'NR==2{print $4}')"
disk_used="$(df / | awk 'NR==2{print $3}')"
disk_available="$(df / | awk 'NR==2{print $4}')"
mem_total=$(free | awk 'NR==2{print $2}')
mem_available=$(free | awk 'NR==2{print $7}')
echo "# HELP cpu_usage Get CPU usage"
echo "# TYPE cpu_usage gauge"
echo "CPU - $cpu"
echo "# HELP mem_total Get total mem"
echo "# TYPE mem_total gauge"
echo "Memmory total - $mem_total"
echo "# HELP mem_free Get free mem"
echo "# TYPE mem_free gauge"
echo "Memomry free $mem_free"
echo "# HELP mem_available Get mem available"
echo "# TYPE mem_available gauge"
echo "Memory available $mem_available"
echo "# HELP disk_used Get disk used"
echo "# TYPE disk_used gauge"
echo "Disk Used - $disk_used"
echo "# HELP disk_available Get disk available"
echo "# TYPE disk_available gauge"
echo "Disk Avalable - $disk_available"

}


while true; do
  info > /var/www/html/metrics/index.html
    sleep 3
done
