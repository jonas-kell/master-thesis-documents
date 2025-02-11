set terminal pdfcairo font "Libertinus Serif, 12pt" fontscale 0.68 size 30cm, 30cm       # sets output format, font and plotsize
set samples 900                                                                         # sets count for the amount of sampled points

set output "pauli-measurements.pdf"          # name of the output pdf

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
          set style line 999 dashtype 1 linewidth 1 linecolor rgb "#000008"       # legend linestyle
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
          sprintf("exact-exact-pauli_%s.csv", pauli_op)       using ($1 * U):2 notitle      axis x1y1 with line linewidth 1.8 linecolor rgb markerblue, \
          sprintf("compareo0-exact-pauli_%s.csv", pauli_op)   using ($1 * U):2 notitle      axis x1y1 with line linewidth 1.8 linecolor rgb markerorange, \
          sprintf("compareo1-exact-pauli_%s.csv", pauli_op)   using ($1 * U):2 notitle      axis x1y1 with line linewidth 1.8 linecolor rgb markergreen, \
          sprintf("compareo2-exact-pauli_%s.csv", pauli_op)   using ($1 * U):2 notitle      axis x1y1 with line linewidth 1.8 linecolor rgb markerred
          
}
     