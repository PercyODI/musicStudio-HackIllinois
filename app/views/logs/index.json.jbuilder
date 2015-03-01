json.array!(@logs) do |log|
  json.extract! log, :id, :teacher_id, :studentId, :comment
  json.url log_url(log, format: :json)
end
