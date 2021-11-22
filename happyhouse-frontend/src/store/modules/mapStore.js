import http from "@/util/http-common.js";

const now = new Date();
const today = new Date(now.getFullYear(), now.getMonth(), now.getDate());
const minDate = new Date(2015, 0, 1);

const mapStore = {
  namespaced: true,
  state: {
    sidos: [{ value: null, text: "선택하세요" }],
    guguns: [{ value: null, text: "선택하세요" }],
    dongs: [{ value: null, text: "선택하세요" }],
    houses_origin: [],
    houses: [],
    house: null,
    sidoCode: null,
    gugunCode: null,
    dongCode: null,
    map: null,
    marker: null,
    subway: "",
    store: "",
    price_start: 0,
    price_end: 1000,

    date_start: minDate,
    date_end: new Date(today),
    house_deal: [],
    house_deal_origin: [],
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
    GET_HOUSE_LIST(state, houses) {
      state.houses_origin = houses;
      state.houses = [];
      for (let i = 0; i < state.houses_origin.length; i++) {
        let price =
          parseInt(state.houses_origin[i].recentPrice.replace(",", "")) / 1000;
        console.log(price);
        if (price >= state.price_start && price <= state.price_end) {
          state.houses.push(state.houses_origin[i]);
        }
      }
      //state.house = state.houses[0];
      return;
    },
    SET_HOUSE_LIST(state, price) {
      console.log(price);
      state.price_start = price[0];
      state.price_end = price[1];
      state.houses = [];
      for (let i = 0; i < state.houses_origin.length; i++) {
        let price =
          parseInt(state.houses_origin[i].recentPrice.replace(",", "")) / 1000;
        console.log(price);
        if (price >= state.price_start && price <= state.price_end) {
          state.houses.push(state.houses_origin[i]);
        }
      }
      //state.house = state.houses[0];
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
    SET_DONGCODE(state, dongCode) {
      state.dongCode = dongCode;
      console.log(dongCode);
    },
    GET_HOUSE_DEAL(state, house_deal) {
      state.house_deal = [];
      state.date_start = new Date(state.date_start);
      state.date_end = new Date(state.date_end);
      state.house_deal_origin = house_deal;
      for (let i = 0; i < state.house_deal_origin.length; i++) {
        console.log(state.house_deal_origin[i]);
        var date = new Date(
          state.house_deal_origin[i].dealYear,
          state.house_deal_origin[i].dealMonth - 1,
          state.house_deal_origin[i].dealDay
        );

        if (
          state.date_start.valueOf() <= date.valueOf() &&
          state.date_end.valueOf() >= date.valueOf()
        )
          state.house_deal.push(state.house_deal_origin[i]);
      }
    },

    SET_HOUSE_DEAL(state, value_date) {
      state.house_deal = [];
      state.date_start = new Date(value_date[0]);
      state.date_end = new Date(value_date[1]);
      for (let i = 0; i < state.house_deal_origin.length; i++) {
        console.log(state.house_deal_origin[i]);
        var date = new Date(
          state.house_deal_origin[i].dealYear,
          state.house_deal_origin[i].dealMonth - 1,
          state.house_deal_origin[i].dealDay
        );

        console.log(date.getTime());
        console.log(state.date_start.getTime());
        console.log(state.date_end.getTime());

        if (
          state.date_start.getTime() <= date.getTime() &&
          state.date_end.getTime() >= date.getTime()
        )
          state.house_deal.push(state.house_deal_origin[i]);
      }
      console.log(value_date[0]);
      console.log(value_date[1]);
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
      commit("SET_DONGCODE", dongCode);
      console.log(dongCode);
      const params = { dong: dongCode };
      http
        .get("/map/apt", { params })
        .then((response) => {
          commit("GET_HOUSE_LIST", response.data);
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
    setHouseList({ commit }, price) {
      commit("SET_HOUSE_LIST", price);
    },
    dealInfo({ commit }, aptCode) {
      const params = { aptCode: aptCode };
      http
        .get("/map/apt_detail", { params })
        .then((response) => {
          commit("GET_HOUSE_DEAL", response.data);
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
};

export default mapStore;
