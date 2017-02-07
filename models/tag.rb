require( 'pg') 
require_relative("../db/sql_runner")



class Tag

  attr_reader :id
  attr_accessor :tag_name

def initialize(options)
@id = options['id'].to_i if options['id'] != nil
@tag_name = options['tag_name']
end

def save()
  sql = "INSERT INTO tags (tag_name) VALUES ('#{@tag_name}') RETURNING *;"
  tag = SqlRunner.run( sql ).first
  @id = tag['id'].to_i
end

def self.all
  sql = "SELECT * FROM tags;"
  tags = SqlRunner.run(sql)
  return tags.map { |tag| Tag.new(tag)}
end


def self.delete_all() 
  sql = "DELETE FROM tags"
  SqlRunner.run(sql)
end


def delete()
  sql = "DELETE FROM tags WHERE id =#{@id};"
SqlRunner.run(sql)
end

def update()
  sql = "UPDATE tags SET (tag_name) = ('#{@tag_name}') WHERE id = #{@id};"
  SqlRunner.run(sql)

end

def self.return_name(input)
sql = "SELECT * FROM tags WHERE id=#{input.to_i};"
result = SqlRunner.run(sql).first
tagname = Tag.new(result)
return tagname.tag_name

end

def self.delete(id)
  sql = "DELETE FROM tags where id = #{id}"
  SqlRunner.run( sql )
end



end