<template>
  <div>
    <b-container class="bv-example-row">
      <b-row align-h="between">
        <b-col cols="8" @click="clickApt()"
          ><h3 class="mb-4">{{ house.aptName }}</h3></b-col
        >
        <b-col cols="3">
          <img
            src="../../assets/star_chose.png"
            style="height: 36px"
            v-show="check_interest"
            @click="delete_interestedApt([userInfo.id, house.aptCode])"
          />
          <img
            src="../../assets/star_empty.png"
            style="height: 36px"
            v-show="!check_interest"
            @click="
              insert_interestedApt([userInfo.id, house.aptCode, house.aptName])
            "
          />
        </b-col>
      </b-row>
      <b-row class="d-flex x justify-content-center mb-4"
        ><b-col cols="10" align-self="stretch"
          ><b-img :src="require('@/assets/apt.png')" fluid-grow></b-img></b-col
      ></b-row>
      <b-row class="mb-2 mt-1">
        <b-col>
          <table class="table" style="border: 1px solid #dee2e6">
            <tr>
              <td
                class="col-4 table-secondary"
                style="font-size: 1.3em; background-color: #c0d3ed"
              >
                <strong>아파트 명</strong>
              </td>
              <td style="font-size: 1.2em">{{ house.aptName }}</td>
            </tr>
            <tr>
              <td
                class="col-4 table-secondary"
                style="font-size: 1.3em; background-color: #a8c5ed"
              >
                <strong>건축년도</strong>
              </td>
              <td style="font-size: 1.2em">{{ house.buildYear }}년</td>
            </tr>
            <tr>
              <td
                class="col-4 table-secondary"
                style="font-size: 1.3em; background-color: #c0d3ed"
              >
                <strong>주소</strong>
              </td>
              <td style="font-size: 1.2em">
                {{ house.sidoName }} {{ house.gugunName }} {{ house.dongName }}
                {{ house.jibun }}
              </td>
            </tr>
            <tr>
              <td
                class="col-4 table-secondary"
                style="font-size: 1.3em; background-color: #a8c5ed"
              >
                <strong>거래금액</strong>
              </td>
              <td style="font-size: 1.2em">
                {{ parseInt(house.recentPrice.replace(",", "")) | price }}만 원
              </td>
            </tr>
            <!-- <tr @click="clickSubway">
              <td
                class="col-4 table-secondary"
                style="font-size: 1.3em; background-color: #c0d3ed"
              >
                <strong>지하철</strong>
              </td>
              <td>{{ subway_text }}</td>
            </tr>
            <tr @click="clickStore">
              <td>편의점</td>
              <td>{{ store_text }}</td>
            </tr> -->
          </table>
        </b-col>
      </b-row>
    </b-container>
    <div
      class="d-flex justify-content-around"
      style="width: 100%; text-align: center"
    >
      <div class="badge" @click="clickSubway">
        <img src="../../assets/subway.png" style="height: 80px" />
        <div class="d-flex flex-column mt-2" style="font-size: 1.3em">
          <span style="display: none">{{ subway_text }}</span>
          <span>{{ subway }}</span>
          <span>({{ subwayDist }}m)</span>
          <br />
          <div v-if="subwayDist < 400" class="d-flex flex-column">
            <img
              src="../../assets/green.png"
              style="max-height: 40px; margin: 10px auto"
              alt=""
            />
            <span style="font-size: 0.8em">도보 5분 이내!</span>
          </div>
          <div v-else-if="subwayDist < 1000" class="d-flex flex-column">
            <img
              src="../../assets/yellow.png"
              style="max-height: 40px; margin: 10px auto"
              alt=""
            />
            <span style="font-size: 0.8em">도보 15분 이내</span>
          </div>
          <div v-else class="d-flex flex-column">
            <img
              src="../../assets/red.png"
              style="max-height: 40px; margin: 10px auto"
              alt=""
            />
            <span style="font-size: 0.8em">너무 멀어요ㅠㅠ</span>
          </div>
        </div>
      </div>

      <div class="badge" style="width: 200px" @click="clickStore">
        <img src="../../assets/convenientstore.png" style="height: 80px" />
        <div class="d-flex flex-column mt-2" style="font-size: 1.3em">
          <span style="display: none">{{ store_text }}</span>
          <span>{{ convenient }}</span>
          <span>({{ convenientDist }}m)</span>
          <br />
          <div v-if="convenientDist < 150" class="d-flex flex-column">
            <img
              src="../../assets/green.png"
              style="max-height: 40px; margin: 10px auto"
              alt=""
            />
            <span style="font-size: 0.8em">바로 코 앞!</span>
          </div>
          <div v-else-if="convenientDist < 300" class="d-flex flex-column">
            <img
              src="../../assets/yellow.png"
              style="max-height: 40px; margin: 10px auto"
              alt=""
            />
            <span style="font-size: 0.8em">걸어갈 만 해요</span>
          </div>
          <div v-else class="d-flex flex-column">
            <img
              src="../../assets/red.png"
              style="max-height: 40px; margin: 10px auto"
              alt=""
            />
            <span style="font-size: 0.8em">쪼오금만 걸어봅시다</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import EventBus from "@/api/EventBus.js";
import { mapActions, mapState } from "vuex";
const mapStore = "mapStore";
export default {
  name: "HouseDetail",
  computed: {
    ...mapState(mapStore, ["house", "subway_text", "store_text"]),
    ...mapState("interestedAptStore", ["interestedApt"]),
    ...mapState("memberStore", ["userInfo"]),
  },
  data() {
    return {
      subway: "",
      subwayDist: 0,
      convenient: "",
      convenientDist: 0,
      check_interest: false,
    };
  },
  created() {
    let sub = this.subway_text.split(` (`);
    this.subway = sub[0];
    this.subwayDist = sub[1].substr(0, sub[1].length - 2);
    console.log(this.subway_text);

    let con = this.store_text.split(` (`);
    this.convenient = con[0];
    this.convenientDist = con[1].substr(0, con[1].length - 2);
  },

  updated() {
    let sub = this.subway_text.split(` (`);
    this.subway = sub[0];
    this.subwayDist = sub[1].substr(0, sub[1].length - 2);
    console.log(this.subway_text);

    let con = this.store_text.split(` (`);
    this.convenient = con[0];
    this.convenientDist = con[1].substr(0, con[1].length - 2);
  },
  filters: {
    price(value) {
      if (!value) return value;
      return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    },
  },
  methods: {
    ...mapActions("interestedAptStore", [
      "insert_interestedApt",
      "delete_interestedApt",
    ]),
    clickApt() {
      EventBus.$emit("display_apt", "안녕");
    },

    clickSubway() {
      EventBus.$emit("push-subway", "안녕");
    },
    clickStore() {
      EventBus.$emit("push-store", "안녕");
    },
    check_myInterest() {
      this.check_interest = false;
      for (let i = 0; i < this.interestedApt.length; i++) {
        if (this.interestedApt[i].aptCode == this.house.aptCode) {
          this.check_interest = true;
          break;
        }
      }
    },
  },
  watch: {
    house(newVal) {
      console.log(newVal);
      this.check_myInterest();
    },
    interestedApt() {
      this.check_myInterest();
    },
  },
};
</script>

<style scoped>
table {
  font-size: 9pt !important;
}
.badge:hover {
  cursor: pointer;
}
</style>
