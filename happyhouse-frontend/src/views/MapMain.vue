<template>
  <section id="index_section" class="d-flex justify-content-center">
    <KakaoMap ref="kmap" class="kmap" :options="mapOption" />
    <div id="info" class="scrollbar" style="border-radius: 5px">
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
    ...mapState(mapStore, ["map", "marker", "houses"]),
  },
  mounted() {},
  methods: {
    toDetail() {
      this.list = !this.list;
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

#search-info {
  position: relative;
  top: 250px;
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
  height: 89%;
  background-color: #f7f8fa;
}
#toList {
  margin: 20px 10px;
}

#toList :hover {
  cursor: pointer;
}
</style>
