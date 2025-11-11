nscache 65536
timeouts 1 5 30 60 180 1800 15 60
daemon
maxconn 100

auth strong
users {{USER}}:CL:{{PASS}}
allow *

proxy -n -p{{PORT}} -a
