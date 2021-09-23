import * as APIUtil from '../util/bench_api_util';

export const RECEIVE_BENCHES = "RECEIVE_BENCHES";


const receiveBenches = () => ({
    type: RECEIVE_BENCHES,
    action
})

export const fetchBenches = () => dispatch => (
    APIUtil.fetchBenches().then(benches => (
        dispatch(receiveBenches(benches))
    ))
);