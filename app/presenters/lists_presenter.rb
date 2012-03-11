class ListsPresenter < BasePresenter
  def render
    if @subject.empty?
      render_template :"lists/no_items"
    else
      render_template :"lists/list", :locals => {:lists => @subject}
    end
  end
end
