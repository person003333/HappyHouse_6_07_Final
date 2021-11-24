<template>
  <div>
    <h1 style="text-align: center; margin-bottom: 50px">
      <strong>추천 뉴스</strong>
    </h1>
    <div></div>

    <hr
      style="
        height: 10px;
        margin: 5% 10%;
        border: 0;
        box-shadow: 0 10px 10px -15px #8c8b8b inset;
      "
    />
    <h1 style="text-align: center; margin-bottom: 50px">
      <strong>오늘의 뉴스</strong>
    </h1>
    <div class="d-flex justify-content-around">
      <div>
        <h2 class="category">
          <strong>부동산</strong>
        </h2>
        <news-carousel :newsList="부동산"></news-carousel>
      </div>
      <div>
        <h2 class="category">
          <strong>재개발</strong>
        </h2>
        <news-carousel :newsList="재개발"></news-carousel>
      </div>
    </div>
    <div
      class="d-flex justify-content-around"
      style="margin-top: 5%; margin-bottom: 10%"
    >
      <div>
        <h2 class="category">
          <strong>1인 가구</strong>
        </h2>
        <news-carousel :newsList="가구"></news-carousel>
      </div>
      <div>
        <h2 class="category">
          <strong>분양</strong>
        </h2>
        <news-carousel :newsList="분양"></news-carousel>
      </div>
    </div>
  </div>
</template>

<script>
import http from "@/util/http-common.js";
import NewsCarousel from "../components/News/NewsCarousel.vue";
export default {
  components: {
    NewsCarousel,
  },
  data() {
    return {
      부동산: [],
      재개발: [],
      가구: [],
      분양: [],
      slide: 0,
      sliding: null,
    };
  },
  created() {
    http.get("/api/news/부동산 정책").then(({ data }) => {
      data.items.forEach((el, index) => {
        this.부동산.push({
          link: el.originallink,
          title: "",
          thumbnail: "",
        });
        this.setThumnailLink(this.부동산, index, el.link);
      });
    });
    http.get("/api/news/재개발").then(({ data }) => {
      data.items.forEach((el, index) => {
        this.재개발.push({
          link: el.originallink,
          title: "",
          thumbnail: "",
        });
        this.setThumnailLink(this.재개발, index, el.link);
      });
    });
    http.get("/api/news/1인 가구").then(({ data }) => {
      data.items.forEach((el, index) => {
        this.가구.push({
          link: el.originallink,
          title: "",
          thumbnail: "",
        });
        this.setThumnailLink(this.가구, index, el.link);
      });
    });
    http.get("/api/news/분양").then(({ data }) => {
      data.items.forEach((el, index) => {
        this.분양.push({
          link: el.originallink,
          title: "",
          thumbnail: "",
        });
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

          category[index].title = request.responseText
            .split('<meta property="og:title"')[1]
            .split('"')[1];
        }
      };
      request.open("GET", link);
      request.send();
    },
    onSlideStart() {
      this.sliding = true;
    },
    onSlideEnd() {
      this.sliding = false;
    },
  },
};
</script>

<style lang="scss">
.img-wrapper :hover {
  cursor: pointer;
}
.carousel-caption {
  position: relative !important;
  left: 0 !important;
  padding: 0 !important;
  bottom: 20% !important;

  h2 {
    padding: 5px 40px;
  }
}
.category {
  border-bottom: 6px solid #6565b6d0;
  width: 200px;
  text-align: center;
  margin: 30px auto;
}
</style>
