set terminal pdfcairo font "Libertinus Serif, 12pt" fontscale 0.68 size 25cm, 25cm       # sets output format, font and plotsize
set samples 900                                                                         # sets count for the amount of sampled points

set output "vcn-parameters.pdf"          # name of the output pdf

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
set xtics 0.1
set mxtics 1
set mytics 5

set yrange [-1:1]

parameters = "param0 param1 param2 param3 param4 param5"

do for [i = 1:words(parameters)] {
     vcnparam = word(parameters, i)
     if (vcnparam eq "param0") {
          set label "x-Axis: time [1/U]" at graph 0.50,0.10

          set key Left                                                            # key text justify left
          set key at graph 0.40,0.41                                              # moves legend
          set style line 999 dashtype 1 linewidth 1 linecolor rgb "#0000AA"       # legend linestyle
          set key box linestyle 999                                               # apply box style
          set key spacing 1                                                       # vertical spacing of entries
     } else {
          unset key
          unset label
     }
     set ylabel sprintf("Variational Param. %d", i)
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