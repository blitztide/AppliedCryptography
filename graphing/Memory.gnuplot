set style data histogram
set style histogram cluster gap 5
set style fill solid border rgb "black"
set key outside
set auto x
set yrange[1000:1200]
plot '../data/2105131209-Memory-Data-5.csv' using 2:xtic(1) title col,\
 '' using 3:xtic(1) title col,\
 '' using 4:xtic(1) title col,\
 '' using 5:xtic(1) title col,\
 '' using 6:xtic(1) title col,\
 '' using 7:xtic(1) title col,\
 '' using 8:xtic(1) title col,\
 '' using 9:xtic(1) title col,\
 '' using 10:xtic(1) title col,\
