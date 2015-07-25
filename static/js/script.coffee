((i, s, o, g, r, a, m) ->
  i['GoogleAnalyticsObject'] = r
  i[r] = i[r] or ->
    (i[r].q = i[r].q or []).push arguments
    return

  i[r].l = 1 * new Date
  a = s.createElement(o)
  m = s.getElementsByTagName(o)[0]
  a.async = 1
  a.src = g
  m.parentNode.insertBefore a, m
  return
) window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga'
ga 'create', 'UA-29444107-3', 'auto'
ga 'send', 'pageview'

fjs = document.getElementsByTagName('script')[0]
p = if /^http:/.test(document.location) then 'http' else 'https'
if !document.getElementById('twitter-wjs')
  js = document.createElement('script')
  js.id = 'twitter-wjs'
  js.src = p + '://platform.twitter.com/widgets.js'
  fjs.parentNode.insertBefore js, fjs

window.fbAsyncInit = ->
  FB.init
    appId: '1665224310380927'
    xfbml: true
    version: 'v2.4'
  return

if !document.getElementById('facebook-jssdk')
  js = document.createElement('script')
  js.id = 'facebook-jssdk'
  js.src = '//connect.facebook.net/pt_BR/sdk.js#xfbml=1&version=v2.4&appId=1665224310380927'
  fjs.parentNode.insertBefore js, fjs

window.aguarde = ->
  alert 'Aguarde, gerando hinário...'
