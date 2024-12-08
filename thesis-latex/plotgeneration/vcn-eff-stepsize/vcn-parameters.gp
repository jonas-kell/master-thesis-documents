set terminal pdfcairo font "Libertinus Serif, 12pt" fontscale 0.68 size 25cm, 25cm       # sets output format, font and plotsize
set samples 900                                                                         # sets count for the amount of sampled points

set output "vcn-params.pdf"          # name of the output pdf

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

set multiplot layout 3,2 rowsfirst

# axes and label
set xrange [] 
set xtics 1
set mxtics 2
set mytics 5

parameters = "param0 param1 param2 param3 param4 param5"

do for [i = 1:words(parameters)] {
     vcnparam = word(parameters, i)
     if (vcnparam eq "param0") {
          set label "x-Axis: time [1/U]" at graph 0.20,0.92

          set key Left                                                            # key text justify left
          set key at graph 0.40,0.31                                              # moves legend
          set style line 999 dashtype 1 linewidth 1 linecolor rgb "#0000AA"       # legend linestyle
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
          NaN with points pt 5 pointsize 0.6 lc rgb markermint   title " Re(var.).", \
          NaN with points pt 5 pointsize 0.6 lc rgb markerorange title " Im(var.)", \
          sprintf("comparevcnanalytical-exact-param%dre.csv", i-1)       using ($1 * U):2 notitle      axis x1y1 with line linewidth 1.8 linecolor rgb markerblue, \
          sprintf("comparevcnanalytical-exact-param%dim.csv", i-1)       using ($1 * U):2 notitle      axis x1y1 with line linewidth 1.8 linecolor rgb markerred, \
          sprintf("comparevcn0006-exact-param%dre.csv", i-1)                 using ($1 * U):2 notitle      axis x1y1 with line linewidth 1.8 linecolor rgb markermint, \
          sprintf("comparevcn0006-exact-param%dim.csv", i-1)                 using ($1 * U):2 notitle      axis x1y1 with line linewidth 1.8 linecolor rgb markerorange
          
}