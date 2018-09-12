#!/bin/sh

NODE="sykorap"
SIZE="10Gi"
START=1
END=30
LOCATION="/mnt/container/"

for NUMBER in $(seq $START $END); do
	sudo mkdir "$LOCATION/vol$NUMBER"
	cp template.vol tempvol.yaml
	sed -i -e "s|LOCATION|$LOCATION|" tempvol.yaml
	sed -i -e "s/NODE/$NODE/" tempvol.yaml
	sed -i -e "s/NUMBER/$NUMBER/" tempvol.yaml
	sed -i -e "s/SIZE/$SIZE/" tempvol.yaml
	kubectl apply -f tempvol.yaml
	rm tempvol.yaml
done;

