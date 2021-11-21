<template>
  <section id="index_section" class="d-flex justify-content-center">
    <b-container class="bv-example-row mt-3 text-center" style="width=100%">
      <div class="col-sm-12 mt-1" style="min-height: 400px">
        <b-row id="house-search" style="width: 40%">
          <b-col>
            <house-search-bar></house-search-bar>
          </b-col>
        </b-row>
        <KakaoMap ref="kmap" class="kmap" :options="mapOption" />
      </div>
      <b-row id="search-info">
        <b-col cols="3" align="left">
          <house-list />
        </b-col>
        <b-col cols="5">
          <house-detail />
        </b-col>
        <b-col cols="4">
          <house-deal />
        </b-col>
      </b-row>
    </b-container>
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
  methods: {},
};
</script>
<style scoped>
.container {
  max-width: 90vw !important;
}
#index_section {
  margin-bottom: 0px !important;
  height: 92.5%;
}
#house-search {
  position: absolute;
  left: 400px;
  z-index: 20;
}

#search-info {
  position: relative;
  top: 250px;
}
</style>
