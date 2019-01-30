const getCampaigns = state => {
    state.campaigns.push({
        id: 1
    });
}

const setAuthenticated = (state, bAuthenticated) => {
    state.flags.isAuthenticated = bAuthenticated;
}




export default {
    getCampaigns,
    setAuthenticated
};