module ApplicationHelper
  def title(page_title)
    content_for(:title) {page_title}
  end

  # Для отображения flash сообщений во views
  def flash_class(level)
    case level
      when :notice  then "alert-info"
      when :success then "alert-success"
      when :error   then "alert-error"
      when :alert   then "alert-error"
    end
  end
end
