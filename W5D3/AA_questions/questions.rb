require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end

class Users
    attr_reader :fname, :lname
    def self.find_by_id
        data = QuestionsDatabase.instance.execute(SELECT * FROM users)
        data.map { |ele| Users.new(ele) }
    end

    def initialize(user)  # <User.new('fname' => 'Ned', 'lname' => 'Ruggeri', 'id' => 3)
        @id = user['id']
        @fname = user['fname']
        @lname = user['lname']
    end

end

class Question

    def self.find_by_id
        Question.new
    end

    def initialize()
        @id
        @title
        @body 
        @author_id = 
    end
    def self.find_by_author_id()
    end

end

class QuestionFollows
    def self.find_by_id
        
    end
end

class Replies
    def self.find_by_id
        
    end
end

class QuestionLikes
    def self.find_by_id
        
    end
end


