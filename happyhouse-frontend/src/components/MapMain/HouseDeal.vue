<template>
  <div>
    <b-container>
      <line-chart :data="house_deal_chart" :download="true"></line-chart>
      <b-row>
        <b-col>
          <b-form-datepicker
            size="sm"
            v-model="value_start"
            :min="min"
            :max="max"
            locale="ko-kr"
            :date-format-options="{
              year: 'numeric',
              month: 'numeric',
              day: 'numeric',
            }"
          ></b-form-datepicker> </b-col
        >~
        <b-col>
          <b-form-datepicker
            size="sm"
            v-model="value_end"
            :min="min"
            :max="max"
            locale="ko-kr"
            :date-format-options="{
              year: 'numeric',
              month: 'numeric',
              day: 'numeric',
            }"
          ></b-form-datepicker>
        </b-col>
      </b-row>
      <b-row>
        <b-col>
          <b-button block variant="danger" @click="toSearch">검색</b-button>
        </b-col>
      </b-row>
    </b-container>
    <b-table
      class="scrollbar"
      sticky-header
      responsive
      :items="house_deal"
      :fields="fields"
    >
      <template #cell(dealDate)="data">
        {{ data.item.dealYear }}.{{ data.item.dealMonth }}.{{
          data.item.dealDay
        }}
      </template>
    </b-table>
  </div>
</template>

<script>
import { mapState, mapActions, mapMutations } from "vuex";
const mapStore = "mapStore";
export default {
  name: "Housedeal",
  computed: {
    ...mapState(mapStore, [
      "house",
      "date_start",
      "date_end",
      "house_deal",
      "house_deal_chart",
    ]),
  },
  data() {
    const now = new Date();
    const today = new Date(now.getFullYear(), now.getMonth(), now.getDate());
    // 15th two months prior
    const minDate = new Date();
    minDate.setYear(2015);
    minDate.setMonth(0);
    minDate.setDate(1);
    // 15th in two months
    const maxDate = new Date(today);
    return {
      fields: [
        {
          key: "dealAmount",
          label: "거래 금액",
        },
        {
          key: "area",
          label: "면적",
        },
        {
          key: "dealDate",
          label: "판매 일자",
        },
      ],

      min: minDate,
      max: new Date(maxDate),
      value_start: minDate,
      value_end: new Date(maxDate),
    };
  },
  watch: {
    house(newVal) {
      console.log(this.value_start);
      this.dealInfo(newVal.aptCode);
    },
  },
  mounted() {
    this.value_start = this.date_start;
    this.value_end = this.date_end;
    this.dealInfo(this.house.aptCode);
  },

  methods: {
    ...mapActions(mapStore, ["dealInfo"]),
    ...mapMutations(mapStore, ["SET_HOUSE_DEAL"]),
    toSearch() {
      this.SET_HOUSE_DEAL([this.value_start, this.value_end]);
    },
  },
};
</script>

<style lang="scss" scoped></style>
