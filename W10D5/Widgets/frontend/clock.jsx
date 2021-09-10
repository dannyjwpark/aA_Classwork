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
        let hours = this.state.time.getHours();
        let mins = this.state.time.getMinutes();
        let secs = this.state.time.getSeconds();

        if (hours < 10) {
            hours = `0${hours}`;
        }
        if (mins < 10){
            mins = `0${mins}`;
        }

        if (secs < 10){
            secs = `0${secs}`;
        }

        return(
            <div class="clock">
                <p>
                    <span>Time :</span>
                    <span>{hours}:{mins}:{secs} PDT</span>
                </p>
                <p>
                    <span>Date :</span>
                    <span>{this.state.time.toDateString()}</span>
                </p>
            </div>
        )
    }
}
