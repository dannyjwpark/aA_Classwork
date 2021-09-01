class FollowToggle {
    constructor(el){
        this.userId = this.$el.data("user_id");
        this.followState = this.$el.data("initial_follow_state");
        this.$el = $(el);
        this.render();
        // installing (setting up) handleClick
        this.$el.on("click", this.handleClick.bind(this));
    }
    
    render(){
        if(this.followState === "followed"){
            // alert("Follow!");
            this.$el.text("Follow!");
        } else if (this.followState === "unfollowed") {
            // alert("Unfollow!");
            this.$el.text("Unfollow!");
        }
    }

    handleClick(){
        this.$el.preventDefault();
        // if !follows(user)
        if (this.followState === "followed"){
            return $.ajax({
                url: `/users/${this.userId}/follow`,
                method: 'POST',
                dataType: 'JSON'
            }).then((response) => {
                this.$el.data("initial_follow_state", "unfollowed");
            })
        } else if (this.followState === "unfollowed"){
            return $.ajax({
                url: `/users/${this.userId}/follow`,
                method: 'DELETE',
                dataType: 'JSON'
            }).then((response) => {
                this.$el.data("initial_follow_state", "followed");
            })
        }
    }
    
}



module.exports = FollowToggle;