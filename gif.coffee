class $blab.BasicGif

    constructor: (@spec) ->
        @spec.baseId ?= ".flot-base"
        #@spec.overId ?= ".flot-overlay" 
        
        @encoder = new GIFEncoder()
        @encoder.setRepeat 0 #auto-loop
        @encoder.setDelay 100
        @encoder.setSize 400, 400
        @encoder.start()

        @init()
        @build()

    init: ->
        @spec.frame(0)
        @baseCtx = $(@spec.baseId)[0].getContext('2d')
        #@overCtx = $(@spec.overId)[0].getContext('2d')

        #my_gradient = @baseCtx.createLinearGradient(0, 0, 300, 0)
        #my_gradient.addColorStop(0, "black");
        #my_gradient.addColorStop(1, "white");
        #@baseCtx.fillStyle = my_gradient #"rgb(255,255,255)";
        #@baseCtx.fillRect(0,0,400,400); #GIF can't do transparent so do white

        @baseCtx.fillStyle = "blue"
        @baseCtx.fillRect(0,0,400,400)
        #@overCtx.fillStyle = "#fff"
        #@overCtx.fillRect(0,0,400,400)
        
    snapshot: (n) ->
        @spec.frame(n)
        @encoder.addFrame(@baseCtx)

    build: ->
        @snapshot(n) for n in [0..3]
        #@encoder.addFrame(@overCtx)
        @encoder.finish()
        data = encode64(@encoder.stream().getData())
        $("#image")[0].src = "data:image/gif;base64," + data 

