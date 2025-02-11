set terminal pdfcairo font "Libertinus Serif, 12pt" fontscale 0.68 size 7cm, 7cm       # sets output format, font and plotsize
set samples 900                                                                         # sets count for the amount of sampled points

set output "binary-entropy-function.pdf"          # name of the output pdf

set key Left                                                            # key text justify left
set key left top                                                        # moves legend
set style line 999 dashtype 1 linewidth 1 linecolor rgb "#000008"       # legend linestyle
set key box linestyle 999                                               # apply box style
set key spacing 1.3          

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

lgtwo(x) = log(x) / log(2)

h(x) = -(x*lgtwo(x) + (1-x) * lgtwo(1-x))

# plot

set xrange [0:1] 
set xtics 0.2
set mxtics 5
set ytics 0.2
set mytics 5
set yrange [0:1] 

plot \
     NaN with points pt 5 pointsize 0.6 lc rgb markerblue   title " y=x", \
     NaN with points pt 5 pointsize 0.6 lc rgb markerred    title " y=E(x)", \
     x notitle      axis x1y1 with line linewidth 1.8 linecolor rgb markerblue, \
     h(0.5+0.5*sqrt(1-x**2)) notitle      axis x1y1 with line linewidth 1.8 linecolor rgb markerred