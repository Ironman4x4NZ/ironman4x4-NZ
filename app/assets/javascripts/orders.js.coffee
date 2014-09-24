$(document).on 'page:load ready', ->
  $('#wishlist .next.btn').on 'click', ->
    nextTab = $(@).data('next-tab')
    $('#wishlist ul[role=tablist] a[href="#' + nextTab + '"]').tab('show').focus().blur()

  setClassesForTabs = (active) ->
    currentIndex = 0

    $('#wishlist ul[role=tablist] a').each (i, tab) ->
      if tab == active
        currentIndex = i

    $('#wishlist ul[role=tablist] li').each (i) ->
      if i < currentIndex
        $(@).addClass 'completed'
      else
        $(@).removeClass 'completed'
      if i > currentIndex
        $(@).addClass 'incomplete'
      else
        $(@).removeClass 'incomplete'

  $('#wishlist a[data-toggle="tab"]').on 'shown.bs.tab', (e) ->
    setClassesForTabs e.target
    $.cookie 'wishlist-tab', e.target.hash

  tab = $.cookie 'wishlist-tab'
  if tab? and tab
    $('#wishlist ul[role=tablist] a[href="' + tab + '"]').tab('show').focus().blur()
    if tab is '#wishlist-review'
      setClassesForTabs active
  else
    active = $('#wishlist a[data-toggle="tab"].active').get(0)
    setClassesForTabs active
