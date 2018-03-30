//= require select2.full

function select2_graves_dropdown(selector) {


  $(selector).select2({
    ajax: {
      delay: 130,
      url: function(){
        return $(this).data() && $(this).data().url
      },
      dataType: 'json',
      data: function (params) {
        var query = {
          q: params.term,
          page: params.page,
          type: $('#grave_id').val(),
          gender: $("input[name='grave[gender]']:checked").val()
        };
        // Query paramters will be ?search=[term]&page=[page]
        return query;
      }, processResults: function (data, params) {
        params.page = params.page || 1;
        return {
          results: data,
          pagination: {
            more: (params.page * 30) < data.total_count
          }
        };
      }
    },
    minimumInputLength: 3
  });

}