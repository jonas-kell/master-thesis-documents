set terminal pdfcairo font "Libertinus Serif, 12pt" fontscale 0.68 size 16cm, 20cm       # sets output format, font and plotsize
set samples 600                                                                         # sets count for the amount of sampled points

set output "runtime.pdf"          # name of the output pdf

set multiplot layout 3,1 rowsfirst

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
set xtics 25
set mxtics 5
set xlabel "number of sites"

set yrange []
# set ytics 5
# set mytics 5
set logscale y 10
set ylabel "Time [arbitrary]"

# plot 1,1
plot \
     NaN with points pt 5 pointsize 0.6 lc rgb markerred    title " a", \
     NaN with points pt 5 pointsize 0.6 lc rgb markergreen  title " a", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerblue   title " a", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerorange title " a", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerpink   title " a", \
     NaN with points pt 5 pointsize 0.6 lc rgb markermint   title " a", \
     "chain_measurements_o1.csv"      using ($1):($2)       notitle   axis x1y1 with lines linecolor rgb markerred, \
     "chain_measurements_vcno1.csv"   using ($1):($2)       notitle   axis x1y1 with lines linecolor rgb markerblue, \
     "chain_measurements_o2.csv"      using ($1):($2)       notitle   axis x1y1 with lines linecolor rgb markergreen, \
     "square_measurements_o1.csv"     using ($1*$1):($2)    notitle   axis x1y1 with lines linecolor rgb markerorange  , \
     "square_measurements_vcno1.csv"  using ($1*$1):($2)    notitle   axis x1y1 with lines linecolor rgb markermint  , \
     "square_measurements_o2.csv"     using ($1*$1):($2)    notitle   axis x1y1 with lines linecolor rgb markerpink  #, \
# end plot 1,1

# plot 2,1
# end plot 2,1
