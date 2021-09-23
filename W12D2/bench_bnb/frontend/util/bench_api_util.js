export const fetchBenches = () => {
    return $.ajax({
        method: GET,
        url: '/api/benches',
        data,
        error: (err) => console.log(err)
    })
}