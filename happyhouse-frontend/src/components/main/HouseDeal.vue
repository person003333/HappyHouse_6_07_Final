<template>
  <div>
    <b-table sticky-header responsive :items="house_deal" :fields="fields">
      <template #cell(dealDate)="data">
        {{ data.item.dealYear }}.{{ data.item.dealMonth }}.{{
          data.item.dealDay
        }}
      </template>
    </b-table>
  </div>
</template>

<script>
import http from "@/util/http-common.js";
import { mapState } from "vuex";
const mapStore = "mapStore";
export default {
  name: "Housedeal",
  computed: {
    ...mapState(mapStore, ["house"]),
  },
  data() {
    return {
      house_deal: null,
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
    };
  },
  watch: {
    house(newVal) {
      this.dealInfo(newVal.aptCode);
    },
  },
  mounted() {
    this.dealInfo(this.house.aptCode);
  },

  methods: {
    dealInfo(code) {
      const params = { aptCode: code };
      http
        .get("/map/apt_detail", { params })
        .then((response) => {
          console.log(response.data);
          this.house_deal = response.data;
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
};
</script>

<style lang="scss" scoped></style>
