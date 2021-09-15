import { connect } from "react-redux"
import TodoList from "./todo_list"
import { receiveTodo } from "../../actions/todo_actions"

const mapStateToProps = (state) => {
    return {
        todos: Object.values(state.todos)
    }
}

const mapDispatchToProps = (dispatch) => {
    return {
        receiveTodo: (todo) => dispatch(receiveTodo(todo))
    }
}

export default connect(
    mapStateToProps,
    mapDispatchToProps
)(TodoList);