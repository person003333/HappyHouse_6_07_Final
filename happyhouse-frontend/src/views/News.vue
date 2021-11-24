<template>
  <div>
    <h1>뉴스 페이지</h1>
  </div>
</template>

<script>
import http from "@/util/http-common.js";

export default {
  data() {
    return {
      부동산: [],
      재개발: [],
      가구: [],
      분양: [],
    };
  },
  created() {
    http.get("/api/news/부동산 정책").then(({ data }) => {
      data.items.forEach((el, index) => {
        this.부동산.push({ link: el.originallink, thumbnail: "" });
        this.setThumnailLink(this.부동산, index, el.link);
      });
    });
    http.get("/api/news/재개발").then(({ data }) => {
      data.items.forEach((el, index) => {
        this.재개발.push({ link: el.originallink, thumbnail: "" });
        this.setThumnailLink(this.재개발, index, el.link);
      });
    });
    http.get("/api/news/1인 가구").then(({ data }) => {
      data.items.forEach((el, index) => {
        this.가구.push({ link: el.originallink, thumbnail: "" });
        this.setThumnailLink(this.가구, index, el.link);
      });
    });
    http.get("/api/news/분양").then(({ data }) => {
      data.items.forEach((el, index) => {
        this.분양.push({ link: el.originallink, thumbnail: "" });
        this.setThumnailLink(this.분양, index, el.link);
      });
    });
  },
  methods: {
    setThumnailLink(category, index, link) {
      var request = new XMLHttpRequest();
      request.onreadystatechange = () => {
        if (request.readyState == 4) {
          category[index].thumbnail = request.responseText
            .split('<meta property="og:image"')[1]
            .split('"')[1];
        }
      };
      request.open("GET", link);
      request.send();
    },
  },
};
</script>

<style lang="scss" scoped></style>
