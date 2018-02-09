require 'pry'
class Pokemon
attr_accessor :name, :type, :db, :id, :hp


  def initialize(name, type = nil, hp = nil,db = nil)
    @name=name
    @type=type
    @id
    @db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type, id) VALUES (?,?,?)", name, type)
  end

  def self.find(id, db)
    new_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id)[0]

    pokemon = Pokemon.new(new_pokemon[1], new_pokemon[2], new_pokemon[3])
    # binding.pry
    pokemon.id= new_pokemon[0]

    pokemon
  end

  def alter_hp(resulting_hp, db)
    sql = <<-SQL
    UPDATE pokemon
    SET hp = ?
    WHERE id = ?
    SQL
    db.execute(sql, resulting_hp, self.id)
    # binding.pry
  end
end
