import React from "react"
import TodoDetailView from "./todo_detail_view";

export default class TodoListItem extends React.Component {
    constructor(props){
        super(props);
        this.state = {
            id: this.props.todo.id,
            title: this.props.todo.title,
            body: this.props.todo.body,
            completed: this.props.todo.completed,
            detail: false
        }
        this.handleDelete = this.handleDelete.bind(this);
        this.handleCompleted = this.handleCompleted.bind(this);
        this.handleDetail = this.handleDetail.bind(this);
        this.showDetail = this.showDetail.bind(this);
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

    handleDetail(e) {
        e.preventDefault();
        // this.showingDetail = !this.showingDetail;
        this.setState({detail: !this.state.detail});
        console.log(this.state.detail);
    }

    showDetail() {
        if (this.state.detail) {
            return  (<TodoDetailView />)
            
        } else {
            return null
        }
        // console.log('hello')
        // return (<h3>showDetail not working</h3>)

    }

    componentDidMount() {
        
    }

    render(){
        return(
            <li>
                <div onClick={this.handleDetail}>{this.props.todo.title}</div>
                {/* <button onClick={this.handleDelete}>Delete</button> */}
                {/* <button onClick={this.handleDetail}>Show Details</button> */}
                <button onClick={this.handleCompleted}>Done!</button>
                {/* <input type="checkbox" value={this.props.todo.completed} onClick={this.handleCompleted} /> */}
                <ul>
                    {this.showDetail()}
                </ul>
            </li>
        )
            
    }
}