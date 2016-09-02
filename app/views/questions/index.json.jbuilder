json.array!(@questions) do |question|
  json.extract! question, :id, :quiz_id, :number, :content, :introduction, :category
  json.url question_url(question, format: :json)
end
