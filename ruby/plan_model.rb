class PlainModel
  include ActiveModel::Model
  include ActiveSupport::Callbacks
  include ActiveModel::Validations::Callbacks
  define_callbacks :save
  
  def save 
    if valid?
      run_callbacks :save do 
        true
      end 
    else
      false
    end
  end 
end