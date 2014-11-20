# Create basic GIF animation.

class $blab.BasicGif

    gifId: "#gif"
    thumbId: "#thumb"
    baseId: ".flot-base" # flot canvas
            
    constructor: (@spec) ->
        
        if @spec.makeGif # make animated gif
            @init()
            @build()
        else # animate in eval panel
            $(@gifId)[0].src = ""
            $(@thumbId)[0].src = ""
            @evalAni(0) 
            
    init: ->
        @spec.delay ?= 100 # ms
        @spec.repeat ?= 0 # 0 means loop

        @baseCanvas = $(@baseId)[0] # element
        @baseCtx = @baseCanvas.getContext('2d') # context
        @width = @baseCanvas.width
        @height = @baseCanvas.height

        @spec.frame(0) # initiate canvas using first frame

        # animated GIF
        @gif = new GIFEncoder()
        @gif.setRepeat @spec.repeat
        @gif.setDelay @spec.delay
        @gif.setSize @width, @height
        @gif.start()

        # thumbnail (last frame)
        @thumb = new GIFEncoder()
        @thumb.setRepeat 1
        @thumb.setDelay 0
        @thumb.setSize @width, @height
        @thumb.start()
        
    build: ->
        @snapshot(0)
        @gif.finish()
        @thumb.finish()

        data = encode64(@gif.stream().getData())
        $(@gifId)[0].src = "data:image/gif;base64," + data 

        data = encode64(@thumb.stream().getData())
        $(@thumbId)[0].src = "data:image/gif;base64," + data 

    snapshot: (n) ->
        return if n>@spec.N-1
        @spec.frame(n) # draw nth frame

        # white background.
        # http://www.mikechambers.com/blog/2011/01/31...
        # /setting-the-background-color-when-generating-images-from-canvas-todataurl/
        @baseCtx.globalCompositeOperation = "destination-over"
        @baseCtx.fillStyle = "#fff"
        @baseCtx.fillRect(0,0,@width,@height)
        
        @thumb.addFrame(@baseCtx) if n is @spec.N-1
        @gif.addFrame(@baseCtx)
        setTimeout @snapshot(n+1), 0

    evalAni: (n) ->
        return if n>@spec.N-1
        @spec.frame(n) # draw nth frame
        setTimeout (=> @evalAni(n+1)), @spec.delay
