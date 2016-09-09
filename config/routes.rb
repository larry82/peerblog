Rails.application.routes.draw do
	
	devise_for :admins

  authenticated :admin do
  	resources :answers
  	resources :questions
  	resources :quiz_results
  	resources :quizzes
  	resources :options
  end

  root 'quizzes#index'

  resources :answers,only:[:create] do 
    collection do 
      get :multi_create
      post :create_or_update_via_ajax
    end
  end

  resources :quiz_results,only:[:create,:show] do 
  	member do 
  		get 'report'
  	end
  end 
  resources :quizzes,only:[:show] do 
  	member do 
  		get 'quiz_page'
  	end
  end
  
  
end
