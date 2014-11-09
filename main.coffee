 # 1. <a href="http://puzlet.org/sci-comp/">Define a function</a>. For example ... 

 # A parabola defined by focus and directrix:
 # $f(x)=\left((x-a)^2+b^2-c^2\right)/(2(b-c))$
 
f = (x, a, b, c) ->
    ((x-a).pow(2) + b*b - c*c)/(2*(b-c))

 # Here focus is (a, b), directrix is y = c .
 # See <a href="http://mathgifs.blogspot.co.nz/2013/09/mathgifs-logo.html">@mathgifs</a>.
 
 # 2. <a href="http://puzlet.org/sci-comp/utils/">Define a figure</a>

fig = figure
    canvas: true
    height: 320
    series: 
        shadowSize: 0
        color: "green"
        lines: lineWidth: 1
    xaxis:
        min: -1
        max: 1
    yaxis:
        min: -1
        max: 1
    grid:
        backgroundColor: "white"


 # 3. <a href="http://puzlet.org/sci-comp/utils/">Plot function.</a>

A = linspace -0.45, 0.45, 100 # Array of a.
B = 9*A.pow(2) - 5/8 # Array if b.
c = -6/8

x = linspace -1, 1, 50
y = (f(x, a, B[i], c) for a, i in A) #; 

plot x, y, fig: fig

 # 4. <u>Animate</u>

frame = (n) -> plot x, y[0..n], fig: fig

spec =
    frame: frame
    delay: 100
    N: 7

 # Uncomment/de-indent to animate. 
 # new $blab.BasicAni spec # (<a href="http://puzlet.org/doc/anatomy/">$blab?</a>)

 # 5. <u>Create GIF</u>

 # Uncomment/de-indent for GIF. Watch console for progress. 
 # new $blab.BasicGif spec
