<template>
  <div>
    <v-layout row justify-center>
      <v-dialog v-model="dialog" persistent max-width="600px">
        <v-btn slot="activator" color="primary" dark>Create Campaign</v-btn>
        <v-card>
          <v-card-title>
            <span class="headline">Create Campaign</span>
          </v-card-title>
          <v-card-text>
            <v-flex xs6>
              <v-text-field label="Campaign Name" required></v-text-field>
            </v-flex>
            <br>
            <v-layout row wrap>
              <v-flex xs12>
                <v-textarea
                  name="input-7-4"
                  label="Description"
                  value="Describe your campaign"
                  :rows="height"
                ></v-textarea>
              </v-flex>
            </v-layout>
            <br />
            <v-flex xs6>
            </v-flex>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="blue darken-1" flat @click="dialog = false">Close</v-btn>
            <v-btn color="blue darken-1" flat @click="dialog = false">Submit</v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
    </v-layout>
  </div>
</template>
<script>
import UserSearch from "@/components/UserSearch";

export default {
  data: () => ({
    dialog: false
  }),
  props: ["height"],
  components: {
      UserSearch
  }
};
</script>