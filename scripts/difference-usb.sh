lsblk > tmpwow
sleep 8
lsblk > tmp2wow

# Does not tell if USB was plugged
# in or out

diff tmpwow tmp2wow
rm tmpwow
rm tmp2wow
