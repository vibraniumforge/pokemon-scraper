require "pry"
class Pokemon

    attr_accessor :id, :name, :type, :db, :hp

    def initialize(keywords)
        @id=keywords[:id]
        @name=keywords[:name]
        @type=keywords[:type]
        @db=keywords[:db]
        @hp=keywords[:hp] ||= nil
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id, db)
        new_pokemon = db.execute("SELECT * FROM pokemon WHERE id=?", id)
        ans=Pokemon.new(id: new_pokemon[0][0], name: new_pokemon[0][1], type: new_pokemon[0][2], hp: new_pokemon[0][3])
    end

    def alter_hp(num, db)
        db.execute("UPDATE pokemon SET hp=? WHERE id=?", num, self.id)
    end
end
