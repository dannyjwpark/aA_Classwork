import { connect } from "react-redux";
import TodoDetailView from "./todo_detail_view";
import { receiveSteps } from "../../actions/step_actions"; 

// const mapStateToProps = (state) => {
//   return {
      
//   }
// }

const mapDispatchToProps = (dispatch) => {
  return {
     receiveSteps: (steps)=> dispatch(receiveSteps(steps)) 
  }
}

export default connect(null, mapDispatchToProps)(TodoDetailView);