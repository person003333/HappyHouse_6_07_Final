<template>
  <section id="index_section">
    <b-container class="bv-example-row mt-3 text-center">
      <div class="card col-sm-12 mt-1" style="min-height: 400px">
        <b-row>
          <b-col>
            <house-search-bar></house-search-bar>
          </b-col>
        </b-row>
        <div class="col-12" id="map_info">
          <KakaoMap ref="kmap" class="kmap" :options="mapOption" />
        </div>
      </div>
      <b-row>
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
import HouseSearchBar from "@/components/main/HouseSearchBar.vue";
import HouseList from "@/components/main/HouseList.vue";
import HouseDetail from "@/components/main/HouseDetail.vue";
import HouseDeal from "@/components/main/HouseDeal.vue";
import KakaoMap from "@/components/main/KakaoMap.vue";

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
#index_section {
  margin-left: 70px;
}
</style>
