set terminal pdfcairo font "Libertinus Serif, 12pt" fontscale 0.68 size 25cm, 25cm       # sets output format, font and plotsize
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
set xtics 0.5
set mxtics 5
set mytics 5
set yrange [-1.5:1.5] 

parameters = "param0 param1 param2 param3 param4 param5"

do for [i = 1:words(parameters)] {
     vcnparam = word(parameters, i)
     if (vcnparam eq "param0") {
          set label "x-Axis: time [1/U]" at graph 0.20,0.92

          set key Left                                                            # key text justify left
          set key at graph 0.40,0.31                                              # moves legend
          set style line 999 dashtype 1 linewidth 1 linecolor rgb "#000008"       # legend linestyle
          set key box linestyle 999                                               # apply box style
          set key spacing 1                                                       # vertical spacing of entries
     } else {
          unset key
          unset label
     }
     set ylabel sprintf("Variational Param. %d", i)
     plot \
          NaN with points pt 5 pointsize 0.6 lc rgb markerblue   title " Re(ana.)", \
          NaN with points pt 5 pointsize 0.6 lc rgb markerred    title " Im(ana.)", \
          NaN with points pt 5 pointsize 0.6 lc rgb markermint   title " Re(var.)", \
          NaN with points pt 5 pointsize 0.6 lc rgb markerorange title " Im(var.)", \
          sprintf("comparevcnanalytical-exact-param%dre.csv", i-1)       using ($1 * U):2 notitle      axis x1y1 with line linewidth 1.8 linecolor rgb markerblue, \
          sprintf("comparevcnanalytical-exact-param%dim.csv", i-1)       using ($1 * U):2 notitle      axis x1y1 with line dashtype 2 linewidth 2.0 linecolor rgb markerred, \
          sprintf("comparevcn0006-exact-param%dre.csv", i-1)             using ($1 * U):2 notitle      axis x1y1 with line linewidth 1.8 linecolor rgb markermint, \
          sprintf("comparevcn0006-exact-param%dim.csv", i-1)             using ($1 * U):2 notitle      axis x1y1 with line dashtype 2 linewidth 2.0 linecolor rgb markerorange
          
}