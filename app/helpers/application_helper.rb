module ApplicationHelper
  def flash_class(level)
    case level
      when :notice  then "alert alert-info"
      when :success then "alert alert-success"
      when :error   then "alert alert-error"
    end
  end

  def current_path
    request.path
  end
end
