import React from 'react';
import Clock from './clock'
import Tabs from './tabs'

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
            <Tabs panes={tabData}/>
        </div>
    )
}

export default App;