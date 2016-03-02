class NameProcessor
  def self.split_name(full_name)
    names = full_name.split(' ')
    last_name = names[-1].to_s
    [full_name.chomp(last_name).chop, last_name]
  end
end