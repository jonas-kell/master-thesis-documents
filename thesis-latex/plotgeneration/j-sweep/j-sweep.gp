set terminal pdfcairo font "Libertinus Serif, 12pt" fontscale 0.68 size 16cm, 12cm       # sets output format, font and plotsize
set samples 600                                                                         # sets count for the amount of sampled points

set output "j-sweep.pdf"          # name of the output pdf

# legend
set key Left                                                            # key text justify left
set key right bottom                                                     # moves legend
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

# set format y "%.2t*10^{%+03T}";
set format y "10^{%+03T}";
set logscale y 10
set ylabel "relative error"
# set yrange [0.3e-4:]
set ytics log
set mytics 5

# plot 1,1
set label 1 "TODO" at graph 0.27,0.96
plot \
     NaN with points pt 5 pointsize 0.6 lc rgb markerred title " J=0.1⋅U", \
     NaN with points pt 5 pointsize 0.6 lc rgb markergreen title " J=0.09⋅U", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerblue title " J=0.08⋅U", \
     NaN with points pt 5 pointsize 0.6 lc rgb markermint title " J=0.07⋅U", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerorange title " J=0.06⋅U", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerpink title " J=0.04⋅U", \
     NaN with points pt 5 pointsize 0.6 lc rgb markeryellow title " J=0.02⋅U", \
      "out-j01-o1-single_occ_center.csv" using ($1 / U):(abs($2-$4)*2/(abs($2)+abs($4))) notitle      axis x1y1 pointtype 16 pointsize 0.8 linecolor rgb markerred, \
     "out-j009-o1-single_occ_center.csv" using ($1 / U):(abs($2-$4)*2/(abs($2)+abs($4))) notitle      axis x1y1 pointtype 16 pointsize 0.8 linecolor rgb markergreen, \
     "out-j008-o1-single_occ_center.csv" using ($1 / U):(abs($2-$4)*2/(abs($2)+abs($4))) notitle      axis x1y1 pointtype 16 pointsize 0.8 linecolor rgb markerblue, \
     "out-j007-o1-single_occ_center.csv" using ($1 / U):(abs($2-$4)*2/(abs($2)+abs($4))) notitle      axis x1y1 pointtype 16 pointsize 0.8 linecolor rgb markermint, \
     "out-j006-o1-single_occ_center.csv" using ($1 / U):(abs($2-$4)*2/(abs($2)+abs($4))) notitle      axis x1y1 pointtype 16 pointsize 0.8 linecolor rgb markerorange, \
     "out-j004-o1-single_occ_center.csv" using ($1 / U):(abs($2-$4)*2/(abs($2)+abs($4))) notitle      axis x1y1 pointtype 16 pointsize 0.8 linecolor rgb markerpink, \
     "out-j002-o1-single_occ_center.csv" using ($1 / U):(abs($2-$4)*2/(abs($2)+abs($4))) notitle      axis x1y1 pointtype 16 pointsize 0.8 linecolor rgb markeryellow