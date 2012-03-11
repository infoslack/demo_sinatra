#encoding = utf-8

post "/lists/:list/tasks/new" do
  @list = List.find(params[:list])
  halt 404 unless @list
  @task = @list.tasks.build(params[:task])
  @form = Form.new(@task, :task)

  if @task.save
    session[:notice] = "Você adicionou uma tarefa!"
    redirect to("/lists/#{@list.id.to_s}")
  else
    erb :"lists/show"
  end
end

post "/lists/:list/tasks/:id/toggle" do
  @list = List.find(params[:list])
  halt 404 unless @list

  @task = @list.tasks.find(params[:id])
  halt 404 unless @task

  content_type :json
  {:success => @task.toggle!}.to_json
end
