# @title: Gnuplot Template
# @author: Aravind Reddy V
# @hints:
#	_{Subscript}, ^{Superscript}
#   1:(2*$2)

set terminal png truecolor             # Set output type to png
set grid                               # Turn on grid

unset log                              # Remove any previous log scaling
unset label                            # Remove any previous labels

set autoscale                          # Scale axes automatically
set xtic auto                          # set xtics automatically
set ytic auto                          # set ytics automatically

set key outside
set output 'gzip.png'                # Set output file

set datafile separator ","           # Uncomment when using CSV files

#set xtic add(1.1, 2.2)               # Add xtics at points
#set ytic add(1.1, 2.2)               # Add ytics at points

set xr[0:0.6]
set yr[0:55]

set title "Miss Rate Change"
set xlabel "Total Instruction (in Millions)"                 # Set X axis label
set ylabel "Miss Percentage"               # Set Y axis label

plot "gcc.csv" using ($1/1000000):2 with lines title "GCC" lw 3,\
    "gzip.csv" using ($1/1000000):2 with lines title "GZIP" lw 3,\
    "mcf.csv" using ($1/1000000):2 with lines title "MCF" lw 3,\
    "swim.csv" using ($1/1000000):2 with lines title "SWIM" lw 3,\
    "twolf.csv" using ($1/1000000):2 with lines title "TWOLF" lw 3
