class BasePresenter < Presenter
  def render_template(name, locals = {})
    Tilt.new(File.expand_path("../../views/#{name}.erb", __FILE__)).render(locals)
  end
end
