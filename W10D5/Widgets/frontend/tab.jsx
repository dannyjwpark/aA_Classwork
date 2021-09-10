import React from "react";

export default class Tab extends React.Component {
    constructor(props){
        super(props);
        this.state = {
            index: 0,
            content: ""
        };
        this.click = this.click.bind(this);
    }

    click(event) {
        event.preventDefault();
        this.state.index = event;
        this.state.content = ["First", "Second", "Thrid"];
    }

    render() {
        let temp;

        return (
            <div class="tabs">
                <div class="tab-header">
                    <span>One</span>
                    <span>Two</span>
                    <span>Three</span>
                </div>
                <div class="tab-content">
                    <p>{temp}</p>
                </div>
            </div>
        )
    }
}