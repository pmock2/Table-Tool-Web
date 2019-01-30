import Vue from "vue";
import "./plugins/vuetify";
import App from "./App.vue";
import router from "./router";
import store from "./store";
import mixins from "./mixins/main";

Vue.config.productionTip = false;

new Vue({
  router,
  store,
  render: h => h(App),
  beforeMount() {
    //Check for session cookie. If exists go to dashboard
  },
}).$mount("#app");

Vue.mixin({
  methods: mixins
})