set terminal pdfcairo font "Libertinus Serif, 12pt" fontscale 0.68 size 30cm, 30cm       # sets output format, font and plotsize
set samples 600                                                                         # sets count for the amount of sampled points

set output "pauli-measurements.pdf"          # name of the output pdf

# legend
unset key

# colors 
markerred="#AA0000"
markergreen="#00AA00"
markerblue="#0000AA"
markeryellow="#EEBE00"
linered="#FF9999"
linegreen="#77FF77"
lineblue="#9999FF"
lineyellow="#F6D140"

# plot
set datafile separator ','

U = 1.0

set multiplot layout 4,4 rowsfirst

# axes and label
set xrange [] 
set xtics 1
set mxtics 2
set xlabel "time [1/U]"

set mytics 5

pauli_ops = "00 0x 0y 0z x0 xx xy xz y0 yx yy yz z0 zx zy zz"

do for [pauli_op in pauli_ops] {
     if (pauli_op eq "00") {
          set yrange [0.999:1.001]
     } else {
          unset yrange
     }
     set ylabel sprintf("Pauli %s", pauli_op)
     plot \
          sprintf("exact-exact-pauli_%s.csv", pauli_op)       using ($1 / U):2 notitle      axis x1y1 pointtype 16 pointsize 0.5 linecolor rgb markerred, \
          sprintf("compareo0-exact-pauli_%s.csv", pauli_op)   using ($1 / U):2 notitle      axis x1y1 pointtype 16 pointsize 0.5 linecolor rgb markeryellow, \
          sprintf("compareo1-exact-pauli_%s.csv", pauli_op)   using ($1 / U):2 notitle      axis x1y1 pointtype 16 pointsize 0.5 linecolor rgb markerblue, \
          sprintf("compareo2-exact-pauli_%s.csv", pauli_op)   using ($1 / U):2 notitle      axis x1y1 pointtype 16 pointsize 0.5 linecolor rgb markergreen
          
}
     