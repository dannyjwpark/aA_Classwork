class Array

    def my_each(&prc)
    
        i=0
        while i<self.length
            self[i] = prc.call(self[i] )
            i+=1
        end

        self
    
    end


    def my_select(&prc)
        arr = []
        self.my_each do |ele|
            arr << ele if prc.call(ele)
        end
        arr
    end


    def my_reject(&prc)
        arr = []
        self.my_each do |ele|
            arr << ele if !prc.call(ele)
        end
        arr
    end

    def my_any?(&prc)
        self.each do |ele|
            return true if prc.call(ele)
        end
        return false
    end

    def my_all?(&prc)
        self.each do |ele|
            return false if prc.call(ele)
        end
        return true 
    end

    

end
