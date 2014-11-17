 # <a href="http://books.google.co.nz/books?id=ubpVcMgoLgEC">Envelope of lines</a>
 # Lines perpendicular to $y=x^2$.
fn = (x, t) -> t*t - 1/(2*t)*(x-t)

fig = figure
    canvas: true
    height: 320
    series: 
        shadowSize: 0
        color: "green"
        lines: lineWidth: 1
    xaxis:
        min: -2
        max: 2
    yaxis:
        min: -1
        max: 3

T = linspace -1.7, 1.7, 50 #;
x = [2, -2]
y = (fn(x, t) for t in T) #;

plot x, y, fig: fig

frame = (n) -> plot x, y[0..n], fig: fig

spec =
    frame: frame
    delay: 100
    N: 50
    makeGif: false

# new $blab.BasicGif spec
