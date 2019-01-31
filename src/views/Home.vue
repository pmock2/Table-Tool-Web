<template>
  <div class="home-page" style="background: radial-gradient(circle, #2e455a, #111e2a) no-repeat;">
    <div class="intro">
      <div class="title-container">
        <div class="page-title">The Table Tool</div>
        <div class="page-sub-title">A Tool for DMs and Their Players</div>
        <!-- <div>{{ $store.getters.user.test2 }}</div> -->
        <div>{{ todos }}</div>
        <v-btn class="get-started-button" to="/join">Get Started</v-btn>
      </div>
    </div>
    <div class="page-section">
      <div class="page-section-title">My Title</div>
      <div class="page-section-content"></div>
    </div>
    <div class="page-section">
      <div class="page-section-title">My Title</div>
      <div class="page-section-content"></div>
    </div>
  </div>
</template>

<script>
export default {
  name: "home",
  components: {},
  computed: {
    todos: function() {
      //   debugger;
    }
  }
};
</script>

<style>
.home-page {
  color: white;
}

.intro {
  height: calc(100vh - 32px);
  transition: 1.5s;
}

.title-container {
  position: absolute;
  display: flex;
  height: auto;
  left: 0;
  right: 0;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  top: 15%;
  align-content: center;
  transform: translateY(-50%);
}

.page-title {
  margin-top: 10%;
  text-align: center;
  font-size: 10vw;
  height: fit-content;
  position: relative;
}

.page-sub-title {
  position: relative;
  text-align: center;
  font-size: 2.8vw;
  height: fit-content;
  transition: opacity 1.5s;
}

.get-started-button {
  margin-top: 8%;
  text-align: center;
  font-size: 2.5vh !important;
  height: auto;
  width: fit-content;
  background: #c72819 !important;
  cursor: pointer;
  padding: 2vh 3vh;
  border-radius: 4px;
  color: rgba(255, 255, 255, 0.9) !important;
  transition: opacity 1.5s, color 0.2s, box-shadow 0.2s;
  box-shadow: 0 1px 8px 1px rgba(0, 0, 0, 0.7) !important;
}

.get-started-button:hover {
  color: white !important;
  box-shadow: 0 3px 10px 2px rgba(0, 0, 0, 0.6) !important;
}

.page-section {
  min-height: 400px;
  background: white;
  position: relative;
  border-top: 1px solid #aaa;
  border-bottom: 1px solid #aaa;
}

.page-section-title {
  font-size: 2.8vw;
  color: #444;
  position: relative;
  text-align: center;
  top: 5vh;
}

.page-section-content {
  display: flex;
  bottom: 0;
  position: absolute;
  left: 5%;
  right: 5%;
  top: 10vh;
}

*::-webkit-scrollbar {
  width: 6px !important;
  height: 6px !important;
  border-radius: 5px !important;
}

*::-webkit-scrollbar-thumb {
  background-color: #4c535d !important;
  border-radius: 5px !important;
}

*::-webkit-scrollbar-track {
  background-color: #1b232d !important;
  border-radius: 5px !important;
}
</style>
