import { connect } from "react-redux";
import BenchIndex from "./bench_index";

const mapStateToProps = (state, { match })=> {
    return {
        benchId: parseInt(match.params.benchId),
        bench: selectBench(state.entities, benchId),
    }
}

const mapDispatchToProps = (dispatch) => ({
    fetchBench: id => dispatch(fetchBench(id))
})

export default connect(mapStateToProps, mapDispatchToProps)(BenchIndex);