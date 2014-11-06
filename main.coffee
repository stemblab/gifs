# From: <a href="http://mathgifs.blogspot.com/2013/12/mathematical-envelopes.html">@mathgifs</a> 

# focii (as, bs), directrix y = c,
as = linspace -0.45, 0.45, 100
bs = 9*as.pow(2) - 5/8
c = -6/8

 # $f(x)=\left((x-a)^2+b^2-c^2\right)/(2(b-c))$

f = (x, a, b, c) ->
    ((x-a).pow(2) + b*b - c*c)/(2*(b-c))

x = linspace -1, 1, 50
y = (f(x, a, bs[i], c) for a, i in as) #; 

fig = figure
    height: 400
    xlabel: "x"
    ylabel: "y"
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
        
frame = (n) -> plot x, y[0..n], fig: fig
            
gif = new $blab.BasicGif
    frame: frame

###
# Animation
delay = 10  # Snapshot delay (10ms)
snapshot = (n) ->
    return if n>y.length-1
    frame(n) # plot x, y[0..n], fig: fig
    setTimeout (-> snapshot n+1), delay

setTimeout (-> snapshot 0), 2000 #; 2s delay
###
                 
