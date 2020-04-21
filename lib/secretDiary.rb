class SecretDiary
  
  attr_reader :entries
  
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
    raise "Cannot add: secret diary is locked" unless @open
    @entries << new_entry
  end
  
  def get_entries
    raise "Cannot show entries: secret diary is locked" unless @open
    p @entries
  end
  
  def open?
    @open
  end
  
  
end