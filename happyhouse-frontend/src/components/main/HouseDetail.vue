<template>
  <b-container class="bv-example-row">
    <b-row>
      <b-col
        ><h3>{{ house.aptName }}</h3></b-col
      >
    </b-row>
    <b-row class="mb-2 mt-1">
      <b-col cols="5" align-self="stretch"
        ><b-img :src="require('@/assets/apt.png')" fluid-grow></b-img
      ></b-col>
      <b-col>
        <table class="table">
          <tr class="table-secondary">
            <td class="col-4">아파트 명</td>
            <td class="col-8">{{ house.aptName }}</td>
          </tr>
          <tr class="table-primary">
            <td>건축년도</td>
            <td>{{ house.buildYear }}</td>
          </tr>
          <tr class="table-info">
            <td>주소</td>
            <td>
              {{ house.sidoName }} {{ house.gugunName }} <br />
              {{ house.dongName }} {{ house.jibun }}
            </td>
          </tr>
          <tr class="table-danger">
            <td>거래금액</td>
            <td>
              {{
                (parseInt(house.recentPrice.replace(",", "")) * 10000) | price
              }}원
            </td>
          </tr>
          <tr class="table-warning">
            <td>지하철</td>
            <td>{{ subway }}</td>
          </tr>
          <tr class="table-success">
            <td>편의점</td>
            <td>{{ store }}</td>
          </tr>
        </table>
      </b-col>
    </b-row>
  </b-container>
</template>

<script>
import { mapState } from "vuex";
const mapStore = "mapStore";
export default {
  name: "HouseDetail",
  computed: {
    ...mapState(mapStore, ["house", "subway", "store"]),
  },
  filters: {
    price(value) {
      if (!value) return value;
      return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    },
  },
};
</script>

<style>
table {
  font-size: 8pt;
}
</style>
