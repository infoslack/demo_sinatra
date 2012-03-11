get "/lists/?" do
  @lists = ListsPresenter.new(List.all)
  erb :"lists/index"
end

get "/lists/:id/edit" do
end

patch "/lists/:id/edit" do
end

get "/lists/:id/remove" do
end

delete "/lists/:id/remove" do
end

get "/lists/new" do
  @list = List.new
  @form = Form.new(@list, :list)
  erb :"lists/new"
end

post "/lists/new" do
  @list = List.new(params[:list])
  @form = Form.new(@list, :list)

  if @list.save
    session[:notice] = "List created! Try adding some tasks."
    redirect to("/lists/#{@list.id.to_s}")
  else
    erb :"lists/new"
  end
end

get "/lists/:id" do
  @list = List.find(params[:id])
  halt 404 unless @list
  @task = Task.new
  @form = Form.new(@task, :task)
  erb :"lists/show"
end
