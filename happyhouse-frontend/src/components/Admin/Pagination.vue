<template>
  <ul class="pagination justify-content-center">
    <li class="page-item" v-if="prev">
      <router-link
        :to="{
          name: 'BoardList',
          params: {
            page: startPageIndex - 1,
            spp: this.listRowCount,
          },
        }"
        class="page-link"
        aria-label="Previous"
        @click.native="movePage(startPageIndex - 1)"
      >
        <span aria-hidden="true">&laquo;</span>
      </router-link>
    </li>

    <li
      v-for="index in endPageIndex - startPageIndex + 1"
      :key="index"
      class="page-item"
      :class="{ active: startPageIndex + index - 1 == currentPageIndex }"
    >
      <router-link
        :to="{
          name: 'UserManage',
          params: {
            page: startPageIndex + index - 1,
            spp: listRowCount,
          },
        }"
        class="page-link"
        @click.native="movePage(startPageIndex + index - 1)"
        >{{ startPageIndex + index - 1 }}</router-link
      >
      <!-- <a class="page-link" href="javascript:movePage(' + i + ')">' + i + '</a> -->
    </li>

    <li class="page-item" v-if="next">
      <router-link
        :to="{
          name: 'BoardList',
          params: {
            page: endPageIndex + 1,
            spp: listRowCount,
          },
        }"
        class="page-link"
        aria-label="Next"
        @click.native="movePage(endPageIndex + 1)"
      >
        <span aria-hidden="true">&raquo;</span>
      </router-link>
    </li>
  </ul>
</template>

<script>
import http from "@/util/http-common.js";
export default {
  name: "Pagination",
  data() {
    return {
      totalListItemCount: 0,
      listRowCount: 6,
      pageLinkCount: 5,
      currentPageIndex: 1,

      pageCount: 0,
      startPageIndex: 0,
      endPageIndex: 0,
      prev: false,
      next: false,
    };
  },
  methods: {
    movePage(param) {
      this.currentPageIndex = param;
      this.initComponent();
    },

    initComponent() {
      console.log("이닛");
      http
        .get("/api/user/total")
        .then(({ data }) => {
          this.totalListItemCount = data;
          this.initUI();
        })
        .catch((err) => {
          alert("에러가 발생했습니다.");
          console.log(err);
        });
    },
    initUI() {
      this.pageCount = Math.ceil(this.totalListItemCount / this.listRowCount);

      if (this.currentPageIndex % this.pageLinkCount == 0) {
        this.startPageIndex =
          (this.currentPageIndex / this.pageLinkCount - 1) *
            this.pageLinkCount +
          1;
      } else {
        this.startPageIndex =
          Math.floor(this.currentPageIndex / this.pageLinkCount) *
            this.pageLinkCount +
          1;
      }

      if (this.currentPageIndex % this.pageLinkCount == 0) {
        //10, 20...맨마지막
        this.endPageIndex =
          (this.currentPageIndex / this.pageLinkCount - 1) *
            this.pageLinkCount +
          this.pageLinkCount;
      } else {
        this.endPageIndex =
          Math.floor(this.currentPageIndex / this.pageLinkCount) *
            this.pageLinkCount +
          this.pageLinkCount;
      }

      if (this.endPageIndex > this.pageCount) {
        this.endPageIndex = this.pageCount;
      }

      if (this.currentPageIndex <= this.pageLinkCount) {
        this.prev = false;
      } else {
        this.prev = true;
      }

      if (this.endPageIndex >= this.pageCount) {
        this.endPageIndex = this.pageCount;
        this.next = false;
      } else {
        this.next = true;
      }
    },
  },
  watch: {
    currentPageIndex: function () {
      this.initUI();
    },
  },
  created() {
    this.initComponent();
  },
  mounted() {
    // this.$router.push("list?no=" + this.listRowCount);
  },
};
</script>

<style lang="scss" scoped></style>
