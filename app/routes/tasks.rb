post "/lists/:list/tasks/new" do
  @list = List.find(params[:list])
  halt 404 unless @list
  @task = @list.tasks.build(params[:task])
  @form = Form.new(@task, :task)

  if @task.save
    session[:notice] = "You task was added!"
    redirect to("/lists/#{@list.id.to_s}")
  else
    erb :"lists/show"
  end
end

post "/lists/:list/tasks/:id/toggle" do
  @list = List.find(params[:list])
  halt 404 unless @list

  @task = @list.tasks.find(params[:task])
  halt 404 unless @task

  {:success => @task.toggle!}
end
