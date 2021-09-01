/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/***/ ((module) => {

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

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
var __webpack_exports__ = {};
// This entry need to be wrapped in an IIFE because it need to be isolated against other modules in the chunk.
(() => {
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
const FollowToggle = __webpack_require__(/*! ./follow_toggle.js */ "./frontend/follow_toggle.js");

$(".follow-toggle").each(function(){
  new FollowToggle($(this));

})


// $("li").each(function (index) {
//     console.log(index + ": " + $(this).text());
// });
})();

/******/ })()
;
//# sourceMappingURL=bundle.js.map