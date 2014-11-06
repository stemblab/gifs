class $blab.BasicAni

    constructor: (@spec) ->
        @spec.delay ?= 100
        @spec.N ?= 5

        @snapshot 0
        
    snapshot: (n) ->
        return if n>@spec.N-1
        @spec.frame(n)
        setTimeout (=> @snapshot n+1), @spec.delay
