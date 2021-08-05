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

    def self.all?
        data = QuestionsDatabase.instance.execute("SELECT * FROM users")
        data.map { |ele| Users.new(ele) }
    end

    def self.find_by_id(id)
        user = QuestionsDatabase.instance.execute(<<-SQL,users.id)
            SELECT *
            FROM user
            WHERE id = ?
        SQL
        return nil unless user.length > 0

        Users.new(user.first)
    end

    def self.find_by_name(fname,lname)
        name = QuestionsDatabase.instance.execute(<<-SQL, user.fname, user.lname)
            SELECT *
            FROM user
            WHERE fname = ? AND lname = ?
        SQL
        name.map{|name| Users.new(name)}
    end

    
    def initialize(user)  # <User.new('fname' => 'Ned', 'lname' => 'Ruggeri', 'id' => 3)
        @id = user['id']
        @fname = user['fname']
        @lname = user['lname']
    end

end

class Question
    attr_reader :title, :body, :author_id

    def self.all?
        data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
        data.map { |ele| Question.new(ele) }
    end

    def initialize(question)
        @id = question['id']
        @title = question['title']
        @body = question['body']
        @author_id = question['author_id']
    end

    def self.find_by_author_id()
        
    end

end

class QuestionFollows
    attr_reader :user_id, :question_id

    def self.all?
        data = QuestionsDatabase.instance.execute("SELECT * FROM question_follows")
        data.map { |ele| QuestionFollows.new(ele) }
    end

    def initialize(questionfollows)
        @id = questionfollows['id']
        @user_id = questionfollows['user_id']
        @question_id = questionfollows['question_id']


    end
end

class Replies
    attr_reader :body, :question, :user_id, :parent_reply_id

    def self.all?
        data = Replies.instance.execute("SELECT * FROM replies")
        data.map { |ele| Replies.new(ele) }
    end

    def initialize(replies)
        @id = replies['id']
        @body = replies['body'];
        @question = replies['question'];
        @user_id = replies['user_id'];
        @parent_reply_id = replies['parent_reply_id'];
    end
end

class QuestionLikes
    attr_reader :user_id, :question_id

    def self.all?
        data = QuestionLikes.instance.execute("SELECT * FROM question_likes")
        data.map { |ele| QuestionLikes.new(ele) }
    end

    def initialize(questionlikes)
        @id = questionlikes['id']
        @user_id = questionlikes['user_id']
        @question_id = questionlikes['question_id']
    end
end


