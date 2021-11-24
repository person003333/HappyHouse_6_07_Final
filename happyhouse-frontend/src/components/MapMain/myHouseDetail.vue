<template>
  <div>
    <b-container class="bv-example-row">
      <b-row align-h="between">
        <b-col cols="8"
          ><h3 class="mb-4">{{ myhouse.aptName }}</h3></b-col
        >
        <b-col cols="3">
          <img
            src="../../assets/star_chose.png"
            style="height: 36px"
            v-show="check_interest"
            @click="delete_interestedApt([userInfo.id, myhouse.aptCode])"
          />
          <img
            src="../../assets/star_empty.png"
            style="height: 36px"
            v-show="!check_interest"
            @click="
              insert_interestedApt([
                userInfo.id,
                myhouse.aptCode,
                myhouse.aptName,
              ])
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
              <td style="font-size: 1.2em">{{ myhouse.aptName }}</td>
            </tr>
            <tr>
              <td
                class="col-4 table-secondary"
                style="font-size: 1.3em; background-color: #a8c5ed"
              >
                <strong>건축년도</strong>
              </td>
              <td style="font-size: 1.2em">{{ myhouse.buildYear }}년</td>
            </tr>
            <tr>
              <td
                class="col-4 table-secondary"
                style="font-size: 1.3em; background-color: #c0d3ed"
              >
                <strong>주소</strong>
              </td>
              <td style="font-size: 1.2em">
                {{ myhouse.sidoName }} {{ myhouse.gugunName }}
                {{ myhouse.dongName }}
                {{ myhouse.jibun }}
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
                {{ parseInt(myhouse.recentPrice.replace(",", "")) | price }}만
                원
              </td>
            </tr>
          </table>
        </b-col>
      </b-row>
    </b-container>
    <div
      class="d-flex justify-content-around"
      style="width: 100%; text-align: center"
    >
      <div class="badge">
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

      <div class="badge">
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
import { mapState, mapActions } from "vuex";
export default {
  name: "myHouseDetail",
  computed: {
    ...mapState("myhouseStore", ["myhouse", "subway_text", "store_text"]),
    ...mapState("interestedAptStore", ["interestedApt"]),
    ...mapState("memberStore", ["userInfo"]),
  },
  data() {
    return {
      subway: "",
      subwayDist: 0,
      convenient: "",
      convenientDist: 0,
      ps: null,
      check_interest: true,
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
  mounted() {
    this.ps = new window.kakao.maps.services.Places(this.mapInstance);
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
  watch: {
    myhouse(newVal) {
      this.displayPlacehouse(newVal);
      this.check_myInterest();
    },
    interestedApt() {
      this.check_myInterest();
    },
  },
  methods: {
    ...mapActions("myhouseStore", ["setStore", "setSubway"]),
    ...mapActions("interestedAptStore", [
      "insert_interestedApt",
      "delete_interestedApt",
    ]),
    check_myInterest() {
      this.check_interest = false;
      for (let i = 0; i < this.interestedApt.length; i++) {
        if (this.interestedApt[i].aptCode == this.myhouse.aptCode) {
          this.check_interest = true;
          break;
        }
      }
    },

    displayPlacehouse(place) {
      this.setSubway(["없음 (2000m)", null]);
      this.currCategory = "SW8";
      this.ps.categorySearch(this.currCategory, this.placesSearchCB_ss, {
        location: new window.kakao.maps.LatLng(place.lat, place.lng),
        radius: 2000,
      });
      this.setStore(["없음 (2000m)", null]);
      this.currCategory = "CS2";
      this.ps.categorySearch(this.currCategory, this.placesSearchCB_ss, {
        location: new window.kakao.maps.LatLng(place.lat, place.lng),
        radius: 1000,
      });
      this.currCategory = "";
    },
    placesSearchCB_ss(data, status, pagination) {
      console.log("searchcb" + status + " " + pagination);

      if (status === window.kakao.maps.services.Status.OK) {
        // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
        this.displayPlaces_ss(data);
      } else if (status === window.kakao.maps.services.Status.ZERO_RESULT) {
        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
        if (this.currCategory == "SW8") {
          this.setSubway(["없음", null]);
        }
        if (this.currCategory == "CS2") {
          this.setStore(["없음", null]);
        }
      } else if (status === window.kakao.maps.services.Status.ERROR) {
        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
      }
    },
    displayPlaces_ss(places) {
      // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
      // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
      var store_min = 1000;
      var submay_min = 2000;
      var distance;
      for (var i = 0; i < places.length; i++) {
        ((place) => {
          if (place.category_group_code == "SW8") {
            console.log("sw8");
            console.log(place);
            distance = this.calcDistance(
              this.myhouse.lat,
              this.myhouse.lng,
              place.y,
              place.x
            );
            if (parseFloat(submay_min) > parseFloat(distance)) {
              submay_min = distance;
              this.setSubway([
                place.place_name + " (" + distance + "m)",
                place,
              ]);
            }
          } else if (place.category_group_code == "CS2") {
            distance = this.calcDistance(
              this.myhouse.lat,
              this.myhouse.lng,
              place.y,
              place.x
            );
            if (parseFloat(store_min) > parseFloat(distance)) {
              store_min = distance;
              this.setStore([place.place_name + " (" + distance + "m)", place]);
            }
          }
        })(places[i]);
      }
    },

    //거리 계산 함수
    calcDistance(lat1, lon1, lat2, lon2) {
      var theta = lon1 - lon2;
      var dist =
        Math.sin(this.deg2rad(lat1)) * Math.sin(this.deg2rad(lat2)) +
        Math.cos(this.deg2rad(lat1)) *
          Math.cos(this.deg2rad(lat2)) *
          Math.cos(this.deg2rad(theta));
      dist = Math.acos(dist);
      dist = this.rad2deg(dist);
      dist = dist * 60 * 1.1515;
      dist = dist * 1.609344;
      return Number(dist * 1000).toFixed(2);
    },

    deg2rad(deg) {
      return (deg * Math.PI) / 180;
    },
    rad2deg(rad) {
      return (rad * 180) / Math.PI;
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
