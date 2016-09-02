Rails.application.routes.draw do

  root 'quizzes#index'

  resources :answers do 
    collection do 
      get :multi_create
    end
  end

  resources :questions do 
  	member do 
    	get 'quiz_page'
    end
  end
  resources :quiz_results do 
  	member do 
  		get 'report'
  	end
  end 
  resources :quizzes
  # namespace :admin do
  #   #   #   resources :quizzes
  # end

  
  
end
