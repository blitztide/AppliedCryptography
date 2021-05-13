set style data histogram
set style histogram cluster gap 5
set style fill solid border rgb "black"
set key outside
set auto x
set xlabel "Input size in bytes"
set ylabel "Hashing time in ns"
set logscale y 10
plot for [i=2:10] '../data/test.csv' using i:xtic(1) title col
