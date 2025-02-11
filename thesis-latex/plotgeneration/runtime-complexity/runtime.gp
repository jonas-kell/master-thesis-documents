set terminal pdfcairo font "Libertinus Serif, 12pt" fontscale 0.68 size 15cm, 21cm       # sets output format, font and plotsize
set samples 600                                                                         # sets count for the amount of sampled points

set output "runtime.pdf"          # name of the output pdf

set multiplot layout 3,1 rowsfirst

# legend
set key Left                                                            # key text justify left
set key left top                                                       # moves legend
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
set xrange [:] 
set xtics 25
set mxtics 5

set yrange []
set format y "10^{%3T}";
set logscale y 10
set ylabel "Time [arbitrary]"

# n,flip can,flip opt,double flip can,double flip opt,swap can,swap opt
unset key

set label 1 "Single Flip" at graph 0.37,0.94

# plot 1,1
plot \
     NaN with points pt 5 pointsize 0.6 lc rgb markergreen  title " chain - O1", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerred    title " chain - O2", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerblue   title " chain - VCN", \
     NaN with points pt 5 pointsize 0.6 lc rgb markermint   title " square - O1", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerpink   title " square - O2", \
     NaN with points pt 5 pointsize 0.6 lc rgb markercyan   title " square - VCN", \
     "chain_measurements_o1.csv"      using ($1):($2)       notitle   axis x1y1 with lines dt 2 linecolor rgb markergreen, \
     "chain_measurements_o2.csv"      using ($1):($2)       notitle   axis x1y1 with lines dt 2 linecolor rgb markerred, \
     "chain_measurements_vcno1.csv"   using ($1):($2)       notitle   axis x1y1 with lines dt 2 linecolor rgb markerblue, \
     "square_measurements_o1.csv"     using ($1*$1):($2)    notitle   axis x1y1 with lines dt 2 linecolor rgb markermint, \
     "square_measurements_o2.csv"     using ($1*$1):($2)    notitle   axis x1y1 with lines dt 2 linecolor rgb markerpink, \
     "square_measurements_vcno1.csv"  using ($1*$1):($2)    notitle   axis x1y1 with lines dt 2 linecolor rgb markercyan, \
     \
     "chain_measurements_o1.csv"      using ($1):($3)       notitle   axis x1y1 with lines dt 1 linecolor rgb markergreen, \
     "chain_measurements_o2.csv"      using ($1):($3)       notitle   axis x1y1 with lines dt 1 linecolor rgb markerred, \
     "chain_measurements_vcno1.csv"   using ($1):($3)       notitle   axis x1y1 with lines dt 1 linecolor rgb markerblue, \
     "square_measurements_o1.csv"     using ($1*$1):($3)    notitle   axis x1y1 with lines dt 1 linecolor rgb markermint, \
     "square_measurements_o2.csv"     using ($1*$1):($3)    notitle   axis x1y1 with lines dt 1 linecolor rgb markerpink, \
     "square_measurements_vcno1.csv"  using ($1*$1):($3)    notitle   axis x1y1 with lines dt 1 linecolor rgb markercyan
# end plot 1,1

set key top left
set label 1 "Double Flip" at graph 0.37,0.94

# plot 2,1
plot \
     NaN with points pt 5 pointsize 0.6 lc rgb markergreen  title " chain - O1", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerred    title " chain - O2", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerblue   title " chain - VCN", \
     NaN with points pt 5 pointsize 0.6 lc rgb markermint   title " square - O1", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerpink   title " square - O2", \
     NaN with points pt 5 pointsize 0.6 lc rgb markercyan   title " square - VCN", \
     "chain_measurements_o1.csv"      using ($1):($4)       notitle   axis x1y1 with lines dt 2 linecolor rgb markergreen, \
     "chain_measurements_o2.csv"      using ($1):($4)       notitle   axis x1y1 with lines dt 2 linecolor rgb markerred, \
     "chain_measurements_vcno1.csv"   using ($1):($4)       notitle   axis x1y1 with lines dt 2 linecolor rgb markerblue, \
     "square_measurements_o1.csv"     using ($1*$1):($4)    notitle   axis x1y1 with lines dt 2 linecolor rgb markermint, \
     "square_measurements_o2.csv"     using ($1*$1):($4)    notitle   axis x1y1 with lines dt 2 linecolor rgb markerpink, \
     "square_measurements_vcno1.csv"  using ($1*$1):($4)    notitle   axis x1y1 with lines dt 2 linecolor rgb markercyan, \
     \
     "chain_measurements_o1.csv"      using ($1):($5)       notitle   axis x1y1 with lines dt 1 linecolor rgb markergreen, \
     "chain_measurements_o2.csv"      using ($1):($5)       notitle   axis x1y1 with lines dt 1 linecolor rgb markerred, \
     "chain_measurements_vcno1.csv"   using ($1):($5)       notitle   axis x1y1 with lines dt 1 linecolor rgb markerblue, \
     "square_measurements_o1.csv"     using ($1*$1):($5)    notitle   axis x1y1 with lines dt 1 linecolor rgb markermint, \
     "square_measurements_o2.csv"     using ($1*$1):($5)    notitle   axis x1y1 with lines dt 1 linecolor rgb markerpink, \
     "square_measurements_vcno1.csv"  using ($1*$1):($5)    notitle   axis x1y1 with lines dt 1 linecolor rgb markercyan
# end plot 2,1

set xlabel "number of sites"
unset key
set label 1 "Swapping/Hopping" at graph 0.37,0.94

# plot 3,1
plot \
     NaN with points pt 5 pointsize 0.6 lc rgb markergreen  title " chain - O1", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerred    title " chain - O2", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerblue   title " chain - VCN", \
     NaN with points pt 5 pointsize 0.6 lc rgb markermint   title " square - O1", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerpink   title " square - O2", \
     NaN with points pt 5 pointsize 0.6 lc rgb markercyan   title " square - VCN", \
     "chain_measurements_o1.csv"      using ($1):($6)       notitle   axis x1y1 with lines dt 2 linecolor rgb markergreen, \
     "chain_measurements_o2.csv"      using ($1):($6)       notitle   axis x1y1 with lines dt 2 linecolor rgb markerred, \
     "chain_measurements_vcno1.csv"   using ($1):($6)       notitle   axis x1y1 with lines dt 2 linecolor rgb markerblue, \
     "square_measurements_o1.csv"     using ($1*$1):($6)    notitle   axis x1y1 with lines dt 2 linecolor rgb markermint, \
     "square_measurements_o2.csv"     using ($1*$1):($6)    notitle   axis x1y1 with lines dt 2 linecolor rgb markerpink, \
     "square_measurements_vcno1.csv"  using ($1*$1):($6)    notitle   axis x1y1 with lines dt 2 linecolor rgb markercyan, \
     \
     "chain_measurements_o1.csv"      using ($1):($7)       notitle   axis x1y1 with lines dt 1 linecolor rgb markergreen, \
     "chain_measurements_o2.csv"      using ($1):($7)       notitle   axis x1y1 with lines dt 1 linecolor rgb markerred, \
     "chain_measurements_vcno1.csv"   using ($1):($7)       notitle   axis x1y1 with lines dt 1 linecolor rgb markerblue, \
     "square_measurements_o1.csv"     using ($1*$1):($7)    notitle   axis x1y1 with lines dt 1 linecolor rgb markermint, \
     "square_measurements_o2.csv"     using ($1*$1):($7)    notitle   axis x1y1 with lines dt 1 linecolor rgb markerpink, \
     "square_measurements_vcno1.csv"  using ($1*$1):($7)    notitle   axis x1y1 with lines dt 1 linecolor rgb markercyan
# end plot 3,1
