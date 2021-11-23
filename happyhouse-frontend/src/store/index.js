import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

import createPersistedState from "vuex-persistedstate";

import memberStore from "@/store/modules/memberStore.js";

import mapStore from "@/store/modules/mapStore.js";

import myhouseStore from "@/store/modules/myhouseStore.js";

const store = new Vuex.Store({
  modules: {
    mapStore,
    memberStore,
    myhouseStore,
  },
  plugins: [
    createPersistedState({
      storage: sessionStorage,
    }),
  ],
});

export default store;
