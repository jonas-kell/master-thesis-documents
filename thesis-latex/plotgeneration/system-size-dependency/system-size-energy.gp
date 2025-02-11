set terminal pdfcairo font "Libertinus Serif, 12pt" fontscale 0.68 size 16cm, 20cm       # sets output format, font and plotsize
set samples 600                                                                         # sets count for the amount of sampled points

set output "system-size-energy.pdf"          # name of the output pdf

set multiplot layout 2,1 rowsfirst

# legend
set key Left                                                            # key text justify left
set key right bottom                                                    # moves legend
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
markergray="#333333"

linered="#FF9999"
linegreen="#77FF77"
lineblue="#9999FF"
lineyellow="#F6D140"
linepink="#db10e9"
linemint="#59f7d4"
lineorange="#fca438"
linegray="#444444"


# plot
set datafile separator ','

U = 1.0
J = 0.1

# axes and label
set xrange [:] 
set xtics 1
set mxtics 5
set xlabel "time [1/U]"

set yrange[:]
set ytics 0.5
set mytics 5


set ylabel "Energy per site [U]"
# plot 1,1
plot \
     NaN with points pt 5 pointsize 0.6 lc rgb markerblue      title " n=2", \
     NaN with points pt 5 pointsize 0.6 lc rgb markergreen     title " n=4", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerred       title " n=6", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerpink      title " n=8", \
     NaN with points pt 5 pointsize 0.6 lc rgb markermint      title " n=10", \
     "comparevcn_size2-mc-energy.csv"      using ($1 * U):($2/U) notitle      axis x1y1 pointtype 16 pointsize 1.0 linecolor rgb markerblue, \
     "comparevcn_size4-mc-energy.csv"      using ($1 * U):($2/U) notitle      axis x1y1 pointtype 16 pointsize 1.0 linecolor rgb markergreen, \
     "comparevcn_size6-mc-energy.csv"      using ($1 * U):($2/U) notitle      axis x1y1 pointtype 16 pointsize 1.0 linecolor rgb markerred, \
     "comparevcn_size8-mc-energy.csv"      using ($1 * U):($2/U) notitle      axis x1y1 pointtype 16 pointsize 1.0 linecolor rgb markerpink, \
     "comparevcn_size10-mc-energy.csv"     using ($1 * U):($2/U) notitle      axis x1y1 pointtype 16 pointsize 1.0 linecolor rgb markermint
# end plot 1,1

set key right top                                                       # moves legend
set ylabel "Var(E per site) [U²]"
set ytics 0.5

# plot 2,1
plot \
     NaN with points pt 5 pointsize 0.6 lc rgb markerblue      title " n=2", \
     NaN with points pt 5 pointsize 0.6 lc rgb markergreen     title " n=4", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerred       title " n=6", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerpink      title " n=8", \
     NaN with points pt 5 pointsize 0.6 lc rgb markermint      title " n=10", \
     "comparevcn_size2-mc-variance.csv"      using ($1 * U):($2/U) notitle      axis x1y1 pointtype 16 pointsize 1.0 linecolor rgb markerblue, \
     "comparevcn_size4-mc-variance.csv"      using ($1 * U):($2/U) notitle      axis x1y1 pointtype 16 pointsize 1.0 linecolor rgb markergreen, \
     "comparevcn_size6-mc-variance.csv"      using ($1 * U):($2/U) notitle      axis x1y1 pointtype 16 pointsize 1.0 linecolor rgb markerred, \
     "comparevcn_size8-mc-variance.csv"      using ($1 * U):($2/U) notitle      axis x1y1 pointtype 16 pointsize 1.0 linecolor rgb markerpink, \
     "comparevcn_size10-mc-variance.csv"     using ($1 * U):($2/U) notitle      axis x1y1 pointtype 16 pointsize 1.0 linecolor rgb markermint
# end plot 2,1
