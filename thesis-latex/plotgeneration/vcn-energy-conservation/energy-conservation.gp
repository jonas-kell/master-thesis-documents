set terminal pdfcairo font "Libertinus Serif, 12pt" fontscale 0.68 size 15cm, 21cm       # sets output format, font and plotsize
set samples 600                                                                          # sets count for the amount of sampled points

set output "energy-conservation.pdf"          # name of the output pdf

set multiplot layout 4,1 rowsfirst

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
set xrange [:9] 
set xtics 1
set mxtics 5

set ytics 0.01
set mytics 5

set key opaque

set yrange [0.055:0.074]

set ylabel "Energy per site [U]"


# plot 1,1
set label 1 "Square Geometry" at graph 0.21,0.92
plot \
     NaN with points pt 5 pointsize 0.6 lc rgb markerred      title " ×1", \
     NaN with points pt 5 pointsize 0.6 lc rgb markergreen    title " ×2", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerblue     title " ×4", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerorange   title " ×8", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerpink     title " ×16", \
     NaN with points pt 5 pointsize 0.6 lc rgb markermint     title " ×32", \
     NaN with points pt 5 pointsize 0.6 lc rgb markercyan     title " ×64", \
     NaN with points pt 5 pointsize 0.6 lc rgb markeryellow   title " ×128", \
     "comparevcn_square_1-exact-energy.csv"     using ($1 * U):($2/U) notitle      axis x1y1 with linespoints pointtype 16 pointsize 0.6 linecolor rgb markerred, \
     "comparevcn_square_2-exact-energy.csv"     using ($1 * U):($2/U) notitle      axis x1y1 with linespoints pointtype 16 pointsize 0.6 linecolor rgb markergreen, \
     "comparevcn_square_4-exact-energy.csv"     using ($1 * U):($2/U) notitle      axis x1y1 with linespoints pointtype 16 pointsize 0.6 linecolor rgb markerblue, \
     "comparevcn_square_8-exact-energy.csv"     using ($1 * U):($2/U) notitle      axis x1y1 with linespoints pointtype 16 pointsize 0.6 linecolor rgb markerorange, \
     "comparevcn_square_16-exact-energy.csv"    using ($1 * U):($2/U) notitle      axis x1y1 with linespoints pointtype 16 pointsize 0.6 linecolor rgb markerpink, \
     "comparevcn_square_32-exact-energy.csv"    using ($1 * U):($2/U) notitle      axis x1y1 with linespoints pointtype 16 pointsize 0.6 linecolor rgb markermint, \
     "comparevcn_square_64-exact-energy.csv"    using ($1 * U):($2/U) notitle      axis x1y1 with linespoints pointtype 16 pointsize 0.6 linecolor rgb markercyan, \
     "comparevcn_square_128-exact-energy.csv"   using ($1 * U):($2/U) notitle      axis x1y1 with linespoints pointtype 16 pointsize 0.6 linecolor rgb markeryellow
# end plot 1,1

unset key
set yrange [0.167:0.184]

# plot 2,1
set label 1 "Chain Geometry" at graph 0.21,0.92
plot \
     "comparevcn_chain_1-exact-energy.csv"     using ($1 * U):($2/U) notitle      axis x1y1 with linespoints pointtype 16 pointsize 0.6 linecolor rgb markerred, \
     "comparevcn_chain_2-exact-energy.csv"     using ($1 * U):($2/U) notitle      axis x1y1 with linespoints pointtype 16 pointsize 0.6 linecolor rgb markergreen, \
     "comparevcn_chain_4-exact-energy.csv"     using ($1 * U):($2/U) notitle      axis x1y1 with linespoints pointtype 16 pointsize 0.6 linecolor rgb markerblue, \
     "comparevcn_chain_8-exact-energy.csv"     using ($1 * U):($2/U) notitle      axis x1y1 with linespoints pointtype 16 pointsize 0.6 linecolor rgb markerorange, \
     "comparevcn_chain_16-exact-energy.csv"    using ($1 * U):($2/U) notitle      axis x1y1 with linespoints pointtype 16 pointsize 0.6 linecolor rgb markerpink, \
     "comparevcn_chain_32-exact-energy.csv"    using ($1 * U):($2/U) notitle      axis x1y1 with linespoints pointtype 16 pointsize 0.6 linecolor rgb markermint, \
     "comparevcn_chain_64-exact-energy.csv"    using ($1 * U):($2/U) notitle      axis x1y1 with linespoints pointtype 16 pointsize 0.6 linecolor rgb markercyan, \
     "comparevcn_chain_128-exact-energy.csv"   using ($1 * U):($2/U) notitle      axis x1y1 with linespoints pointtype 16 pointsize 0.6 linecolor rgb markeryellow
# end plot 2,1

unset yrange

set ylabel "Var(E) per site [U^2]"
set yrange [0.216:]

# plot 3,1
set label 1 "Square Geometry" at graph 0.21,0.92
plot \
     "comparevcn_square_1-exact-variance.csv"     using ($1 * U):($2/U/U) notitle      axis x1y1 with linespoints pointtype 16 pointsize 0.6 linecolor rgb markerred, \
     "comparevcn_square_2-exact-variance.csv"     using ($1 * U):($2/U/U) notitle      axis x1y1 with linespoints pointtype 16 pointsize 0.6 linecolor rgb markergreen, \
     "comparevcn_square_4-exact-variance.csv"     using ($1 * U):($2/U/U) notitle      axis x1y1 with linespoints pointtype 16 pointsize 0.6 linecolor rgb markerblue, \
     "comparevcn_square_8-exact-variance.csv"     using ($1 * U):($2/U/U) notitle      axis x1y1 with linespoints pointtype 16 pointsize 0.6 linecolor rgb markerorange, \
     "comparevcn_square_16-exact-variance.csv"    using ($1 * U):($2/U/U) notitle      axis x1y1 with linespoints pointtype 16 pointsize 0.6 linecolor rgb markerpink, \
     "comparevcn_square_32-exact-variance.csv"    using ($1 * U):($2/U/U) notitle      axis x1y1 with linespoints pointtype 16 pointsize 0.6 linecolor rgb markermint, \
     "comparevcn_square_64-exact-variance.csv"    using ($1 * U):($2/U/U) notitle      axis x1y1 with linespoints pointtype 16 pointsize 0.6 linecolor rgb markercyan, \
     "comparevcn_square_128-exact-variance.csv"   using ($1 * U):($2/U/U) notitle      axis x1y1 with linespoints pointtype 16 pointsize 0.6 linecolor rgb markeryellow
# end plot 3,1

set yrange [0.443:]
set xlabel "time [1/U]"

# plot 4,1
set label 1 "Chain Geometry" at graph 0.21,0.92
plot \
     "comparevcn_chain_1-exact-variance.csv"     using ($1 * U):($2/U/U) notitle      axis x1y1 with linespoints pointtype 16 pointsize 0.6 linecolor rgb markerred, \
     "comparevcn_chain_2-exact-variance.csv"     using ($1 * U):($2/U/U) notitle      axis x1y1 with linespoints pointtype 16 pointsize 0.6 linecolor rgb markergreen, \
     "comparevcn_chain_4-exact-variance.csv"     using ($1 * U):($2/U/U) notitle      axis x1y1 with linespoints pointtype 16 pointsize 0.6 linecolor rgb markerblue, \
     "comparevcn_chain_8-exact-variance.csv"     using ($1 * U):($2/U/U) notitle      axis x1y1 with linespoints pointtype 16 pointsize 0.6 linecolor rgb markerorange, \
     "comparevcn_chain_16-exact-variance.csv"    using ($1 * U):($2/U/U) notitle      axis x1y1 with linespoints pointtype 16 pointsize 0.6 linecolor rgb markerpink, \
     "comparevcn_chain_32-exact-variance.csv"    using ($1 * U):($2/U/U) notitle      axis x1y1 with linespoints pointtype 16 pointsize 0.6 linecolor rgb markermint, \
     "comparevcn_chain_64-exact-variance.csv"    using ($1 * U):($2/U/U) notitle      axis x1y1 with linespoints pointtype 16 pointsize 0.6 linecolor rgb markercyan, \
     "comparevcn_chain_128-exact-variance.csv"   using ($1 * U):($2/U/U) notitle      axis x1y1 with linespoints pointtype 16 pointsize 0.6 linecolor rgb markeryellow
# end plot 4,1