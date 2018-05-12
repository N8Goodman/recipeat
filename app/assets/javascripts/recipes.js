$("#ingredients a.add_fields").
  data("association-insertion-position", 'before').
  data("association-insertion-node", 'this');

$('#ingredients').on('cocoon:after-insert', function() {
  $(".recipe-ingredient-fields a.add_fields").
    data("association-insertion-position", 'before').
    data("association-insertion-node", 'this');
  $('.recipe-ingredient-fields').on('cocoon:after-insert', function() {
    $(this).children(".ingredient_from_list").remove();
    $(this).children("a.add_fields").hide();
  });
});
