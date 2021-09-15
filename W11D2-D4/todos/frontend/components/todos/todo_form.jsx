import React from "react";
import { uniqueId } from "../../util/util";

export default class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      id: Math.floor(Math.random() * 1000),
      title: "",
      body: "",
      completed: false
    };
    this.updateTitle = this.updateTitle.bind(this);
    this.updateBody = this.updateBody.bind(this);
    this.updateCompleted = this.updateCompleted.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  updateTitle(e) {
    this.setState({title: e.target.value});
  }

  updateBody(e) {
    this.setState({body: e.target.value});
  }

  updateCompleted(e){
    this.setState({completed: e.target.value});
  }

  handleSubmit(e) {
    e.preventDefault();
    this.setState({id: uniqueId()});
    this.props.receiveTodo(this.state);
  }

  uniqueId() {

  }

  render() {
    return (
      <div>
        <h2>This is our Todo Form</h2>
        <form onSubmit={this.handleSubmit}>
          <label>Title:
            <input type="text" value={this.state.title} onChange={this.updateTitle}/>
          </label>
          <label>Body:
            <input type="text" value={this.state.body} onChange={this.updateBody}/>
          </label>
          <label>Completed:
            <input type="checkbox" value={this.state.completed} onChange={this.updateCompleted}/>
          </label>
          <button>Add Todo</button>
        </form>
      </div>
    )
  }
}