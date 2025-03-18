class Teacher < Person
  attr_accessor :iban
  has_many :subjects
end
