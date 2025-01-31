set terminal pdfcairo font "Libertinus Serif, 12pt" fontscale 0.68 size 16cm, 20cm       # sets output format, font and plotsize
set samples 600                                                                         # sets count for the amount of sampled points

set output "vcn-energy.pdf"          # name of the output pdf

set multiplot layout 2,1 rowsfirst

# legend
set key Left                                                            # key text justify left
set key right bottom                                                       # moves legend
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
set xrange [:] 
set xtics 0.1
set mxtics 1
set xlabel "time [1/U]"

set yrange []
set ytics 0.05
set mytics 5

# set logscale y2 10
# set y2tics log
# set my2tics 5

set ylabel "Energy per site [U]"
# plot 1,1
plot \
     NaN with points pt 5 pointsize 0.6 lc rgb markerred    title " a", \
     NaN with points pt 5 pointsize 0.6 lc rgb markergreen  title " a", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerblue   title " a", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerorange title " a", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerpink   title " a", \
     "11-exact-energy.csv"     using ($1 * U):($2/U) notitle      axis x1y1 pointtype 16 pointsize 1.2 linecolor rgb markerred, \
     "22-exact-energy.csv"     using ($1 * U):($2/U) notitle      axis x1y1 pointtype 16 pointsize 1.2 linecolor rgb markergreen, \
     "33-exact-energy.csv"     using ($1 * U):($2/U) notitle      axis x1y1 pointtype 16 pointsize 1.2 linecolor rgb markerblue, \
     "44-exact-energy.csv"     using ($1 * U):($2/U) notitle      axis x1y1 pointtype 17 pointsize 1.1 linecolor rgb markerorange  , \
     "55-exact-energy.csv"     using ($1 * U):($2/U) notitle      axis x1y1 pointtype 17 pointsize 1.1 linecolor rgb markerpink  #, \
# end plot 1,1

set key left bottom                                                       # moves legend
set ylabel "Var(E per site) [U²]"
set ytics 0.05
# plot 2,1
plot \
     NaN with points pt 5 pointsize 0.6 lc rgb markerred    title " a", \
     NaN with points pt 5 pointsize 0.6 lc rgb markergreen  title " a", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerblue   title " a", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerorange title " a", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerpink   title " a", \
     "11-exact-variance.csv"      using ($1 * U):($2/U/U) notitle      axis x1y1 pointtype 16 pointsize 1.2 linecolor rgb markerred, \
     "22-exact-variance.csv"     using ($1 * U):($2/U/U) notitle      axis x1y1 pointtype 16 pointsize 1.2 linecolor rgb markergreen, \
     "33-exact-variance.csv"    using ($1 * U):($2/U/U) notitle      axis x1y1 pointtype 16 pointsize 1.2 linecolor rgb markerblue, \
     "44-exact-variance.csv"   using ($1 * U):($2/U/U) notitle      axis x1y1 pointtype 17 pointsize 1.1 linecolor rgb markerorange, \
     "55-exact-variance.csv"   using ($1 * U):($2/U/U) notitle      axis x1y1 pointtype 17 pointsize 1.1 linecolor rgb markerpink
# end plot 2,1
