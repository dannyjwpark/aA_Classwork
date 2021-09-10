import React from "react";
import Tab from "./tab"

export default class TabHeader extends React.Component {
    render() {
        return (
            <div className="tab-header">
                <span onClick={() => 0} className="tab-detail">{this.props.data[0].title}</span>
                <span onClick={() => 1} className="tab-detail">{this.props.data[1].title}</span>
                <span onClick={() => 2} className="tab-detail">{this.props.data[2].title}</span>
            </div>
        )
    }
}