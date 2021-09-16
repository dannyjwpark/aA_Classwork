import { connect } from "react-redux";
import TodoDetailView from "./todo_detail_view";
import { receiveStep, removeStep} from "../../actions/step_actions"

const mapDispatchToProps = (dispatch) => {
    return {
        receiveStep: (step) => dispatch(receiveStep(step)),
        removeStep: (step) => dispatch(removeStep(step))

    }
}

export default connect(null, mapDispatchToProps)(TodoDetailView);