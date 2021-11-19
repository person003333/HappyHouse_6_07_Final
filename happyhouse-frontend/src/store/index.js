import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

import createPersistedState from "vuex-persistedstate";

import memberStore from "@/store/modules/memberStore.js";

import mapStore from "@/store/modules/mapStore.js";

const store = new Vuex.Store({
  modules: {
    mapStore,
    memberStore,
  },
  plugins: [
    createPersistedState({
      storage: sessionStorage,
    }),
  ],
});

export default store;
