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

class BasicGif

    constructor: (@spec) ->

        @spec.baseId ?= ".flot-base"
        @spec.overId ?= ".flot-overlay" 
        
        @encoder = new GIFEncoder()
        @encoder.setRepeat 0 #auto-loop
        @encoder.setDelay 100
        @encoder.start()

        @init()
        @build()

    init: ->

        plot [], [], fig: @spec.fig
        @baseCtx = $(@spec.baseId)[0].getContext('2d')
        @overCtx = $(@spec.overId)[0].getContext('2d')
        
    snapshot: (n) ->
        plot @spec.x, @spec.y[0..n], fig: @spec.fig
        @encoder.addFrame(@baseCtx)

    build: ->
        @snapshot(n) for n in [0..2]
        @encoder.addFrame(@overCtx)
        @encoder.finish()
        data = encode64(@encoder.stream().getData())
        $("#image")[0].src = "data:image/gif;base64," + data 
            
gif = new BasicGif
    fig: fig
    x: x
    y: y

