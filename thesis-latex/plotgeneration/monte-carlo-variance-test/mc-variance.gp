set terminal pdfcairo font "Libertinus Serif, 12pt" fontscale 0.68 size 16cm, 12cm       # sets output format, font and plotsize
set samples 600                                                                         # sets count for the amount of sampled points

set output "mc-variance.pdf"          # name of the output pdf

# legend
set key Left                                                            # key text justify left
set key top right                                                     # moves legend
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

# axes and label
set xrange [] 
set xtics 100
set mxtics 10
set xlabel "time [1/U]"

set logscale y 10
set ylabel "std-dev"
set yrange [:0.004]
set ytics log
set mytics 10
set format y "10^{%+03T}";

# plot 1,1
set label 1 "J = 0.1⋅U" at graph 0.27,0.96
plot \
     NaN with points pt 5 pointsize 0.6 lc rgb markerred title " 400 samples", \
     NaN with points pt 5 pointsize 0.6 lc rgb markergreen title " 2000 samples", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerblue title " 4000 samples", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerorange title " 20000 samples", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerpink title " 40000 samples", \
       "compareo2-mc-400-current.csv" using ($1 * U):3 notitle      axis x1y1 pointtype 16 pointsize 0.8 linecolor rgb markerred, \
      "compareo2-mc-2000-current.csv" using ($1 * U):3 notitle      axis x1y1 pointtype 16 pointsize 0.8 linecolor rgb markergreen, \
      "compareo2-mc-4000-current.csv" using ($1 * U):3 notitle      axis x1y1 pointtype 16 pointsize 0.8 linecolor rgb markerblue, \
     "compareo2-mc-20000-current.csv" using ($1 * U):3 notitle      axis x1y1 pointtype 16 pointsize 0.8 linecolor rgb markerorange, \
     "compareo2-mc-40000-current.csv" using ($1 * U):3 notitle      axis x1y1 pointtype 16 pointsize 0.8 linecolor rgb markerpink
# end plot 1,1