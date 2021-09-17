
// const thunk = (store) => {
// 	console.log("I just received the store!!");
// 	return (next) => {
// 		console.log("I just received the 'next'. The 'next' is: ", next);
// 		return (action) => {
// 			console.log("I just received the action! the action is: ", action);
//         if (typeof action === "function") {
//           return action(dispatch, getState);
//         }
// 			// do some stuff
// 			return next(action);
// 		}
// 	}
// }
const thunk = store => next => action => {
  console.log('thunk is working');
  if (typeof action === "function") {
    return action(dispatch, getState);
  }
  return next(action);
}

export default thunk;