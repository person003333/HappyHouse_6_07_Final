import http from "@/util/http-common.js";

const mapStore = {
  namespaced: true,
  state: {
    sidos: [{ value: null, text: "선택하세요" }],
    guguns: [{ value: null, text: "선택하세요" }],
    dongs: [{ value: null, text: "선택하세요" }],
    houses: [],
    house: null,
    sidoCode: null,
    gugunCode: null,
    dongCode: null,
    map: null,
    marker: null,
    subway: "",
    store: "",
  },
  mutations: {
    GET_SIDO_LIST(state, sidos) {
      sidos.forEach((sido) => {
        state.sidos.push({ value: sido.sidoCode, text: sido.sidoName });
      });
    },
    GET_GUGUN_LIST(state, guguns, sidoCode) {
      state.sidoCode = sidoCode;
      guguns.forEach((gugun) => {
        state.guguns.push({ value: gugun.gugunCode, text: gugun.gugunName });
      });
    },
    GET_DONG_LIST(state, dongs, gugunCode) {
      state.gugnCode = gugunCode;
      dongs.forEach((dong) => {
        state.dongs.push({ value: dong.dongCode, text: dong.dongName });
      });
    },
    CLEAR_SIDO_LIST(state) {
      state.sidos = [{ value: null, text: "선택하세요" }];
    },
    CLEAR_GUGUN_LIST(state) {
      state.guguns = [{ value: null, text: "선택하세요" }];
    },
    CLEAR_DONG_LIST(state) {
      state.dongs = [{ value: null, text: "선택하세요" }];
    },
    GET_HOUSE_LIST(state, houses, gugunCode) {
      state.gugunCode = gugunCode;
      state.houses = houses;
      state.house = houses[0];
      return;
    },
    SET_DETAIL_HOUSE(state, house) {
      state.house = house;
    },

    SET_STORE(state, store) {
      state.store = store;
    },
    SET_SUBWAY(state, subway) {
      state.subway = subway;
    },
  },
  actions: {
    getSido({ commit }) {
      http
        .get("/map/sido")
        .then((response) => {
          commit("GET_SIDO_LIST", response.data);
        })
        .catch((error) => {
          console.log(error);
        });
    },
    getGugun({ commit }, sidoCode) {
      const params = { sido: sidoCode };
      http
        .get("/map/gugun", { params })
        .then((response) => {
          commit("GET_GUGUN_LIST", response.data, sidoCode);
        })
        .catch((error) => {
          console.log(error);
        });
    },

    getDong({ commit }, gugunCode) {
      const params = { gugun: gugunCode };
      http
        .get("/map/dong", { params })
        .then((response) => {
          commit("GET_DONG_LIST", response.data, gugunCode);
        })
        .catch((error) => {
          console.log(error);
        });
    },
    getHouseList({ commit }, dongCode) {
      const params = { dong: dongCode };
      http
        .get("/map/apt", { params })
        .then((response) => {
          console.log(response.data);
          commit("GET_HOUSE_LIST", response.data, dongCode);
        })
        .catch((error) => {
          console.log(error);
        });
    },
    detailHouse({ commit }, house) {
      // house 일련번호를 통해 API 호출
      commit("SET_DETAIL_HOUSE", house);
    },

    setStore({ commit }, store) {
      commit("SET_STORE", store);
    },
    setSubway({ commit }, subway) {
      commit("SET_SUBWAY", subway);
    },
  },
};

export default mapStore;
