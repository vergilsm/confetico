module ApplicationHelper
  def title(page_title)
    content_for(:title) {page_title}
  end

  def category_picture(category)
    if category.picture?
      category.picture.url
    else
      asset_path('logo.jpg')
    end
  end
end
