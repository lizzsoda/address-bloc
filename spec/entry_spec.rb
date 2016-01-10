require_relative '../models/entry'

# #1
RSpec.describe Entry do
  # #2
  describe "attributes" do
    # #3
    it "should respond to name" do
      entry = Entry.new
      # #4
      expect(entry).to respond_to (:name)
    end
    it "should respond to phone number" do
      entry = Entry.newexpect(entry).to respond_to (:phone_number)
    end

    it "should respond to email" do
      entry = Entry.new
      expect(entry).to respond_to(:email)
    end
  end
end
