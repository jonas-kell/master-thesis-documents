set terminal pdfcairo font "Libertinus Serif, 12pt" fontscale 0.68 size 15cm, 10cm       # sets output format, font and plotsize
set samples 600                                                                         # sets count for the amount of sampled points

set output "purity-comparison.pdf"          # name of the output pdf

# legend
set key Left                                                            # key text justify left
set key at graph 0.53, graph 0.97                                       # moves legend
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
set key opaque

U = 1.0

# axes and label
set xrange [] 
set xtics 1
set mxtics 10
set xlabel "time [1/U]"

set ylabel "Purity"
set yrange [:1.05]
set ytics 0.1
set mytics 5

# set label 1 "J = 0.1⋅U" at graph 0.27,0.96
plot \
     NaN with points pt 5 pointsize 0.6 lc rgb markerblue title " Diagonalization External", \
     NaN with points pt 5 pointsize 0.6 lc rgb markercyan title " Diagonalization Sampled", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerorange title " Perturbation Oth Order", \
     NaN with points pt 5 pointsize 0.6 lc rgb markergreen title " Perturbation 1st Order", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerred title " Perturbation 2nd Order", \
     "external-exact-purity.csv"    using ($1 * U):2 notitle      axis x1y1 pointtype 17 pointsize 0.8 linecolor rgb markerblue, \
     "exact-exact-purity.csv"       using ($1 * U):2 notitle      axis x1y1 pointtype 16 pointsize 0.9 linecolor rgb markercyan, \
     "compareo0-exact-purity.csv"   using ($1 * U):2 notitle      axis x1y1 pointtype 16 pointsize 0.9 linecolor rgb markerorange, \
     "compareo1-exact-purity.csv"   using ($1 * U):2 notitle      axis x1y1 pointtype 16 pointsize 0.9 linecolor rgb markergreen, \
     "compareo2-exact-purity.csv"   using ($1 * U):2 notitle      axis x1y1 pointtype 16 pointsize 0.9 linecolor rgb markerred
     
     