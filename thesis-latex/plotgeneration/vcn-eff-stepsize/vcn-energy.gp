set terminal pdfcairo font "Libertinus Serif, 12pt" fontscale 0.68 size 16cm, 20cm       # sets output format, font and plotsize
set samples 600                                                                         # sets count for the amount of sampled points

set output "vcn-energy.pdf"          # name of the output pdf

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

set yrange[0.13:]
set ytics 0.01
set mytics 5

set y2range [1e-20:1e-3]
set logscale y2 10
set y2tics log
set my2tics 5

unset key

set ylabel "Energy per site [U]"
first_y = NaN
# plot 1,1
plot \
     NaN with points pt 5 pointsize 0.6 lc rgb markerblue      title " Exact", \
     NaN with points pt 5 pointsize 0.6 lc rgb markergreen     title " O1-pert.", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerred       title " O2-pert.", \
     NaN with points pt 5 pointsize 0.6 lc rgb markermint      title " vcn step 6e-2", \
     NaN with points pt 5 pointsize 0.6 lc rgb markeryellow    title " vcn step 2e-2", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerpink      title " vcn step 6e-3", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerorange    title " vcn step 2e-3", \
     "compareo1-exact-energy.csv"     using ($1 * U):(first_y = (first_y != first_y ? ($2/U) : first_y)) notitle      axis x1y1 pointtype 16 pointsize 0.8 linecolor rgb markerblue, \
     "compareo1-exact-energy.csv"         using ($1 * U):($2/U) notitle      axis x1y1 pointtype 16 pointsize 1.0 linecolor rgb markergreen, \
     "compareo2-exact-energy.csv"         using ($1 * U):($2/U) notitle      axis x1y1 pointtype 16 pointsize 1.0 linecolor rgb markerred, \
     "comparevcn006-exact-energy.csv"     using ($1 * U):($2/U) notitle      axis x1y1 pointtype 16 pointsize 1.0 linecolor rgb markermint, \
     "comparevcn002-exact-energy.csv"     using ($1 * U):($2/U) notitle      axis x1y1 pointtype 16 pointsize 1.0 linecolor rgb markeryellow, \
     "comparevcn0006-exact-energy.csv"    using ($1 * U):($2/U) notitle      axis x1y1 pointtype 16 pointsize 1.0 linecolor rgb markerpink, \
     "comparevcn0002-exact-energy.csv"    using ($1 * U):($2/U) notitle      axis x1y1 pointtype 17 pointsize 0.8 linecolor rgb markerorange, \
     "compareo0-exact-energy.csv"         using ($1 * U):($2/U) notitle      axis x1y1 pointtype 16 pointsize 1.0 linecolor rgb markergray, \
     \
     "compareo1-exact-energyimag.csv"         using ($1 * U):(abs($2/U)) notitle      axis x1y2 pointtype 12 pointsize 0.6 linecolor rgb markergreen, \
     "compareo2-exact-energyimag.csv"         using ($1 * U):(abs($2/U)) notitle      axis x1y2 pointtype 12 pointsize 0.6 linecolor rgb markerred, \
     "comparevcn006-exact-energyimag.csv"     using ($1 * U):(abs($2/U)) notitle      axis x1y2 pointtype 12 pointsize 0.6 linecolor rgb markermint, \
     "comparevcn002-exact-energyimag.csv"     using ($1 * U):(abs($2/U)) notitle      axis x1y2 pointtype 12 pointsize 0.6 linecolor rgb markeryellow, \
     "comparevcn0006-exact-energyimag.csv"    using ($1 * U):(abs($2/U)) notitle      axis x1y2 pointtype 12 pointsize 0.6 linecolor rgb markerpink, \
     "comparevcn0002-exact-energyimag.csv"    using ($1 * U):(abs($2/U)) notitle      axis x1y2 pointtype 12 pointsize 0.6 linecolor rgb markerorange
# end plot 1,1

unset yrange
unset y2tics

set key left top                                                       # moves legend
set ylabel "Var(E per site) [U²]"
set ytics 0.05
first_y = NaN
# plot 2,1
plot \
     NaN with points pt 5 pointsize 0.6 lc rgb markerblue      title " Exact", \
     NaN with points pt 5 pointsize 0.6 lc rgb markergreen     title " O1-pert.", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerred       title " O2-pert.", \
     NaN with points pt 5 pointsize 0.6 lc rgb markermint      title " vcn step 6e-2", \
     NaN with points pt 5 pointsize 0.6 lc rgb markeryellow    title " vcn step 2e-2", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerpink      title " vcn step 6e-3", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerorange    title " vcn step 2e-3", \
     "compareo1-exact-variance.csv"         using ($1 * U):(first_y = (first_y != first_y ? ($2/U/U) : first_y)) notitle      axis x1y1 pointtype 16 pointsize 0.8 linecolor rgb markerblue, \
     "compareo1-exact-variance.csv"         using ($1 * U):($2/U/U) notitle      axis x1y1 pointtype 16 pointsize 1.0 linecolor rgb markergreen, \
     "compareo2-exact-variance.csv"         using ($1 * U):($2/U/U) notitle      axis x1y1 pointtype 16 pointsize 1.0 linecolor rgb markerred, \
     "comparevcn006-exact-variance.csv"     using ($1 * U):($2/U/U) notitle      axis x1y1 pointtype 16 pointsize 1.0 linecolor rgb markermint, \
     "comparevcn002-exact-variance.csv"     using ($1 * U):($2/U/U) notitle      axis x1y1 pointtype 16 pointsize 1.0 linecolor rgb markeryellow, \
     "comparevcn0006-exact-variance.csv"    using ($1 * U):($2/U/U) notitle      axis x1y1 pointtype 16 pointsize 1.0 linecolor rgb markerpink, \
     "comparevcn0002-exact-variance.csv"    using ($1 * U):($2/U/U) notitle      axis x1y1 pointtype 17 pointsize 0.8 linecolor rgb markerorange
# end plot 2,1
