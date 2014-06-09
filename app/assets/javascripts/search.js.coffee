jQuery ->

  $('#search_departure_id').change ->
    $("#search_destination_id option").show()
    departure = $('#search_departure_id :selected').val()
    $("#search_destination_id option[value='#{departure}']").hide()

  $('#search_destination_id').change ->
    $("#search_departure_id option").show()
    destination = $('#search_destination_id :selected').val()
    $("#search_departure_id option[value='#{destination}']").hide()




