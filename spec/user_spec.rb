RSpec.describe User, type: :model do
  describe 'Validations' do
    it "is valid with valid attributes" do 
      @User = User.new(
        name: "Test one",
        email: "test@example.com",
        password: "testpw",
        password_confirmation: "testpw")
      expect(@User).to be_valid
    end

    it "is not valid without valid name" do 
      @User = User.new(
        name: nil,
        email: "test@gmail.com",
        password: "testpw",
        password_confirmation: "testpw")
      expect(@User).to_not be_valid
    end

    it "is not valid without valid email address" do 
      @User = User.new(
        name: "Test one",
        email: nil,
        password: "testpw",
        password_confirmation: "testpw")
      expect(@User).to_not be_valid
    end

    it "is not valid without a password" do 
      @User = User.new(
        name: "Test one",
        email: "test@gmail.com",
        password: nil,
        password_confirmation: "testpw")
      expect(@User).to_not be_valid
    end

    it "is not valid without a password confirmation" do 
      @User = User.new(
        name: "Test one",
        email: "test@gmail.com",
        password: "testpw",
        password_confirmation: nil)
      expect(@User).to_not be_valid
    end
    
    it "is not valid if password confirmation & password don't match" do 
      @User = User.new(
        name: "Test one",
        email: "test@gmail.com",
        password: "testpw",
        password_confirmation: "testpwd")
      expect(@User).to_not be_valid
    end
    it "is not valid if password is not atleast 6 characters long" do 
      @User = User.new(
        name: "Test one",
        email: "test@gmail.com",
        password: "t",
        password_confirmation: "t")
      expect(@User).to_not be_valid
    end

    it "is not valid if email isn't unique" do 
      @User1 = User.new(
        name: "Test two",
        email: "test@gmail.com",
        password: "testpw",
        password_confirmation: "testpw")

      @User1.save

      @User2 = User.new(
        name: "Test two",
        email: "TEST@gmail.com",
        password: "testpwd",
        password_confirmation: "testpwd")
      expect(@User2).to_not be_valid  
    end  
  end

  describe '.authenticate_with_credentials' do
    it "Returns the correct user object when provided email and pw" do 
      @User1 = User.new(
        name: "Test two",
        email: "test@gmail.com",
        password: "testpw",
        password_confirmation: "testpw")

      @User1.save

      expect(User.authenticate_with_credentials("test@gmail.com", "testpw")).to be_present
    end 
    it "Returns the correct user object when provided with an email with spaces in the beginning and end" do 
      @User1 = User.new(
        name: "Test two",
        email: "test@gmail.com",
        password: "testpw",
        password_confirmation: "testpw")

      @User1.save

      expect(User.authenticate_with_credentials("  test@gmail.com  ", "testpw")).to be_present
    end 

    it "Returns the correct user object when provided with an email that has incorrect casing" do 
      @User1 = User.new(
        name: "Test two",
        email: "test@gmail.com",
        password: "testpw",
        password_confirmation: "testpw")

      @User1.save

      expect(User.authenticate_with_credentials("TEST@gmail.com", "testpw")).to be_present
    end 

  end

end
