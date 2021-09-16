import React from "react"

export default class stepListItem extends React.Component {

    render(){
        return(
            <div>
                {this.props.step.title}
                {this.props.step.body}
                {/* button to toggle & remove step */}
            </div>
        )
    }
}