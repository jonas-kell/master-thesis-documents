set terminal pdfcairo font "Libertinus Serif, 12pt" fontscale 0.68 size 16cm, 12cm       # sets output format, font and plotsize
set samples 600                                                                         # sets count for the amount of sampled points

set output "mc-variance.pdf"          # name of the output pdf

# legend
set key Left                                                            # key text justify left
set key top right                                                     # moves legend
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