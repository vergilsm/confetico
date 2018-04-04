module CategoryHelper
  def category_picture(category)
    if category.picture?
      category.picture.url
    else
      asset_path('logo.jpg')
    end
  end

  def category_picture_thumb(category)
    if category.picture?
      category.picture.thumb.url
    else
      asset_path('logo.jpg')
    end
  end
end
