#!/bin/bash
for c in $(ls .); do

	date=$(ls -ltc --full-time $c | awk '{print $6}')
	year=$(echo $date | cut -d '-' -f 1)
	month=$(echo $date | cut -d '-' -f 2)
	day=$(echo $date | cut -d '-' -f 3 | cut -d ' ' -f 1)

	for i in $date; do
		for y in $year; do
			if [[ ! -d $y ]]; then

				mkdir -p $y

				if [[ ! -d $($y\/$month) ]]; then

					mkdir -p $y\/$month

					if [[ ! -d $($y\/$month\/$day) ]]; then
						mkdir -p $y\/$month\/$day

						if [[ $date -eq $y\-$month\-$day ]]; then
							echo 'true'
							cp -r $c $y\/$month\/$day
						else
							echo 'false'
						fi
					fi

				fi
			fi
		done

	done
done
