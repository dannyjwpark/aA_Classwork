import React from "react"
import StepListItemContainer from "./step_list_container"

export default class StepList extends React.Component {

    render(){
        return(
            <ul>
                {/* <StepListItemContainer/> this causes some beans */}
                This is the step list
                {/* <StepForm/> */}
            </ul>
        )
    }
}