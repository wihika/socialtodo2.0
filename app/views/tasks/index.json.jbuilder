json.array!(@tasks) do |task|
  json.extract! task, :id, :title, :description, :owner, :collaborator1, :collaborator2, :collaborator3, :done
  json.url task_url(task, format: :json)
end
