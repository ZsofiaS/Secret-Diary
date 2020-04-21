class SecretDiary
  
  attr_reader :open
  
  def initialize
    @entries = []
    @open = false
  end
    
  def lock
    @open = false
  end
  
  def unlock
    @open = true
  end
  
  def add_entry(new_entry)
    raise "Cannot add: secret diary is locked" if @open == false
    @entries << new_entry
  end
  
  def get_entries
  end
  
  def open?
    @open
  end
  
  
end