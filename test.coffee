class Canvas

    constructor: (@spec) ->

        @element = $(@spec.id)[0] 
        @element.width = @spec.width
        @element.height = @spec.height
        @ctx = @element.getContext('2d')
        
    clear: -> @ctx.clearRect(0, 0, @spec.width, @spec.height)

    rect: (pos, size, color) ->
        @ctx.fillStyle = color
        @ctx.fillRect(pos.x, pos.y, size.dx, size.dy)

canvas = new Canvas
    id: "#bitmap"
    width: 300
    height: 150


encoder = new GIFEncoder()
encoder.setRepeat 0 #auto-loop
encoder.setDelay 500
console.log encoder.start()

canvas.clear()
canvas.rect({x:10, y:10}, {dx:75, dy:50}, "rgb(200,0,0)")
encoder.addFrame(canvas.ctx)
canvas.rect({x:30, y:30}, {dx:55, dy:50}, "rgb(20,0,200)")
encoder.addFrame(canvas.ctx)

encoder.finish()
$("#image")[0].src = "data:image/gif;base64," + encode64(encoder.stream().getData())


