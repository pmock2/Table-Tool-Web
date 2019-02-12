import Vue from "vue";
import Vuex from "vuex";
import Actions from "./store/actions";
import Getters from "./store/getters";
import Mutations from "./store/mutations";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    baseUrl: "http://127.0.0.1:3001",
    user: {
      test: "test",
      test2: "test2 is cool"
    },
    campaigns: [],
    flags: {
      isAuthenticated: false
    }
  },
  getters: Getters,
  mutations: Mutations,
  actions: Actions
  // {
  // user: state => state.user,
  // campaigns: state => state.campaigns,
  // baseUrl: state => state.baseUrl
  // },

  // {
  // getCampaigns: state => {
  //   state.campaigns.push({
  //     id: 1
  //   });
  // }
  // },

  // {
  // signup: (state, data) => {
  //   return new Promise((resolve, reject) => {
  //     let url = state.getters.baseUrl + "/account";

  //     fetch(url, {
  //         method: "POST", // or 'PUT'
  //         body: JSON.stringify(data), // data can be `string` or {object}!
  //         headers: {
  //           "Content-Type": "application/json"
  //         }
  //       })
  //       .then(res => res.json())
  //       .then(response => resolve(response))
  //       .catch(error => reject(error));
  //   });
  // }
  // }

});