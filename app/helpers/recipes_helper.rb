module RecipesHelper
  def favorite_star(recipe, size)
    recipe.favorite? ? "<i class='material-icons md-#{size} fav'>star</i>".html_safe : "<i class='material-icons md-#{size}'>star_border</i>".html_safe
  end

  def favorite_button(recipe, size)
    button_to recipe, remote: true, method: :put, params: {recipe: {favorite: !recipe.favorite? } }, class: 'btn btn-default' do
      favorite_star(recipe,size)
    end
  end
end
