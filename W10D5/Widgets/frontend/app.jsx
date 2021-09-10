import React from 'react';
import Clock from './clock'
import Tab from './tab'

let tabData = [
    { title: "One", content: "I am the first" },
    { title: "Two", content: "Second pane here" },
    { title: "Three", content: "Third pane here" },
]

function App(){
    return (
        <div>
            <Clock/>
            {/* passing via props */}
            <Tab data={tabData}/>
        </div>
    )
}

export default App;