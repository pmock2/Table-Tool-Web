const getCampaigns = state => {
    state.campaigns.push({
        id: 1
    });
}

const setAuthenticated = (state, bAuthenticated) => {
    state.flags.isAuthenticated = bAuthenticated;
}

const setCampaigns = (state, campaigns) => {
    state.campaigns = campaigns;
};



export default {
    getCampaigns,
    setAuthenticated,
    setCampaigns
};