set terminal pdfcairo font "Libertinus Serif, 12pt" fontscale 0.68 size 7cm, 7cm       # sets output format, font and plotsize
set samples 900                                                                         # sets count for the amount of sampled points

set output "binary-entropy-function.pdf"          # name of the output pdf

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

set key Left                                                            # key text justify left
set key left top                                             # moves legend
set style line 999 dashtype 1 linewidth 1 linecolor rgb "#0000AA"       # legend linestyle
set key box linestyle 999                                               # apply box style
set key spacing 1.3          

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
     h(0.5+0.5*sqrt(1-x**2)) notitle      axis x1y1 with line linewidth 1.8 linecolor rgb markerred,