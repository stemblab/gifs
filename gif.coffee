# Create basic GIF animation.

class $blab.BasicGif

    constructor: (@spec) ->
        @spec.gifId = "#image" # <img> where GIF appears
        @spec.baseId ?= ".flot-base" # flot canvas
        @spec.repeat ?= 0 # 0 means loop
        @spec.delay ?= 100 # ms

        @init()
        @build()

    init: ->
        @spec.frame(0) # initiate canvas using first frame
        @baseCanvas = $(@spec.baseId)[0] # element
        @baseCtx = @baseCanvas.getContext('2d') # context

        @width = @baseCanvas.width
        @height = @baseCanvas.height

        @encoder = new GIFEncoder()
        @encoder.setRepeat @spec.repeat
        @encoder.setDelay @spec.delay
        @encoder.setSize @width, @height
        @encoder.start()
        
    build: ->
        @snapshot(0)
        @encoder.finish()
        data = encode64(@encoder.stream().getData())
        $(@spec.gifId)[0].src = "data:image/gif;base64," + data 

    snapshot: (n) ->
        return if n>@spec.N-1
        @spec.frame(n)
        @encoder.addFrame(@baseCtx)
        $("#progressbar").progressbar value: n/(@spec.N-1)*100
        setTimeout @snapshot n+1, 0

