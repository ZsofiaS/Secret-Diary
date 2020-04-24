require "secretDiary"

describe SecretDiary do
  subject(:secretDiary) { described_class.new }
  let(:diary) { double :diary, :entries => [] }
  
  it "can be locked" do
    expect(secretDiary).to respond_to(:lock)
  end
  
  it "can be unlocked" do
    expect(secretDiary).to respond_to(:unlock)
  end
  
  describe "#add_entry" do
    
    context "when diary is locked" do
      it "throws error when diary is locked" do
        new_entry = double :new_entry
        expect { secretDiary.add_entry(new_entry) }.to raise_error "Diary locked"
      end
    end
    
    context "when diary is open" do
      it "can accept new entry" do
        new_entry = double :new_entry
        secretDiary.unlock
        expect{secretDiary.add_entry(new_entry)}.not_to raise_error
      end
    end
  end
  
  describe "#get_entries" do
      
    context "when diary is locked" do  
      it "throws error when diary is locked" do
        expect { secretDiary.get_entries }.to raise_error "Diary locked"
      end
    end
    
    context "when diary is open" do
      it "can show the entries" do
        new_entry = double :new_entry  
        secretDiary.unlock
        secretDiary.add_entry(new_entry)
        expect(secretDiary.get_entries).to include new_entry
      end
    end
  end
  
end

describe Diary do
  describe "#get_entries" do
    it "can show entries" do
      expect(subject.get_entries).to eq []
    end
  end
end