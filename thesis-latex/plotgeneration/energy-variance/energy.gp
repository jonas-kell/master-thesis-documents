set terminal pdfcairo font "Libertinus Serif, 12pt" fontscale 0.68 size 16cm, 12cm       # sets output format, font and plotsize
set samples 600                                                                         # sets count for the amount of sampled points

set output "energy.pdf"          # name of the output pdf

set multiplot layout 2,1 rowsfirst

# legend
set key Left                                                            # key text justify left
set key right top                                                       # moves legend
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
J = 0.1

# axes and label
set xrange [:12.5] 
set xtics 1
set mxtics 5
set xlabel "time [1/U]"

set ylabel "Energy per site [U]"
set yrange []
set ytics log
set ytics 0.05
set mytics 5

# plot 1,1
# set label 1 "TODO" at graph 0.27,0.96
plot \
     NaN with points pt 5 pointsize 0.6 lc rgb markerblue   title " Exact", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerorange   title " O0-pert.", \
     NaN with points pt 5 pointsize 0.6 lc rgb markergreen title " O1-pert.", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerred    title " O2-pert.", \
     "exact-exact-energy.csv"     using ($1 / U):($2/U) notitle      axis x1y1 pointtype 16 pointsize 0.8 linecolor rgb markerblue, \
     "compareo0-exact-energy.csv" using ($1 / U):($2/U) notitle      axis x1y1 pointtype 16 pointsize 0.8 linecolor rgb markerorange, \
     "compareo1-exact-energy.csv" using ($1 / U):($2/U) notitle      axis x1y1 pointtype 16 pointsize 0.8 linecolor rgb markergreen, \
     "compareo2-exact-energy.csv" using ($1 / U):($2/U) notitle      axis x1y1 pointtype 16 pointsize 0.8 linecolor rgb markerred
# end plot 1,1

set ytics 0.01

# plot 2,1
# set label 1 "TODO" at graph 0.27,0.96
plot \
     NaN with points pt 5 pointsize 0.6 lc rgb markerblue   title " Exact", \
     NaN with points pt 5 pointsize 0.6 lc rgb markergreen title " O1-pert.", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerred    title " O2-pert.", \
     "exact-exact-energy.csv"     using ($1 / U):($2/U) notitle      axis x1y1 pointtype 16 pointsize 0.8 linecolor rgb markerblue, \
     "compareo1-exact-energy.csv" using ($1 / U):($2/U) notitle      axis x1y1 pointtype 16 pointsize 0.8 linecolor rgb markergreen, \
     "compareo2-exact-energy.csv" using ($1 / U):($2/U) notitle      axis x1y1 pointtype 16 pointsize 0.8 linecolor rgb markerred
# end plot 2,1
