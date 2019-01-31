const user = state => state.user;
const campaigns = state => state.campaigns;
const baseUrl = state => state.baseUrl;
const isAuthenticated = state => state.flags.isAuthenticated;


export default {
    user,
    campaigns,
    baseUrl,
    isAuthenticated
};