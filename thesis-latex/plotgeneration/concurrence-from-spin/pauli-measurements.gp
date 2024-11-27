set terminal pdfcairo font "Libertinus Serif, 12pt" fontscale 0.68 size 30cm, 30cm       # sets output format, font and plotsize
set samples 900                                                                         # sets count for the amount of sampled points

set output "pauli-measurements.pdf"          # name of the output pdf

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

set multiplot layout 4,4 rowsfirst

# axes and label
set xrange [] 
set xtics 1
set mxtics 2
set mytics 5

pauli_ops = "00 0x 0y 0z x0 xx xy xz y0 yx yy yz z0 zx zy zz"

do for [pauli_op in pauli_ops] {
     if (pauli_op eq "00") {
          set yrange [0.999:1.001]
          set label "x-Axis: time [1/U]" at graph 0.23,0.92

          set key Left                                                            # key text justify left
          set key bottom center                                                   # moves legend
          set style line 999 dashtype 1 linewidth 1 linecolor rgb "#0000AA"       # legend linestyle
          set key box linestyle 999                                               # apply box style
          set key spacing 1                                                       # vertical spacing of entries
     } else {
          unset yrange
          unset key
          unset label
     }
     set ylabel sprintf("Pauli %s", pauli_op)
     plot \
          NaN with points pt 5 pointsize 0.6 lc rgb markerblue   title " Exact", \
          NaN with points pt 5 pointsize 0.6 lc rgb markerorange   title " O0-pert.", \
          NaN with points pt 5 pointsize 0.6 lc rgb markergreen title " O1-pert.", \
          NaN with points pt 5 pointsize 0.6 lc rgb markerred    title " O2-pert.", \
          sprintf("exact-exact-pauli_%s.csv", pauli_op)       using ($1 / U):2 notitle      axis x1y1 with line linewidth 1.8 linecolor rgb markerblue, \
          sprintf("compareo0-exact-pauli_%s.csv", pauli_op)   using ($1 / U):2 notitle      axis x1y1 with line linewidth 1.8 linecolor rgb markerorange, \
          sprintf("compareo1-exact-pauli_%s.csv", pauli_op)   using ($1 / U):2 notitle      axis x1y1 with line linewidth 1.8 linecolor rgb markergreen, \
          sprintf("compareo2-exact-pauli_%s.csv", pauli_op)   using ($1 / U):2 notitle      axis x1y1 with line linewidth 1.8 linecolor rgb markerred
          
}
     