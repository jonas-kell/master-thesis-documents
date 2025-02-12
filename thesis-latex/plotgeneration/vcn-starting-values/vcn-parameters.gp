set terminal pdfcairo font "Libertinus Serif, 12pt" fontscale 0.68 size 25cm, 33cm       # sets output format, font and plotsize
set samples 900                                                                         # sets count for the amount of sampled points

set output "vcn-parameters.pdf"          # name of the output pdf

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

set multiplot layout 3,2 rowsfirst

# axes and label
set xrange [] 
set xtics 0.2
set mxtics 4
set mytics 4

set yrange [-0.65:0.65]
set xrange [:1.4]

parameters = "param0 param1 param2 param3 param4 param5"

do for [i = 1:words(parameters)] {
     vcnparam = word(parameters, i)
     if (vcnparam eq "param0") {
          set label "x-Axis: time [1/U]" at graph 0.37,0.10

          set key Left                                                            # key text justify left
          set key at graph 0.40,0.41                                              # moves legend
          set style line 999 dashtype 1 linewidth 1 linecolor rgb "#000008"       # legend linestyle
          set key box linestyle 999                                               # apply box style
          set key spacing 1                                                       # vertical spacing of entries

          unset key
     } else {
          unset key
          unset label
     }
     set ylabel sprintf("Variational Parameter %d", i)
     plot \
          NaN with points pt 5 pointsize 0.6 lc rgb markerred    title " a", \
          NaN with points pt 5 pointsize 0.6 lc rgb markergreen  title " a", \
          NaN with points pt 5 pointsize 0.6 lc rgb markerblue   title " a", \
          NaN with points pt 5 pointsize 0.6 lc rgb markerorange title " a", \
          NaN with points pt 5 pointsize 0.6 lc rgb markerpink   title " a", \
          sprintf("11-exact-param%dre.csv", i-1)     using ($1 * U):2 notitle      axis x1y1 with line linewidth 1.8 linecolor rgb markerred, \
          sprintf("22-exact-param%dre.csv", i-1)     using ($1 * U):2 notitle      axis x1y1 with line linewidth 1.8 linecolor rgb markergreen, \
          sprintf("33-exact-param%dre.csv", i-1)     using ($1 * U):2 notitle      axis x1y1 with line linewidth 1.8 linecolor rgb markerblue, \
          sprintf("44-exact-param%dre.csv", i-1)     using ($1 * U):2 notitle      axis x1y1 with line linewidth 1.8 linecolor rgb markerorange, \
          sprintf("55-exact-param%dre.csv", i-1)     using ($1 * U):2 notitle      axis x1y1 with line linewidth 1.8 linecolor rgb markerpink, \
          \
          sprintf("11-exact-param%dim.csv", i-1)     using ($1 * U):2 notitle      axis x1y1 with line dashtype 2 linewidth 2.0 linecolor rgb markerred, \
          sprintf("22-exact-param%dim.csv", i-1)     using ($1 * U):2 notitle      axis x1y1 with line dashtype 2 linewidth 2.0 linecolor rgb markergreen, \
          sprintf("33-exact-param%dim.csv", i-1)     using ($1 * U):2 notitle      axis x1y1 with line dashtype 2 linewidth 2.0 linecolor rgb markerblue, \
          sprintf("44-exact-param%dim.csv", i-1)     using ($1 * U):2 notitle      axis x1y1 with line dashtype 2 linewidth 2.0 linecolor rgb markerorange, \
          sprintf("55-exact-param%dim.csv", i-1)     using ($1 * U):2 notitle      axis x1y1 with line dashtype 2 linewidth 2.0 linecolor rgb markerpink
          
}