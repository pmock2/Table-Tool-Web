<template>
  <v-app>
    <navigation-header></navigation-header>
    <v-content
      transition="slide-x-transition"
      style="background: radial-gradient(circle, rgb(46, 69, 90), rgb(17, 30, 42)) no-repeat;"
    >
      <router-view></router-view>
    </v-content>
  </v-app>
</template>

<script>
import NavigationHeader from "@/components/NavigationHeader";

export default {
  name: "App",
  components: {
    NavigationHeader
  }
};
</script>

<style>
</style>
