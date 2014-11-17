 # 1. <a href="http://puzlet.org/sci-comp/">Define a function</a>. For example ... 

 # A parabola by focus and directrix:
 # $f(x)=\left((x-a)^2+b^2-c^2\right)/(2(b-c))$
 
f = (x, a, b, c) ->
    ((x-a).pow(2) + b*b - c*c)/(2*(b-c))

 # Focus is (a, b), directrix is y = c.
 # See <a href="http://mathgifs.blogspot.co.nz/2013/09/mathgifs-logo.html">@mathgifs</a>.
 
 # 2. <a href="http://puzlet.org/sci-comp/utils/">Define a figure</a>

fig = figure
    canvas: true # false to omit labels
    height: 320 # px
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

 # 3. <a href="http://puzlet.org/sci-comp/utils/">Plot function.</a>

 # Sweep the function's parameters and plot
 # on right (to debug, not to animate.)
 # (shift+enter to execute)
     
A = linspace -0.45, 0.45, 50 # Array of a.
B = 9*A.pow(2) - 5/8 # Array of b.
c = -6/8

x = linspace -1, 1, 50
y = (f(x, a, B[i], c) for a, i in A) #; 

plot x, y, fig: fig

 # 4. <u>Animate</u>

 # Choose the nth animation frame, the
 # delay between frames, and the total
 # number of frames.

spec =
    frame: (n) -> plot x, y[0..n], fig: fig
    delay: 100 # ms
    N: 50 # total frames
    makeGif: false

 # Uncomment/de-indent to check animation
 # on the right (shift+enter to execute). 
 # new $blab.BasicGif spec # (<a href="http://puzlet.org/doc/anatomy/">$blab?</a>)

 # 5. <u>Create GIF</u>

 # Change makeGif to true in spec above,
 # then run again (shift+enter).

 # Will take a few moments to generate.
 # Right click to save.
