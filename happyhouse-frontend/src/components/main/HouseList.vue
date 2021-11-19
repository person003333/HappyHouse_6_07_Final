<template>
  <div>
    <b-dropdown
      size="lg"
      variant="link"
      toggle-class="text-decoration-none"
      no-caret
    >
      <template #button-content>
        <i class="fas fa-sliders-h"></i>
      </template>

      <b-dropdown-group
        id="dropdown-group-2"
        header="가격(천 만원)"
        style="width: 240px"
      >
        <b-container fluid class="text-center">
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
        </b-container>
        <VueSlider
          :min="0"
          :max="1000"
          :interval="0.01"
          v-model="value_price"
        />
      </b-dropdown-group>

      <b-button block variant="danger">검색</b-button>
    </b-dropdown>
    <b-container
      style="overflow-y: scroll; height: 200px"
      v-if="houses && houses.length != 0"
      class="bv-example-row mt-3"
    >
      <house-list-row
        v-for="(house, index) in houses"
        :key="index"
        :house="house"
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
import HouseListRow from "@/components/main/HouseListRow.vue";
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
  },
  watch: {
    value_price(newVal) {
      console.log(newVal);
      this.setHouseList(newVal);
    },
  },
};
</script>

<style></style>
