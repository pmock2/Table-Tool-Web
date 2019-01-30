import Axios from "axios";

const signup = (state, data) => {
    return new Promise((resolve, reject) => {
        let url = state.getters.baseUrl + "/account";

        Axios.post(url, data)
            .then(response => {
                resolve(response);
            })
            .catch(error => {
                reject(error.response.data);
            })
    });
    //     fetch(url, {
    //             method: "POST", // or 'PUT'
    //             body: JSON.stringify(data), // data can be `string` or {object}!
    //             headers: {
    //                 "Content-Type": "application/json"
    //             }
    //         })
    //         .then(res => res.json())
    //         .then(response => resolve(response))
    //         .catch(error => reject(error));
    // });
}

const login = (state, data) => {
    return new Promise((resolve, reject) => {
        let url = state.getters.baseUrl + "/session";

        Axios.post(url, data)
            .then(response => {
                resolve(response);
            })
            .catch(error => {
                reject(error.response.data);
            })
    });

    //     fetch(url, {
    //             method: "POST", // or 'PUT'
    //             body: JSON.stringify(data), // data can be `string` or {object}!
    //             headers: {
    //                 "Content-Type": "application/json"
    //             },
    //             credentials: 'include',
    //         })
    //         // .then(res => res.json())
    //         .then(response => {
    //             if (response.status >= 400 && response.status < 600) {
    //                 throw new Error("Bad response from server");
    //             }
    //             resolve(response)
    //         })
    //         .catch(error => reject(error));
    // });
}





export default {
    signup,
    login
};