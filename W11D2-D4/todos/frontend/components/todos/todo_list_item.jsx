import React from "react"

export default class TodoListItem extends React.Component {
    constructor(props){
        super(props);
        this.state = {
            id: this.props.todo.id,
            title: this.props.todo.title,
            body: this.props.todo.body,
            completed: this.props.todo.completed,
        }
        this.handleDelete = this.handleDelete.bind(this);
        this.handleCompleted = this.handleCompleted.bind(this);
    }
    handleDelete(e) {
        e.preventDefault();
        this.props.removeTodo({id: this.props.todo.id})
        // console.log(this.props)
    }

    handleCompleted(e){
        e.preventDefault();
        // this.setState({ completed:!this.props.todo.completed});
        this.props.todo.completed = !this.props.todo.completed;
        this.props.receiveTodo(this.props.todo);
    }

    render(){
        return(
            <li>
                {this.props.todo.title}
                <button onClick={this.handleDelete}>Delete</button>
                <button onClick={this.handleCompleted}>Done!</button>
                {/* <input type="checkbox" value={this.props.todo.completed} onClick={this.handleCompleted} /> */}
            </li>
        )
            
    }
}