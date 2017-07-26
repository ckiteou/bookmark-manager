# This class corresponds to a table in the database
class Tag

  # add DataMapper functionality to this class so it can communicate with the database
  include DataMapper::Resource

  has n, :links, through: Resource
  # these property declarations set the column headers in the 'links' table
  property :id,     Serial # Serial means that it will be auto-incremented for every record
  property :name,   String

end
