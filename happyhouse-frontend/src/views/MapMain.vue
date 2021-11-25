<template>
  <section id="index_section" class="d-flex justify-content-center">
    <div id="mytoggleBtn">
      <b-dropdown
        id="dropdown-right"
        dropleft
        text="관심 목록"
        variant="primary"
        class="m-2"
      >
        <b-table
          sticky-header
          responsive
          :items="interestedApt"
          :fields="fields"
          style="max-height: 470px"
        >
          <template #cell(aptName)="data">
            <div @click="chosemyhouse(data.item.aptCode)">
              {{ data.item.aptName }}
            </div>
          </template>
        </b-table>
      </b-dropdown>
    </div>
    <KakaoMap ref="kmap" class="kmap" :options="mapOption" />
    <div style="width: 1100px">
      <house-search-bar
        id="house-search"
        style="width: 480px; position:relative;margin 0px !important;padding:15px !important; background-color:red;
    background-color: #7a7ad85e;
    border-radius: 15px;"
        class="d-flex justify-content-center"
      ></house-search-bar>
    </div>

    <div id="toggleBtn" v-show="!toggle" @click="toggle = !toggle">
      <span style="position: absolute; top: 25%; left: 25%; color: white">
        <i class="fas fa-list fa-2x"></i>
      </span>
    </div>
    <div
      id="myinfo_only"
      class="scrollbar"
      style="border-radius: 10px; z-index: 10"
      v-if="!toggle"
      v-show="mytoggle"
    >
      <span
        id="x"
        v-show="mytoggle"
        style="position: relative; left: 90%; top: 1%"
        @click="mytoggle = false"
      >
        <i class="fas fa-times fa-2x"></i
      ></span>

      <div>
        <my-house-detail style="width: 90%; margin: 10px auto" />
        <my-house-deal style="width: 90%; margin: 20px auto" />
      </div>
    </div>
    <div>
      <div
        id="myinfo"
        class="scrollbar"
        style="border-radius: 10px"
        v-show="mytoggle"
        v-if="toggle"
      >
        <span
          id="x"
          v-show="mytoggle"
          style="position: relative; left: 90%; top: 1%"
          @click="mytoggle = false"
        >
          <i class="fas fa-times fa-2x"></i
        ></span>

        <div>
          <my-house-detail style="width: 90%; margin: 10px auto" />
          <my-house-deal style="width: 90%; margin: 20px auto" />
        </div>
      </div>

      <div
        id="info"
        class="scrollbar"
        style="border-radius: 10px"
        v-show="toggle"
      >
        <span
          id="x"
          v-show="toggle"
          style="position: relative; left: 90%; top: 1%"
          @click="toggle = !toggle"
        >
          <i class="fas fa-times fa-2x"></i
        ></span>

        <div v-show="list">
          <house-list v-on:toDetail="toDetail"></house-list>
        </div>
        <div v-show="!list">
          <div
            id="toList"
            @click="list = !list"
            style="position: absolute; top: 0%"
          >
            <i class="fas fa-arrow-left"></i> <span>목록으로</span>
          </div>
          <house-detail :house="house" style="width: 90%; margin: 10px auto" />
          <house-deal style="width: 90%; margin: 20px auto" />
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import HouseSearchBar from "@/components/MapMain/HouseSearchBar.vue";
import HouseList from "@/components/MapMain/HouseList.vue";
import HouseDetail from "@/components/MapMain/HouseDetail.vue";
import HouseDeal from "@/components/MapMain/HouseDeal.vue";
import MyHouseDetail from "@/components/MapMain/myHouseDetail.vue";
import MyHouseDeal from "@/components/MapMain/myHouseDeal.vue";
import KakaoMap from "@/components/MapMain/KakaoMap.vue";

import { mapState, mapActions } from "vuex";

// import MarkerHandler from "@/components/main/marker-handler";

const mapStore = "mapStore";

export default {
  data() {
    return {
      mapOption: {
        center: {
          lat: 33.450701,
          lng: 126.570667,
        },
        level: 5,
      },
      markers: null,
      markers_apt: [],
      markers_category: [],
      harbors: [],
      list: true,
      toggle: true,
      mytoggle: false,

      fields: [
        {
          key: "aptNickName",
          label: "아파트",
          sortable: true,
        },
      ],
    };
  },
  components: {
    HouseSearchBar,
    HouseList,
    HouseDetail,
    HouseDeal,
    MyHouseDetail,
    MyHouseDeal,
    KakaoMap,
  },
  computed: {
    ...mapState(mapStore, ["map", "marker", "houses", "dongCode", "house"]),
    ...mapState("interestedAptStore", ["interestedApt"]),
    ...mapState("memberStore", ["userInfo"]),
  },
  mounted() {
    this.get_interestedApt(this.userInfo.id);
  },
  methods: {
    ...mapActions("myhouseStore", ["detailHouse"]),
    ...mapActions("interestedAptStore", ["get_interestedApt"]),

    toDetail() {
      this.list = !this.list;
    },

    chosemyhouse(aptCode) {
      this.detailHouse(aptCode);
      this.mytoggle = true;
    },
  },
  watch: {
    house() {
      this.list = false;
      this.toggle = true;
    },
    dongCode(newVal) {
      console.log(newVal);
      this.list = true;
      this.toggle = true;
    },
  },
};
</script>
<style scoped>
.container {
  max-width: 98.1% !important;
  padding: 0px;
  margin: 0px;
}
#index_section {
  margin-bottom: 0px !important;
  height: 92.5%;
  width: 95%;
}

.map_wrap {
  position: absolute;
  top: 70px;
  height: 92.5% !important;
  z-index: 0;
}
#myinfo_only {
  position: absolute;
  left: 72%;
  top: 10%;
  z-index: 5;
  width: 25%;
  height: 85%;
  background-color: #f7f8fa;
}
#myinfo {
  position: absolute;
  left: 47%;
  top: 10%;
  z-index: 5;
  width: 25%;
  height: 85%;
  background-color: #f7f8fa;
}
#info {
  position: absolute;
  left: 72%;
  top: 10%;
  z-index: 5;
  width: 25%;
  height: 85%;
  background-color: #f7f8fa;
}
#toList {
  margin: 20px 10px;
}

#toList :hover {
  cursor: pointer;
}

.toggle {
  color: #c3b4d9;
  position: relative;
  left: 90%;
  top: 1%;
}
.mytoggle {
  color: #c3b4d9;
  position: relative;
  left: 90%;
  top: 1%;
}

#toggleBtn {
  width: 70px;
  height: 70px;
  background-color: #293e6d;
  border-radius: 50px;
  position: absolute;
  left: 94.4%;
  top: 9%;
  transition-property: all;
  transition-duration: 300ms;
}

#toggleBtn:hover {
  background: #afafd3;
  cursor: pointer;
  color: #7a7ad8;
  box-shadow: none;
}

#mytoggleBtn {
  position: absolute;
  right: 250px;
  top: 20px;
  transition-property: all;
  transition-duration: 300ms;
}

#mytoggleBtn:hover {
  background: #afafd3;
  cursor: pointer;
  color: #7a7ad8;
  box-shadow: none;
}
#x :hover {
  cursor: pointer;
}
</style>
