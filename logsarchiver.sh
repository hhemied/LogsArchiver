#!/bin/bash
# Author: Hazem Hemied
# hazem.hemied@gmail.com

echo "Please run this script in the directory which has the log files.."
sleep 5

current_dir="."
store_to=
for c in $(ls $current_dir); do

	date=$(ls -ltc --full-time $c | awk '{print $6}')
	year=$(echo $date | cut -d '-' -f 1)
	month=$(echo $date | cut -d '-' -f 2)
	day=$(echo $date | cut -d '-' -f 3 | cut -d ' ' -f 1)

	for i in $date; do
		for y in $year; do
			if [[ ! -d $y ]]; then

				mkdir -p $store_to\/$y

				if [[ ! -d $($y\/$month) ]]; then

					mkdir -p $store_to\/$y\/$month

					if [[ ! -d $($y\/$month\/$day) ]]; then
						mkdir -p $store_to\/$y\/$month\/$day

						if [[ $date -eq $store_to\/$y\-$month\-$day ]]; then
							echo 'true'
							cp -r $c $store_to\/$y\/$month\/$day
						else
							echo 'false'
						fi
					fi

				fi
			fi
		done

	done
done
