require_relative '../models/address_book'

RSpec.describe AddressBook do
  describe "attributes" do
    it "should respond to entries" do
      book = AddressBook.new
      expect(book).to respond_to(:entries)
  end

  it "should initialize entries as an array" do
    book = AddressBook.new
    expect(book.entries).to be_a(Array)
  end

  it "should initialize entries as empty" do
    book = AddressBook.new
    expect(book.entries.size).to eq(0)
    end
  end

  context "#remove_entry" do
    it "removes an entry using the name, phone_number, and email address" do
      book = AddressBook.new
      book.add_entry("Lizz Soda", "515.943.1015", "lizzsoda@aol.com")

      name = "Ada Lovelace"
      phone_number = "010.012.1815"
      email_address = "augusta.king@lovelace.com"
      book.add_entry(name, phone_number, email_address)

      expect(book.entries.size).to eq 2
      book.remove_entry(name, phone_number, email_address)
      expect(book.entries.size).to eq 1
      expect(book.entries.first.name).to eq("Lizz Soda")
    end
  end

  describe "#add_entry" do
    it "adds only one entry to the address book" do
      book = AddressBook.new
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')

      expect(book.entries.size).to eq(1)
    end

    it "adds the correct information to entries" do
      book = AddressBook.new
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      new_entry = book.entries[0]

      expect(new_entry.name).to eq('Ada Lovelace')
      expect(new_entry.phone_number).to eq('010.012.1815')
      expect(new_entry.email).to eq('augusta.king@lovelace.com')
    end
  end

  # Test the binary_search method
  describe "#binary_search" do
    it "searches AddressBook for a non-existent entry" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Dan")
      expect(entry).to be_nil
    end

    it "searches AddressBook for Bill" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Bill")
      expect(entry).to be_a Entry
      check_entry(entry, "Bill", "555-555-4854", "bill@blocmail.com")
    end
  end

end
