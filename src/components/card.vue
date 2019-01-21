<template>
  <div class="square-flip-container" ref="flipme">
    <div class="app-square-space front">
      <div class="app-status-icon" data-status="false"></div>
      <img
        class="app-image"
        :src="icon"
        onError="this.src = 'https://i2.wp.com/pipe-dream-design.com/wp-content/uploads/2017/11/D20.jpg?ssl=1'"
      >
      <div class="options_bar">
        <div data-flip-front="true" class="flip-icon-outer-container">
          <div class="icon-flip-container">
            <div class="icon-flip-front fas fa-cog" v-on:click="flip"></div>
          </div>
        </div>
      </div>
      <div class="app-title">
        <span>{{name}}</span>
        <div class="app-description">{{description}}</div>
      </div>
    </div>
    <div class="back">
      <div data-flip-back="true" class="flip-icon-outer-container re-flip-icon">
        <div class="icon-flip-container">
          <div class="icon-flip-front fas fa-cog" v-on:click="flipBack"></div>
        </div>
      </div>
      <div class="back-section app-back-title">
        <div class="back-section-text-section">{{name}}</div>
      </div>
      <hr>
      <div class="back-section" style="margin-top: 5px" data-back-card-option="edit">
        <div class="back-section-text-section">
          <div class="fas fa-edit back-section-icon"></div>
          <div class="back-section-text">Edit</div>
        </div>
      </div>
      <div class="back-section" data-back-card-option="information">
        <div class="back-section-text-section">
          <div class="fas fa-info-circle back-section-icon"></div>
          <div class="back-section-text">Information</div>
        </div>
      </div>
      <div class="back-section">
        <div class="back-section-text-section">
          <div class="fas fa-clipboard-list back-section-icon"></div>
          <div class="back-section-text">Logs</div>
        </div>
      </div>
      <div class="back-section" data-back-card-option="delete">
        <div class="back-section-text-section">
          <div class="fas fa-trash back-section-icon"></div>
          <div class="back-section-text">Delete</div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
    props: [
      'name',
      'icon',
      'description'
    ],
    methods : {
      flip : function (event) {
        var flipElement = this.$refs.flipme;
        flipElement.style.transform = 'rotateY(180deg)';
      },
      flipBack : function (event) {
        var flipElement = this.$refs.flipme;
        flipElement.style.transform = 'rotateY(0deg)';
      }
    },
}
</script>
<style>
:root {
  --app-background-imamge: white;
  --app-border: 2px solid #d0d0d0;
  --app-hover-box-shadow: 0 0 7px 1px #cecece;
  --app-hover-border-color: #d0d0d0;
}

body[data-dark="true"] {
  --app-background-imamge: rgba(0, 0, 0, 0);
  --app-border: 2px solid rgb(154, 154, 154);
  --app-hover-box-shadow: 0 0 7px 1px transparent;
  --app-hover-border-color: rgb(201, 201, 201);
}

.app-square-space {
  color: #444;
  width: 190px;
  display: inline-block;
  height: 260px;
  text-align: center;
  transition: 0.2s;
  position: relative;
  overflow: hidden;
  border-radius: 4px;
  cursor: pointer;
  background: rgb(234, 235, 237);
  box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.9);
}

.app-square-space[data-showBlocker="true"] {
  pointer-events: none !important;
}

.app-square-space:hover {
  box-shadow: 0 3px 18px 2px rgba(0, 0, 0, 0.8);
}

.app-description {
  font-size: 14px;
  display: block;
  font-weight: normal;
  margin-top: 2px;
  height: 30px;
  overflow: hidden;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
}

.app-title {
  text-align: center;
  font-size: 18px;
  color: #444;
  pointer-events: none;
  position: absolute;
  padding: 0 3px;
  width: 175px;
  top: 145px;
  left: 50%;
  transform: translateX(-50%);
  font-weight: bold;
}

.app-image {
  width: 50%;
  max-height: 80%;
  height: 35%;
  margin-top: 30px;
  text-align: center;
  pointer-events: none;
  left: 50%;
  position: absolute;
  transform: translateX(-50%);
}

.options_bar {
  height: 175px;
  position: absolute;
  top: 0;
  margin: 10px 0;
  transition: 0.2s;
  right: 10px;
  pointer-events: none;
}

.app-square-icon {
  color: #333;
  cursor: pointer;
  transition: 0.2s;
  pointer-events: all;
  display: block !important;
  margin: 6px 0;
}

.app-square-icon:hover {
  transform: scale(1.15);
}

.app-square-blocker {
  position: absolute;
  top: 49%;
  left: 50%;
  transform: translateX(-50%) translateY(-50%);
  width: 190px;
  height: 262px;
  margin-top: 0;
  z-index: 3;
  background: rgba(0, 0, 0, 0.3);
}

.app-square-blocker[data-appSquare="true"] .lds-roller {
  display: inline-block;
  position: relative;
  width: 64px;
  height: 64px;
  top: 44%;
  left: 17%;
  transform: translateX(-50%) translateY(-50%);
}

.front,
.back {
  backface-visibility: hidden;
}

.square-flip-container {
  display: inline-block;
  margin: 0 20px calc(25px + 0.25%);
}

.square-flip-container,
.icon-flip-container {
  position: relative;
  transform-style: preserve-3d;
  transition: 0.3s;
}

.square-flip-container[data-flipped="true"] .front {
  pointer-events: none;
}

.front {
  z-index: 2;
}

.back {
  transform: rotateY(180deg);
  z-index: 1;
  color: #444;
  width: 190px;
  display: inline-block;
  height: 260px;
  text-align: center;
  position: absolute;
  overflow: hidden;
  border-radius: 4px;
  top: 0;
  cursor: default;
  left: 0;
  transition: 0.3s;
  background: rgb(234, 235, 237);
}

.square-flip-container[data-flipped="true"] .back {
  background: rgb(234, 235, 237);
}

.re-flip-icon {
  position: absolute;
  top: 10px;
  right: 10px;
  z-index: 3;
}

.flip-icon-outer-container {
  height: 25px;
  width: 25px;
  pointer-events: all;
}

.icon-flip-container {
  height: 26px;
  width: 25px;
  text-align: center;
  pointer-events: all;
  opacity: 0.7;
  transition: transform 0.2s linear 0.5s, opacity 0.2s;
  cursor: pointer;
}

.flip-icon-outer-container:hover .icon-flip-container {
  transform: rotateY(180deg);
  opacity: 1;
}

.icon-flip-front {
  height: 18px;
  width: 17px;
  border: 2px solid transparent;
  border-radius: 3px;
  position: absolute;
  /*backface-visibility: hidden;*/
  padding: 2px;
  text-align: center;
  left: 0;
  font-size: 17px;
  background: rgb(234, 235, 237);
  color: rgba(51, 51, 51, 0.7);
}

.icon-flip-front {
  z-index: 2;
}

.back-section {
  position: relative;
  width: 80%;
  height: 9.7%;
  z-index: 2;
  color: #333;
  padding: 7px 0 1px 0;
  font-size: 15px;
  left: 10%;
  cursor: pointer;
}

.back-section:hover {
  background: #2d8be6;
  color: white;
}

.back-section[data-backCardOption="delete"]:hover {
  background: #e94838;
  color: white;
}

.app-back-title {
  margin: 7px 0;
  text-align: left;
  font-size: 20px;
  font-weight: bold;
  color: #444 !important;
  width: 70%;
  cursor: default;
  background: transparent !important;
}

.back-section-text-section {
  pointer-events: none;
  cursor: default;
  text-align: left;
  padding: 0 4px;
  text-overflow: ellipsis;
  white-space: nowrap;
  overflow: hidden;
}

.back-section-text {
  display: inline-block;
  margin-left: 2px;
}

.back-section-icon {
  width: 20px;
  display: inline-block;
  padding-left: 4px;
}

.notification-bar {
  position: absolute;
  bottom: 14px;
  width: 75%;
  text-align: center;
  left: 50%;
  transform: translateX(-50%);
  height: 25px;
  transition: width 0.4s cubic-bezier(0.68, -0.55, 0.27, 1.55), height 0.4s;
}

.notification-bar-front,
.notification-bar-behind {
  position: absolute;
  width: 100%;
  height: 100%;
  border-radius: 4px;
  transition: 0.4s ease;
  pointer-events: none;
}

.notification-bar-front {
  background: #2d8be6;
}

.notification-bar-behind {
  background: #777;
}

.notification-message {
  margin-top: 5px;
  font-size: 14px;
  transition: 0.3s;
  pointer-events: none;
  color: rgba(255, 255, 255, 0.7);
  text-align: center;
  position: relative;
}

.notification-bar:hover .notification-message {
  color: rgba(255, 255, 255, 1);
}

.app-status-icon {
  position: absolute;
  top: 10px;
  left: 10px;
  width: 10px;
  height: 10px;
  border-radius: 100%;
  background: #ffa521;
  /* background: #e94838; */
}

.app-status-icon[data-status="true"] {
  background: #2bad43;
}

.version-number {
  cursor: pointer;
}

.version-number:hover {
  color: #2d8be6;
}
</style>


