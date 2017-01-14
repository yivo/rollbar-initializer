###!
# rollbar-initializer 2.0.0 | https://github.com/yivo/rollbar-initializer | MIT License
###

initialize = do ->
  initialized = false

  ({config, token, env}) ->
    unless initialized
      if not token and not config?.token
        throw new TypeError('[Rollbar Initializer] Token not given')

      _rollbarConfig = config ?
      accessToken:                token
      captureUncaught:            true
      captureUnhandledRejections: true
      payload:                    { environment: env }

      try ```
        /* rollbar.snippet.js */
      ```

      initialized = true
    return

if (head = document.getElementsByTagName('head')[0])?
  meta = head.getElementsByTagName('meta')

  for el in meta when el.getAttribute('name') is 'rollbar:env'
    env = el.getAttribute('content')
    break

  for el in meta
    switch el.getAttribute('name')
      when 'rollbar:config'
        json = el.getAttribute('content')
        try config = JSON?.parse(json) ? $?.parseJSON(json)
        initialize({config, env}) if config?
        break
      when 'rollbar:access_token'
        token = el.getAttribute('content')
        initialize({token, env}) if token
        break
