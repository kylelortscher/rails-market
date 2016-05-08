class Service < ActiveRecord::Base

  #TODO MAKE THESE WORK IN JAVASCRIPT
  #Presence Validations
  validates_presence_of :title, :message => "Title Can't Be Empty"
  validates_presence_of :price, :message => "Price Can't Be Empty"
  validates_presence_of :due_date, :message => "Please Add A Due Date"
  validates_presence_of :user_id, :message => "You must be logged in to post this service"
  validates_presence_of :category, :message => "Category Can't Be Empty"
  validates_presence_of :sub_category, :message => "Sub Category Can't Be Empty"
  validates_presence_of :description, :message => "Description Can't Be Empty"
  validates_presence_of :refund, :message => "Refund Date Can't Be Empty"

  #Uniquness Validation
  validates_uniqueness_of :title, :message => "Your Title Must Be Unique, and Is Already In Use"
  validates_uniqueness_of :title_seo, :message => "Your Title Must Be Unique, and Is Already In Use"
  validates_uniqueness_of :description, :message => "Your description must be unique"

  #Length Validation
  validates_length_of :title, :minimum => 5, :maximum => 65, :message => "Your title must be between 4 and 65 characters"
  validates_length_of :description, :minimum => 25, :maximum => 500, :message => "Your description must be between 25 and 500 characters"

  #Validate Numerically
  validates_numericality_of :price, :message => "You must use numbers for your price"

end
