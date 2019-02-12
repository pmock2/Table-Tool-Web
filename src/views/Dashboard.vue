<template>
  <div class="dashboard-page">
    <!-- <h2 style="color: white">Dashboard</h2>
    <card name="test" description="test test" icon="/"></card>
    <v-btn v-on:click="onPressClick">Get Campaigns</v-btn>
    <v-btn v-on:click="logout">Log out</v-btn>-->
    <div class="page-header">
      <div class="dashboard-title">Dashboard</div>
      <div class="dashboard-description">
        Welcome to your dashboard! This page will display all content that is relevent to you. Each campaign, group, and character you are associated with
        will appear on this page.
      </div>
    </div>
    <div class="options-bar">
      <v-btn color="white darken-1" style="background:#e6321f" flat>Create Campaign</v-btn>
      <div class="filter-bar">
        <input type="text" placeholder="search" class="search-bar">
      </div>
    </div>
    <div class="card-section-container">
      <div class="card-section">
        <div v-for="(campaign) in campaigns" :key="campaign.id">
          <card :name="campaign.name" :description="campaign.description" icon="/"></card>
        </div>
      </div>
    </div>
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
    return {
      dropdown_font: ["Arial", "Calibri", "Courier", "Verdana"]
    };
  },
  computed: {
    campaigns: function() {
      return this.$store.getters.campaigns;
    }
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
  },
  beforeMount() {
    this.$store
      .dispatch("getCampaigns")
      .then(res => {
        // this.$router.push("dashboard");
        console.log("Campaigns:");
        console.log(res);
        this.$store.commit("setCampaigns", res);
      })
      .catch(error => {
        if (error.reauthenticate) {
          this.reauthenticate(this.$router);
        } else {
          alert(error.msg);
        }
      });
  }
};
</script>
<style>
.dashboard-page {
  padding: 20px;
  color: white;
}

.page-header {
}

.dashboard-title {
  color: white;
  font-size: 42px;
}

.dashboard-description {
  font-size: 18px;
}

.card-section-container {
  overflow: auto;
  position: absolute;
  top: 200px;
  left: 20px;
  right: 20px;
  bottom: 20px;
  background: rgba(0, 0, 0, 0.1);
  box-shadow: 0px 3px 0px 3px rgba(0, 0, 0, 0.1);
}

.card-section {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  padding: 35px;
}

.options-bar {
  margin: 10px;
}

.filter-bar {
  float: right;
}

.search-bar {
  background: rgba(255, 255, 255, 0.1);
  padding: 4px 15px;
  border-radius: 20px;
  outline: 0 !important;
  width: 300px;
  height: 40px;
  font-size: 18px;
}
</style>
