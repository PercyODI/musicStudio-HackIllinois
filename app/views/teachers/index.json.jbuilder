json.array!(@teachers) do |teacher|
  json.extract! teacher, :id, :name, :primaryInstrument, :location
  json.url teacher_url(teacher, format: :json)
end
