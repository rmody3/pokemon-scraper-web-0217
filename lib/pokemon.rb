class Pokemon

  attr_accessor :id, :name, :type, :db, :hp


  def initialize(id:,name:,type:,hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    result = db.execute("SELECT * FROM pokemon where id = ?", id)
    row = result[0]
    self.new(id: row[0], name: row[1], type: row[2], hp: row[3], db: db)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end
end
