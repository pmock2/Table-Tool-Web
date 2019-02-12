<template>
  <div class="home-page" style="background: radial-gradient(circle, #2e455a, #111e2a) no-repeat;">
    <div class="intro">
      <div class="title-container">
        <div class="page-title">The Table Tool</div>
        <div class="page-sub-title">A Tool for DMs and Their Players</div>
        <v-btn class="get-started-button" to="/join">Get Started</v-btn>
      </div>
    </div>
    <div class="page-section, text-xs-center">
        <div class="button_links" style="background: linear-gradient( #476892, #4c14d0) no-repeat;"> 
            <div class="page-section-title">Check these out!</div> 
        <br> 
        <br>
        <br>
        <v-btn color ="error" large round="button-A" >Button A</v-btn>
        <v-btn color ="error" large round="button-B" >Button B</v-btn>
        <v-btn color ="error" large round="button-C" >Button C</v-btn>
        <v-btn color ="error" large round="button-D" >Button D</v-btn>
        </div>
      <div class="page-section-content">
      </div>
    </div>
    <div class="page-info">
      <v-footer
    height="auto"
    color="primary lighten-1"
  >
    <v-layout
      justify-center
      row
      wrap
    >
      <v-btn
        v-for="link in links"
        :key="link"
        color="white"
        flat
        round
      >
        {{ link }}
      </v-btn>
      <v-flex
        primary
        lighten-2
        py-3
        text-xs-center
        white--text
        xs12
      >
        &copy;2019 — <strong>Vuetify</strong>
      </v-flex>
    </v-layout>
  </v-footer>
    </div>
</div>
  </template>

<script>
export default {
  name: "home",
  components: {}
};
</script>


<script>
 export default {
    data: () => ({
      links: [
        'Home',
        'About Us',
        'Team',
        'Services',
        'Blog',
        'Contact Us'
      ]
    })
  }
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
    color: rgba(255,255,255,0.9) !important;
    transition: opacity 1.5s, color 0.2s, box-shadow 0.2s;
    box-shadow: 0 1px 8px 1px rgba(0,0,0,0.7) !important;
}

.get-started-button:hover {
    color: white !important;
    box-shadow: 0 3px 10px 2px rgba(0,0,0,0.6) !important;
}

.page-section {
    min-height: 250px;
    position: relative;
    border-top: 1px solid #aaa;
    border-bottom: 1px solid #aaa;
}

.page-section-title {
    font-size: 2.0vw;
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

/*.button-A {
    margin-top: 8%;
    text-align: center;
    font-size: 2.5vh !important;
    height: auto;
    width: fit-content;
    background: #194d33 !important;
    cursor: pointer;
    padding: 2vh 3vh;
    border-radius: 4px;
    color: rgba(255,255,255,0.9) !important;
    transition: opacity 1.5s, color 0.2s, box-shadow 0.2s;
    box-shadow: 0 1px 8px 1px rgba(0,0,0,0.7) !important;
}

.button-A:hover {
    color: #194d3e !important;
    box-shadow: 0 3px 10px 2px rgba(0,0,0,0.6) !important;
}

.button-B {
    margin-top: 8%;
    text-align: center;
    font-size: 2.5vh !important;
    height: auto;
    width: fit-content;
    background: #194d33 !important;
    cursor: pointer;
    padding: 2vh 3vh;
    border-radius: 4px;
    color: rgba(255,255,255,0.9) !important;
    transition: opacity 1.5s, color 0.2s, box-shadow 0.2s;
    box-shadow: 0 1px 8px 1px rgba(0,0,0,0.7) !important;
}

.button-B:hover {
    color: white !important;
    box-shadow: 0 3px 10px 2px rgba(0,0,0,0.6) !important;
}

.button-C {
    margin-top: 8%;
    text-align: center;
    font-size: 2.5vh !important;
    height: auto;
    width: fit-content;
    background: #194d33 !important;
    cursor: pointer;
    padding: 2vh 3vh;
    border-radius: 4px;
    color: rgba(255,255,255,0.9) !important;
    transition: opacity 1.5s, color 0.2s, box-shadow 0.2s;
    box-shadow: 0 1px 8px 1px rgba(0,0,0,0.7) !important;
}

.button-C:hover {
    color: white !important;
    box-shadow: 0 3px 10px 2px rgba(0,0,0,0.6) !important;
}

.button-D {
    margin-top: 8%;
    text-align: center;
    font-size: 2.5vh !important;
    height: auto;
    width: fit-content;
    background: #194d33 !important;
    cursor: pointer;
    padding: 2vh 3vh;
    border-radius: 4px;
    color: rgba(255,255,255,0.9) !important;
    transition: opacity 1.5s, color 0.2s, box-shadow 0.2s;
    box-shadow: 0 1px 8px 1px rgba(0,0,0,0.7) !important;
}

.button-D:hover {
    color: white !important;
    box-shadow: 0 3px 10px 2px rgba(0,0,0,0.6) !important;
}

.page-info {
    min-height: 400px;
    position: relative;
    border-top: 1px solid #aaa;
    border-bottom: 1px solid #aaa;
}

.page-info-title {
    font-size: 1vw;
    color: #444; 
    position: relative;
    text-align: center;
    top: 5vh;
}

.page-info-content {
  font-size: 1vw;
  color: #444;  
  position: relative;
  text-align: center;
  top: 5vh;
}
*/
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
