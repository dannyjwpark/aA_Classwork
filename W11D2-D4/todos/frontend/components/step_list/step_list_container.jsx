import { connect } from "react-redux";
import { stepsByTodoId } from "../../reducers/selectors"
import StepList from "./step_list.jsx"
import { receiveStep } from "../../actions/step_actions";

// todos: Object.values(state.todos)

const mapStateToProps = (state) => {
  return {
    steps: stepsByTodoId(state, state.steps.todo_id)
  }
}

const mapDispatchToProps = (dispatch) => {
    return {
        receiveStep: (step) => dispatch(receiveStep(step))
    }
}

export default connect(mapStateToProps, mapDispatchToProps)(StepList);