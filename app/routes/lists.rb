get "/lists" do
  @lists = ListsPresenter.new(List.all)
  erb :"lists/index"
end

get "/lists/:id" do
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
end

post "/lists/new" do
end
