json.array!(@quiz_results) do |quiz_result|
  json.extract! quiz_result, :id, :quiz_id, :scores, :answers, :email
  json.url quiz_result_url(quiz_result, format: :json)
end
