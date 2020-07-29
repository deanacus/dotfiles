function ip -d "Get your local IP address"
  ifconfig eth0 | grep -Eo "inet ([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})" | string trim -l -c=inet\s
end