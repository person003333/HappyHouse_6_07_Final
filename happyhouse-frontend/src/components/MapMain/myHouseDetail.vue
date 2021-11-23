<template>
  <b-container class="bv-example-row">
    <b-row>
      <b-col
        ><h3 class="mb-4">{{ myhouse.aptName }}</h3></b-col
      >
    </b-row>
    <b-row class="d-flex x justify-content-center mb-4"
      ><b-col cols="10" align-self="stretch"
        ><b-img :src="require('@/assets/apt.png')" fluid-grow></b-img></b-col
    ></b-row>
    <b-row class="mb-2 mt-1">
      <b-col>
        <table class="table">
          <tr class="table-secondary">
            <td class="col-4">아파트 명</td>
            <td class="col-8">{{ myhouse.aptName }}</td>
          </tr>
          <tr class="table-primary">
            <td>건축년도</td>
            <td>{{ myhouse.buildYear }}</td>
          </tr>
          <tr class="table-info">
            <td>주소</td>
            <td>
              {{ myhouse.sidoName }} {{ myhouse.gugunName }} <br />
              {{ myhouse.dongName }} {{ myhouse.jibun }}
            </td>
          </tr>
          <tr class="table-danger">
            <td>거래금액</td>
            <td>
              {{
                (parseInt(myhouse.recentPrice.replace(",", "")) * 10000)
                  | price
              }}원
            </td>
          </tr>
          <tr class="table-warning" @click="clickSubway">
            <td>지하철</td>
            <td>{{ subway_text }}</td>
          </tr>
          <tr class="table-success" @click="clickStore">
            <td>편의점</td>
            <td>{{ store_text }}</td>
          </tr>
        </table>
      </b-col>
    </b-row>
  </b-container>
</template>

<script>
import EventBus from "@/api/EventBus.js";
import { mapState } from "vuex";
export default {
  name: "myHouseDetail",
  computed: {
    ...mapState("myhouseStore", ["myhouse", "subway_text", "store_text"]),
  },
  data() {
    return {
      house: null,
    };
  },
  filters: {
    price(value) {
      if (!value) return value;
      return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    },
  },
  methods: {
    clickSubway() {
      EventBus.$emit("push-subway", "안녕");
    },
    clickStore() {
      EventBus.$emit("push-store", "안녕");
    },
  },
};
</script>

<style>
table {
  font-size: 8pt;
}
</style>
