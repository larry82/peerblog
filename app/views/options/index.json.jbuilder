json.array!(@options) do |option|
  json.extract! option, :id, :question_id, :content, :score, :explanation
  json.url option_url(option, format: :json)
end
