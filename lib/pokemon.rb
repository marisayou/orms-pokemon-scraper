
class Pokemon
    attr_accessor :name, :type
    attr_reader :db, :id

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type) VALUES (?, ?)
        SQL
        db.execute(sql, name, type)
    end

    def self.find(id, db)
        sql = <<-SQL
            SELECT * FROM pokemon WHERE id = ?
        SQL
        row = db.execute(sql, id)[0]
        attrs = {:id => row[0], :name => row[1], :type => row[2], :db => db}
        new_pokemon = self.new(attrs)
    end


    def initialize(attrs={})
        @db = attrs[:db]
        @name = attrs[:name]
        @type = attrs[:type]
        @id = attrs[:id]
    end
end
