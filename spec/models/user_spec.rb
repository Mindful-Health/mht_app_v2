require 'spec_helper'

describe User do 

 before do
    @user = User.new(name: "Example User", email: "user2@example.com", 
                     password: "foobar", password_confirmation: "foobar")
  end

  subject { @user }

  it { should respond_to(:name)  }

end
