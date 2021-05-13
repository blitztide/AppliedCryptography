set datafile separator ' '
set logscale x 2
set logscale y 10 
set yrange[1000000:1000000000]
set key autotitle columnhead
set key outside
set xlabel "Input size in bytes"
set ylabel "Execution time in ns"
plot "../data/2105131412-TimeData-1000.csv" using 1:2 w lp, '' using 1:3 with lp, '' using 1:4 w lp, '' using 1:5 w lp
