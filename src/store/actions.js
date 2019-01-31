import Axios from "axios";

const signup = (state, data) => {
    return new Promise((resolve, reject) => {
        let url = state.getters.baseUrl + "/account";

        Axios.post(url, data, {withCredentials: true})
            .then(response => {
                resolve(response);
            })
            .catch(error => {
                reject(error.response.data);
            })
    });
}

const login = (state, data) => {
    return new Promise((resolve, reject) => {
        let url = state.getters.baseUrl + "/session";

        Axios.post(url, data, {withCredentials: true})
            .then(response => {
                resolve(response);
            })
            .catch(error => {
                reject(error.response.data);
            })
    });
}
const logout = (state, data) => {
    return new Promise((resolve, reject) => {
        let url = state.getters.baseUrl + "/session";

        Axios.delete(url, {}, {withCredentials: true})
            .then(response => {
                resolve(response);
            })
            .catch(error => {
                reject(error.response.data);
            })
    });
}

const getCampaigns = (state, data) => {
    return new Promise((resolve, reject) => {
        let url = state.getters.baseUrl + "/campaign";

        Axios.get(url, {withCredentials: true})
            .then(response => {
                resolve(response.data);
            })
            .catch(error => {
                reject({
                    msg: error.response.data,
                    reauthenticate: error.response.status == 401
                })
            })
    });
}



export default {
    signup,
    login,
    logout,
    getCampaigns
};