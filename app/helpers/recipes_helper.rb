module RecipesHelper
  def favorite_star(recipe)
    recipe.favorite? ? "<i class='material-icons md-48 fav fav-auto-check'>star</i>".html_safe : "<i class='material-icons md-48 fav-auto-check'>star_border</i>".html_safe
  end
end
