json.array!(@quizzes) do |quiz|
  json.extract! quiz, :id, :title, :introduction
  json.url quiz_url(quiz, format: :json)
end
