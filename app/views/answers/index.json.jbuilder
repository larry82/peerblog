json.array!(@answers) do |answer|
  json.extract! answer, :id, :question_id, :quiz_result_id, :content
  json.url answer_url(answer, format: :json)
end
