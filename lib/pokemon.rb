class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:,name:,type:,db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name,type,db)
    sql = <<-SQL
    INSERT INTO pokemon (name, type, db)
    VALUES (?, ?, ?)
    SQL

    DB[:conn].execute(sql, self.name, self.type, self.db)
  end 

  def self.find_by_id(id)
    sql = "SELECT * FROM pokemon WHERE id = ?"
    result = DB[:conn].execute(sql, id)[0]
    pok = Pokemon.new(result[0], result[1], result[2],result[3])
    pok
  end

  end
