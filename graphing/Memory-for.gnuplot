set style data histogram
set style histogram cluster gap 5
set style fill solid border rgb "black"
set key outside
set auto x
set xlabel "Input size in bytes"
set ylabel "Memory usage in bytes"
set yrange[1000:1200]
plot for [i=2:10] '../data/2105131209-Memory-Data-5.csv' using i:xtic(1) title col
