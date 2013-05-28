#!/bin/bash
#!/bin/bash
mirrors=`cat mirrors.txt`
results="results.txt"
rm -f $results
target="ls-lR.gz"

for mirror in $mirrors
do
    echo "Testing $mirror ..."
    curl -s $mirror$target -o $target \
       -w 'Got speed: %{speed_download} from %{url_effective}\n' \
          --connect-timeout 3 | tee -a $results
    rm -f $target
done
