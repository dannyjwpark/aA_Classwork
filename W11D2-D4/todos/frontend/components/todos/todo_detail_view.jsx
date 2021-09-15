// Fill out your TodoDetailView so that it renders all of 
// the todo item's other information.

import React from "react";

class TodoDetailView extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
        {this.props.body}
        {/* <Steps /> */}
        Steps go here!
      </div>
    )
  }
}

export default TodoDetailView;