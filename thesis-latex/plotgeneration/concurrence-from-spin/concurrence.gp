set terminal pdfcairo font "Libertinus Serif, 12pt" fontscale 0.68 size 16cm, 10cm       # sets output format, font and plotsize
set samples 600                                                                         # sets count for the amount of sampled points

set output "concurrence-comparison.pdf"          # name of the output pdf

# legend
set key Left                                                            # key text justify left
set key left center                                                     # moves legend
set style line 999 dashtype 1 linewidth 1 linecolor rgb "#0000AA"       # legend linestyle
set key box linestyle 999                                               # apply box style
set key spacing 1                                                       # vertical spacing of entries

# colors 
markerred="#AA0000"
markergreen="#00AA00"
markerblue="#0000AA"
markeryellow="#EEBE00"
markerpink="#db10e9"
markermint="#1fc6a1"
markerorange="#FF8E00"

linered="#FF9999"
linegreen="#77FF77"
lineblue="#9999FF"
lineyellow="#F6D140"
linepink="#db10e9"
linemint="#59f7d4"
lineorange="#fca438"

# plot
set datafile separator ','

U = 1.0

# axes and label
set xrange [] 
set xtics 1
set mxtics 2
set xlabel "time [1/U]"

set ylabel "Concurrence"
set yrange []
set ytics 0.01
set mytics 5

# set label 1 "J = 0.1⋅U" at graph 0.27,0.96
plot \
     NaN with points pt 5 pointsize 0.6 lc rgb markerblue title " Diagonalization External", \
     NaN with points pt 5 pointsize 0.6 lc rgb markermint title " Diagonalization Sampled", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerorange title " Perturbation Oth Order", \
     NaN with points pt 5 pointsize 0.6 lc rgb markergreen title " Perturbation 1st Order", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerred title " Perturbation 2nd Order", \
     "external-exact-concurrence.csv"    using ($1 * U):2 notitle      axis x1y1 pointtype 17 pointsize 0.8 linecolor rgb markerblue, \
     "exact-exact-concurrence.csv"       using ($1 * U):2 notitle      axis x1y1 pointtype 16 pointsize 0.9 linecolor rgb markermint, \
     "compareo0-exact-concurrence.csv"   using ($1 * U):2 notitle      axis x1y1 pointtype 16 pointsize 0.9 linecolor rgb markerorange, \
     "compareo1-exact-concurrence.csv"   using ($1 * U):2 notitle      axis x1y1 pointtype 16 pointsize 0.9 linecolor rgb markergreen, \
     "compareo2-exact-concurrence.csv"   using ($1 * U):2 notitle      axis x1y1 pointtype 16 pointsize 0.9 linecolor rgb markerred
     
     