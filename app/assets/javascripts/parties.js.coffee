$("select.state").live 'change', ->
  state = this
  $.ajax
    url: "/locations/cities_for",
    datatype: "json",
    type: "GET",
    data:
      state_id: $(this).val(),
    success: (data) ->
      $(state).parents("form").find('select.city').empty()
      city = $(state).parents("form").find('select.city')
      $(data).each ->
        $(city).append $("<option>", {
          value: this.id,
          text: this.name
        })