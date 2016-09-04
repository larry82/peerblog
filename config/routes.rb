Rails.application.routes.draw do
	
	devise_for :admins

  authenticated :admin do
  	resources :answers
  	resources :questions
  	resources :quiz_results
  	resources :quizzes
  end

  root 'quizzes#index'

  resources :answers,only:[:create,:show] do 
    collection do 
      get :multi_create
    end
  end

  resources :questions,only:[:show] do 
  	member do 
    	get 'quiz_page'
    end
  end
  resources :quiz_results,only:[:create,:show] do 
  	member do 
  		get 'report'
  	end
  end 
  resources :quizzes,only:[:show]
  
  
end
