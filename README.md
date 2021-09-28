This Docker  would automatically install required things for LBP 2900 running.
It's a little bit large but I don't have plan to reduce the size yet. 
You need to expose the bus usb so that it can automatically detect the printer.

# Build and run
```
docker build --tag lbp2900_network_printer .
docker run --name lbp2900_network_printer --expose 631 -t -i --privileged -v /dev/bus/usb:/dev/bus/usb lbp2900_network_printer bash
```
# Get IP Address
```
docker inspect --format '{{ .NetworkSettings.IPAddress }}' lbp2900_network_printer
```
# The link to add the printer

XXX.XXX.XXX is IP Adrress
```
ipp://XXX.XXX.XXX:631/printers/Canon_LBP2900_docker
```
# Reference
https://namvu.net/2021/07/setup-a-family-printer-with-a-raspberry-pi-1-and-canon-lbp-2900/ 
