set datafile separator ' '
set logscale x 2
set key autotitle columnhead
plot "2105091847-TimeData.csv" using 1:2 w lp, '' using 1:3 with lp, '' using 1:4 w lp, '' using 1:5 w lp
