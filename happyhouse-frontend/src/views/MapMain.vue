<template>
  <section id="index_section" class="d-flex justify-content-center">
    <KakaoMap ref="kmap" class="kmap" :options="mapOption" />
    <div id="toggleBtn" v-show="!toggle" @click="toggle = !toggle">
      <span style="position: absolute; top: 25%; left: 25%; color: white">
        <i class="fas fa-list fa-2x"></i>
      </span>
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

      <!-- <div style="font-size: calc(5em)">
        <label class="toggle happy-sad">
          <input type="checkbox" class="toggle-checkbox" />
          <div class="toggle-btn"></div>
        </label>
      </div> -->

      <house-search-bar
        id="house-search"
        style="width: 100%; margin: 0px"
        class="d-flex justify-content-center"
      ></house-search-bar>
      <div v-show="list">
        <house-list v-on:toDetail="toDetail"></house-list>
      </div>
      <div v-show="!list">
        <div id="toList" @click="list = !list">
          <i class="fas fa-arrow-left"></i> <span>목록으로</span>
        </div>
        <house-detail style="width: 90%; margin: 10px auto" />
        <house-deal style="width: 90%; margin: 20px auto" />
      </div>
    </div>
  </section>
</template>

<script>
import HouseSearchBar from "@/components/MapMain/HouseSearchBar.vue";
import HouseList from "@/components/MapMain/HouseList.vue";
import HouseDetail from "@/components/MapMain/HouseDetail.vue";
import HouseDeal from "@/components/MapMain/HouseDeal.vue";
import KakaoMap from "@/components/MapMain/KakaoMap.vue";

import { mapState } from "vuex";

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
    };
  },
  components: {
    HouseSearchBar,
    HouseList,
    HouseDetail,
    HouseDeal,
    KakaoMap,
  },
  computed: {
    ...mapState(mapStore, ["map", "marker", "houses", "dongCode", "house"]),
  },
  mounted() {},
  methods: {
    toDetail() {
      this.list = !this.list;
    },
  },
  watch: {
    house() {
      this.list = false;
    },
    dongCode(newVal) {
      console.log(newVal);
      this.list = true;
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

#x :hover {
  cursor: pointer;
}

/* .toggle {
  position: relative;
  width: 1em;
  height: 0.1em;
  border-radius: 0.5em;
  border: 0.015em solid #9f9f9f;
  background-image: linear-gradient(#f2f2f2, #fff, #f2f2f2);
  margin: 0.26em 0.15em;
  cursor: pointer;
  filter: drop-shadow(0.015em 0.015em 0.01em rgba(0, 0, 0, 0.3));
}

.toggle-btn::after {
  position: absolute;
  top: -0.14rem;
  left: 0;
  width: 50%;
  font-size: 0.35em;
  text-align: center;
  transition: all 500ms cubic-bezier(0.34, 0.78, 0.55, 1.4);
}

.toggle-checkbox {
  position: absolute;
  visibility: hidden;
}

.toggle-checkbox:checked + .toggle-btn::after {
  left: 50%;
}


.happy-sad .toggle-btn::after {
  content: "😁zz";
}

.happy-sad .toggle-checkbox:checked + .toggle-btn::after {
  content: "😭";
} */
</style>
