module ItemHelper
  def item_picture(item)
    if item.picture?
      item.picture.url
    else
      asset_path('logo.jpg')
    end
  end

  def item_picture_thumb(item)
    if item.picture?
      item.picture.thumb.url
    else
      asset_path('logo.jpg')
    end
  end

  # Новинки: Три последних добавленных товара
  def item_new(num)
    case num
    when 1
      Item.order(created_at: :desc)[0]
    when 2
      Item.order(created_at: :desc)[1]
    when 3
      Item.order(created_at: :desc)[2]
    end
  end
end
