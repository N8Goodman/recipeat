$(document).ready(function(){
  $('select').select2({theme: "bootstrap"});
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

