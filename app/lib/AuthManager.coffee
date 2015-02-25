Facebook  = require "lib/facebook"

class AuthManager
    constructor:()->
        if App.debug
            console.log "Auth Manager init"

    login:(service,callback=null)=>
        $dataDfd = $.Deferred()
        switch service
            when 'facebook'
                console.log "switch", service
                Facebook.login $dataDfd

        $dataDfd.done (res) => @authSuccess service, res
        $dataDfd.fail (res) => @authFail service, res
        $dataDfd.always () => @authCallback callback

        return
        # $dataDfd

    authSuccess:(service,response)->
        console.log "login success", response
        return

    authFail:(service, response) ->
        console.log "login fail", response
        return

    authCallback:(callback=null)->
        callback?()
        return

module.exports = AuthManager