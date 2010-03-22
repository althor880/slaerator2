authorization do
  role :admin do
    has_permission_on :sf_users, :to => [:index, :show, :new, :create, :update, :edit, :destroy, :create_user]
    has_permission_on :queries, :to => [:index, :show, :run, :new, :create, :edit, :update, :destroy]
    has_permission_on :sf_cases, :to => [:index, :show, :new, :create, :edit, :update, :destroy, :analyze, :analyze_all]
    has_permission_on :users, :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on :business_hours, :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on :sf_record_types, :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on :sla_rules, :to => [:index, :show, :new, :create, :edit, :update, :destroy]
  end
  
  role :user do
    has_permission_on :queries, :to => [:index, :show, :run, :analyze, :analyze_all, :new, :create, :edit, :update, :destroy] do
      if_attribute :user => is { user }
    end
    has_permission_on :sf_users, :to => [:index, :show, :new, :create, :update]
    has_permission_on :sf_cases, :to => [:analyze, :analyze_all]
    has_permission_on :users, :to => [:edit, :update] do
      if_attribute :user => is { user }
    end
  end
  
  role :guest do
    has_permission_on :queries, :to => [:index]
  end
end