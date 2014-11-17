# <a href="https://en.wikipedia.org/wiki/Hypocycloid">Hypocycloid</a>
fx = (t, r, k) -> r*(k-1)*cos(t) + r*cos((k-1)*t)
fy = (t, r, k) -> r*(k-1)*sin(t) - r*sin((k-1)*t)

r = 1
k = 2.1
t = linspace 0, 2*pi*10, 50 #;

x = fx(t, r, k)
y = fy(t, r, k)

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
        min: -2
        max: 2

plot x, y, fig: fig

frame = (n) -> plot x, y[0..n], fig: fig

spec =
    frame: frame
    delay: 50
    N: 100
    makeGif: false

# new $blab.BasicGif spec
