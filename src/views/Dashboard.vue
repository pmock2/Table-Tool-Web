<template>
  <div>
    <h2 style="color: white">Dashboard</h2>
    <card name="test" description="test test" icon="/"></card>
    <v-btn v-on:click="onPressClick">Get Campaigns</v-btn>
    <v-btn v-on:click="logout">Log out</v-btn>
  </div>
</template>

<script>
import card from "@/components/card";
export default {
  name: "join",
  components: {
    card
  },
  props: {
    username: String
  },
  data: function() {
    return {};
  },
  methods: {
    onPressClick() {
      this.$store
        .dispatch("getCampaigns")
        .then(res => {
          // this.$router.push("dashboard");
          console.log("Campaigns:");
          console.log(res);
        })
        .catch(error => {
          if (error.reauthenticate) {
            this.reauthenticate(this.$router);
          } else {
            alert(error.msg);
          }
        });
    },
    logout() {
      this.$store
        .dispatch("logout")
        .then(res => {
          // this.$router.push("dashboard");
        })
        .catch(error => {
          alert(error);
        });
    }
  }
};
</script>
<style>
</style>
