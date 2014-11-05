canvas = document.getElementById("bitmap")
context = canvas.getContext("2d")
my_gradient = context.createLinearGradient(0, 0, 300, 0)
my_gradient.addColorStop 0, "black"
my_gradient.addColorStop 1, "white"
context.fillStyle = my_gradient #"rgb(255,255,255)";
context.fillRect 0, 0, canvas.width, canvas.height #GIF can't do transparent so do white
encoder = new GIFEncoder()
encoder.setRepeat 0 #auto-loop
encoder.setDelay 500
console.log encoder.start()
context.fillStyle = "rgb(200,0,0)"
context.fillRect 10, 10, 75, 50
console.log encoder.addFrame(context)
context.fillStyle = "rgb(20,0,200)"
context.fillRect 30, 30, 55, 50
console.log encoder.addFrame(context)
encoder.finish()
document.getElementById("image").src = "data:image/gif;base64," + encode64(encoder.stream().getData())
