# class SecretDiary
  
#   attr_reader :entries
  
#   def initialize
#     @entries = []
#     @open = false
#   end
    
#   def lock
#     @open = false
#     #@lock.locked(true)
#   end
  
#   def unlock
#     @open = true
#     #@lock.locked(false)
#   end
  
#   def add_entry(new_entry)
#     raise "Cannot add: secret diary is locked" if @open == false
#     @entries << new_entry
#   end
  
#   def get_entries
#     raise "Cannot show entries: secret diary is locked" if @open == false
#     @entries
#   end
  
#   def open?
#     @open
#   end

# end

class SecretDiary
  def initialize
    @diary = Diary.new
    @unlocked = false
  end
  
  def unlock
    @unlocked = true
  end
  
  def lock 
    @unlocked = false
  end
  
  def get_entries
    raise "Diary locked" unless @unlocked
    @diary.entries
  end
  
  def add_entry(entry)
    raise "Diary locked" unless @unlocked
    @diary.entries << entry
  end
end

class Diary
  
  attr_reader :entries
  
  def initialize
    @entries = []
  end
  
  def get_entries
    @entries
  end
end
  