import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

import createPersistedState from "vuex-persistedstate";
<<<<<<< HEAD
import memberStore from "@/store/modules/memberStore.js";

export default new Vuex.Store({
  modules: {
    memberStore,
=======
import mapStore from "@/store/modules/mapStore.js";

const store = new Vuex.Store({
  modules: {
    mapStore,
>>>>>>> c5866bef93cf64cf299d949e416f97c2e8fe0ae1
  },
  plugins: [
    createPersistedState({
      // 브라우저 종료시 제거하기 위해 localStorage가 아닌 sessionStorage로 변경. (default: localStorage)
<<<<<<< HEAD
      // storage: sessionStorage,
=======
>>>>>>> c5866bef93cf64cf299d949e416f97c2e8fe0ae1
      storage: sessionStorage,
    }),
  ],
});

export default store;
