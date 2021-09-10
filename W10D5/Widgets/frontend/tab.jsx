import React from "react";
import TabHeader from "./tabHeader"

export default class Tab extends React.Component {
    constructor(props){
        super(props);
        this.state = {
            index: 0
        };
        this.click = this.click.bind(this);
    }

    click(event) {
        console.log(event.preventDefault());
        
    }

    render() {
        let temp;

        return (
            <div className="tabs">
                <h1> This is my tabs </h1>
                <div className="tab-content">
                    <p>{temp }</p>
                </div>
            </div>
        )
    }
}
