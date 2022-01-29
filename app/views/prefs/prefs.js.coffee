$(document).on 'change', '#city_pref', ->
  $.ajax(
    type: 'GET'
    url: '/prefs/cities_select'
    data: {
    pref_id: $(this).val()
  }
  ).done(data) ->
  $('#cities_select').html(data)
