require 'rails_helper'

RSpec.describe User, :type => :model do
  
  it 'should be valid' do
    user = User.create(email: "email@example.com",
                    password: "password",
                    password_confirmation: "password")
    user.should == User.last
  end

end

