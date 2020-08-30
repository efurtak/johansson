module ApplicationHelper
  def lokalizacja
    request.fullpath[4..-1] if request.fullpath[4..-1].present?
  end
end
