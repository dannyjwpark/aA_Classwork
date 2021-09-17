// Fill out your TodoDetailView so that it renders all of 
// the todo item's other information.

import React from "react";
import StepListContainer from "../step_list/step_list_container"
// import StepList from "../step_list/step_list"

class TodoDetailView extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
        {this.props.body}
        <div>
          <StepListContainer />
          {/* <StepList /> */}
        </div>
        Steps go here!
      </div>
    )
  }
}

export default TodoDetailView;