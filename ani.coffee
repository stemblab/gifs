# Basic animation.

class $blab.BasicAni

    constructor: (@spec) ->
        @spec.delay ?= 100 # delay between frames (ms)
        @spec.N ?= 5 # Number of frames.
        @snapshot 0 # Recurse from 0
        
    snapshot: (n) ->
        return if n>@spec.N-1
        @spec.frame(n)
        setTimeout (=> @snapshot n+1), @spec.delay
