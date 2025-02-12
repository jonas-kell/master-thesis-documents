set terminal pdfcairo font "Libertinus Serif, 12pt" fontscale 0.68 size 15cm, 12cm       # sets output format, font and plotsize
set samples 600                                                                         # sets count for the amount of sampled points

set output "energy.pdf"          # name of the output pdf

set multiplot layout 2,1 rowsfirst

# legend
set key Left                                                            # key text justify left
set key right top                                                       # moves legend
set style line 999 dashtype 1 linewidth 1 linecolor rgb "#000008"       # legend linestyle
set key box linestyle 999                                               # apply box style
set key spacing 1                                                       # vertical spacing of entries

# colors 
markerred="#AA0000"     # typically o2
markergreen="#007700"   # typically o1
markerblue="#000080"    # typically exact
markerorange="#FF8E00"  # typically o0 or vcn
markerpink="#DB10E9"    # corr to red
markermint="#2DCF2D"    # corr to green
markercyan="#1FC6A1"    # corr to blue
markeryellow="#EEBE00"  # corr to orange
markergray="#333333"    # extra

linered="#FF9999"
linegreen="#02C402"
lineblue="#1F1FF0"
lineorange="#FCA438"
linepink="#F25DFC"
linemint="#52FA52"
linecyan="#2FEDC3"
lineyellow="#F6D140"
linegray="#444444"


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
set yrange [:0.36]
set ytics log
set ytics 0.05
set mytics 5
set key at graph 0.79,0.96

# plot 1,1
plot \
     NaN with points pt 5 pointsize 0.6 lc rgb markerblue   title " Exact", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerorange   title " O0-pert.", \
     NaN with points pt 5 pointsize 0.6 lc rgb markergreen title " O1-pert.", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerred    title " O2-pert.", \
     "exact-exact-energy.csv"     using ($1 * U):($2/U) notitle      axis x1y1 pointtype 16 pointsize 0.8 linecolor rgb markerblue, \
     "compareo0-exact-energy.csv" using ($1 * U):($2/U) notitle      axis x1y1 pointtype 16 pointsize 0.8 linecolor rgb markerorange, \
     "compareo1-exact-energy.csv" using ($1 * U):($2/U) notitle      axis x1y1 pointtype 16 pointsize 0.8 linecolor rgb markergreen, \
     "compareo2-exact-energy.csv" using ($1 * U):($2/U) notitle      axis x1y1 pointtype 16 pointsize 0.8 linecolor rgb markerred
# end plot 1,1

set ytics 0.01
set key default # reset key
set key box linestyle 999
set key spacing 1
set key top left
unset yrange

# plot 2,1
plot \
     NaN with points pt 5 pointsize 0.6 lc rgb markerblue   title " Exact", \
     NaN with points pt 5 pointsize 0.6 lc rgb markergreen title " O1-pert.", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerred    title " O2-pert.", \
     "exact-exact-energy.csv"     using ($1 * U):($2/U) notitle      axis x1y1 pointtype 16 pointsize 0.8 linecolor rgb markerblue, \
     "compareo1-exact-energy.csv" using ($1 * U):($2/U) notitle      axis x1y1 pointtype 16 pointsize 0.8 linecolor rgb markergreen, \
     "compareo2-exact-energy.csv" using ($1 * U):($2/U) notitle      axis x1y1 pointtype 16 pointsize 0.8 linecolor rgb markerred
# end plot 2,1
