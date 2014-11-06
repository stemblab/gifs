class $blab.BasicGif

    constructor: (@spec) ->
        @spec.gifId = "#image"
        @spec.baseId ?= ".flot-base"
        @spec.repeat ?= 0
        @spec.delay ?= 100

        @init()
        @build()

    init: ->
        @spec.frame(0) # create canvas
        @baseCanvas = $(@spec.baseId)[0] # element
        @baseCtx = @baseCanvas.getContext('2d') # context

        @width = @baseCanvas.width
        @height = @baseCanvas.height

        @encoder = new GIFEncoder()
        @encoder.setRepeat @spec.repeat
        @encoder.setDelay @spec.delay
        @encoder.setSize @width, @height
        @encoder.start()
        
    snapshot: (n) ->
        @spec.frame(n)
        @encoder.addFrame(@baseCtx)

    build: ->
        @snapshot(n) for n in [0..3]
        @encoder.finish()
        data = encode64(@encoder.stream().getData())
        $(@spec.gifId)[0].src = "data:image/gif;base64," + data 

