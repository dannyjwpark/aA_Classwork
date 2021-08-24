require 'spec_helper'
require 'rails_helper'

FactoryBot.define do
  factory :test_model do
    
  end
end



# describe <class-name> do
#   it '<description>' do
#     ___
#   end
# end


# shoulda-matcher : validations
# describe <class-name> do
#   it { should validate_presence_of(:<column name>) }
#   it { should validate_uniqueness_of(:<column name>) }
#   it { should ensure_inclusion_of(:<column name>).in_array(['', '', ''])} #etc..
# end

# shoulda-matcher: associations
# describe <class-name> do
#   describe 'associations' do
#     # 'it' refers to an instance of the BasketballTeam class here
#     # because we have not explicitly specified a subject
#     it { should have_many(:<column name>)}
#     it { should have_one(:<column name>)}
#   end
# end