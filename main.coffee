 # Compute with ctrl+enter
 # <a href="gallery"a>Gallery</a>

 # 1. <a href="maths">Define a function</a> 
 # E.g.: $f(x)=\left((x-a)^2+b^2-c^2\right)/(2(b-c))$
 
f = (x, a, b, c) ->
    ((x-a).pow(2) + b*b - c*c)/(2*(b-c))

 # Focus (a, b), directrix y = c (<a href="http://mathgifs.blogspot.com/2013/12/mathematical-envelopes.html">@mathgifs</a>).

 # 2. <a href="maths">Define a figure</a>

fig = figure
    canvas: true
    height: 400
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





 # 3. <a href="plotting">Plot function.</a>
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

 # Uncomment/de-indent to animate. (<a href="imports">$blab?</a>)
 # new $blab.BasicAni spec

 # 5. <u>Create GIF</u>

 # new $blab.BasicGif spec
