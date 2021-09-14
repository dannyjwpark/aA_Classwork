import { RECEIVE_STEPS, RECEIVE_STEP, REMOVE_STEP } from "../actions/step_actions";

export const stepsReducer = (oldState, action) => {
    // debugger;
    Object.freeze(oldState);
    const newState = Object.assign({}, oldState);
    // console.log("action.step" + action.step);
    switch (action.type) {
        case RECEIVE_STEP:
            // newState[action.todo.id] = action.todo;
            newState[action.step.id] = action.step;
            return newState;

        case RECEIVE_STEPS:
            for (const property in action.steps) {
                // if buggy, revisit here
                newState[action.steps[property].id] = action.steps[property];
                // ***
            }
            return newState;

        case REMOVE_STEP:
            delete newState[action.step.id];
            return newState;

        default:
            return newState;
    }
};

export default stepsReducer;

