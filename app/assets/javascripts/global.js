$(document).ready(function(){
  $('select').select2({theme: "bootstrap"});
  autoFilters();
});
ingredient = {
  init: function(ingredients) {
    let list = $.map(ingredients, function(val){
      return JSON.parse(val).name;
    });
    $('.ingredient-select').select2({theme: "bootstrap", tags: true, multiple: true});
    
    if(list.length > 0) {
      $('.ingredient-select').val(list).trigger('change')
    }
  },
}

var autoFilters = function() {
  autoSelect();
  autoSearch();
}

var autoSelect = function() {
  $('.auto-select-filter').on("select2:close", function(e) {
    $(this.form).trigger('submit.rails');
  });
}

var autoSearch = function() {
  $('.auto-search').bind('input', function() {
    $(this.form).trigger('submit.rails');
  });
}

