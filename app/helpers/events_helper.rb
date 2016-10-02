module EventsHelper
  def show_public(is_public)
    if is_public
      "公開"
    else
      "不公開"
    end
  end
end
