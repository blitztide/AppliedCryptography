set datafile separator ' '
set logscale x 2
set logscale y  10
set yrange[1000000:10000000000]
set key autotitle columnhead
set key outside
set xlabel "Input size in bytes"
set ylabel "Execution time in ns"
plot "../data/2105131412-TimeData-1000.csv" using 1:6 w lp, '' using 1:7 with lp, '' using 1:8 w lp, '' using 1:9 w lp, '' using 1:10 w lp
