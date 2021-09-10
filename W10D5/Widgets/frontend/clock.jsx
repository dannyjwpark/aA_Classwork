import React from "react";

export default class Clock extends React.Component {
    constructor(props) {
        super(props);
        this.state = {time: new Date() };
        this.tick = this.tick.bind(this);
    }
    
    tick(){
        this.setState({time: new Date()})
    }
    
    componentDidMount(){
        this.tick_interval = setInterval(this.tick, 1000)
    }

    componentWillUnmount(){
        clearInterval (this.tick_interval)
    }


    render() {
        const hours = this.state.time.getHours();
        const mins = this.state.time.getMinutes();
        const secs = this.state.time.getSeconds();

        return(
            <div>
                <p>
                    <span>Time :</span>
                    <span>{hours}:{mins}:{secs}</span>
                </p>
                <p>
                    <span>Date :</span>
                    <span>{this.state.time.toDateString()}</span>
                </p>
            </div>
        )
    }
}
