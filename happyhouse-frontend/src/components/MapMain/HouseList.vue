<template>
  <div>
    <b-container fluid class="text-center">
      <b-row>
        <b-col cols="8">
          가격(천 만원)
          <b-row align-h="between">
            <b-col cols="5">
              <input
                style="width: 100%"
                type="number"
                v-model="value_price[0]"
              />
            </b-col>
            <b-col cols="2">~</b-col>
            <b-col cols="5">
              <input
                style="width: 100%"
                type="number"
                v-model="value_price[1]"
              />
            </b-col>
          </b-row>
          <VueSlider
            :min="0"
            :max="1000"
            :interval="0.01"
            v-model="value_price"
          />
        </b-col>
        <b-col align-self="center">
          <b-button block style="background-color: #7a7ad8" @click="toSearch"
            >검색</b-button
          >
        </b-col>
      </b-row>
    </b-container>
    <b-container
      style="height: 100%"
      v-if="houses && houses.length != 0"
      class="bv-example-row mt-3"
    >
      <house-list-row
        v-for="(house, index) in houses"
        :key="index"
        :house="house"
        :index="index"
        v-on="$listeners"
      />
    </b-container>
    <b-container v-else class="bv-example-row mt-3">
      <b-row>
        <b-col><b-alert show> 목록이 없습니다.</b-alert></b-col>
      </b-row>
    </b-container>
  </div>
</template>

<script>
import VueSlider from "vue-slider-component";
import HouseListRow from "@/components/MapMain/HouseListRow.vue";
import { mapState, mapActions } from "vuex";

import "vue-slider-component/theme/default.css";

const mapStore = "mapStore";
export default {
  name: "HouseList",
  components: {
    HouseListRow,
    VueSlider,
  },
  data() {
    return {
      value_price: [0, 50],
    };
  },
  computed: {
    ...mapState(mapStore, ["houses", "price_start", "price_end"]),
  },
  mounted() {
    this.value_price = [this.price_start, this.price_end];
  },
  methods: {
    ...mapActions(mapStore, ["setHouseList"]),
    toSearch() {
      this.setHouseList(this.value_price);
    },
  },
  watch: {
    // value_price(newVal) {
    //   console.log(newVal);
    //   this.setHouseList(newVal);
    // },
  },
};
</script>

<style></style>
