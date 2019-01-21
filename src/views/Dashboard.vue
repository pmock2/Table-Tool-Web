<template>
  <div>
    <h2 style="color: white">Dashboard</h2>
    <card name="test" description="test test" icon="/"></card>
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
  methods: {}
};
</script>
<style>
</style>
