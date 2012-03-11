class ListsPresenter < BasePresenter
  def render
    if @subject.empty?
      render_template :"lists/no_items"
    else
      render_template :"lists/list", {:lists => @subject}
    end
  end
end
