<template>
  <div>
    <b-form
      id="searchform"
      class="form-inline justify-content-end mt-4"
      method="get"
      onSubmit="return false;"
    >
      <input type="hidden" name="pg" value="1" />
      <b-form-select v-model="key" :options="keys"></b-form-select>
      <input
        type="text"
        class="ml-1 form-control"
        id="sword"
        name="word"
        v-model="word"
        @keyup.enter="search"
      />
      <b-button type="button" id="searchBtn" class="ml-1 btn" @click="search">
        검색
      </b-button>
    </b-form>

    <!-- <b-table
      small
      outlined
      hover
      class="mt-4"
      head-variant="light"
      style="font-size: 1em"
      :items="items"
      selectable
      @row-selected="showView"
    >
    </b-table> -->

    <ul style="padding: 0px; margin: auto" class="mt-5 mb-5">
      <li
        style="padding-left: 4%; padding-right: 10%; border-bottom: solid 0.5px"
      >
        <div
          class="notice-item"
          style="
            display: flex;
            align-items: center;
            justify-content: space-between;
          "
        >
          <div>
            <span
              >번호
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;제목</span
            >
          </div>

          <div
            style="
              width: 40%;
              display: flex;
              align-items: center;
              justify-content: space-between;
            "
          >
            <span>작성자</span><span>조회수</span><span>날짜</span>
          </div>
        </div>
      </li>

      <li
        style="padding-left: 4%; padding-right: 8%"
        v-for="notice in notices"
        :key="notice.id"
      >
        <router-link :to="{ name: 'NoticeView', params: { no: notice.번호 } }">
          <div
            class="notice-item"
            id="notice"
            style="
              display: flex;
              align-items: center;
              justify-content: space-between;
            "
          >
            <div class="d-flex justify-content-between" style="width: 55%">
              <div>
                <span>
                  <strong class="notice_icon" style="color: rgb(250, 70, 124)"
                    ><i class="fa fa-volume-up" aria-hidden="true"></i>
                    [공지사항]</strong
                  >
                </span>
              </div>
              <div style="width: 75%; text-align: left">
                <span>
                  <a style="font-size: 1.15em; margin: 0">{{
                    notice.제목
                  }}</a></span
                >
              </div>
            </div>

            <div
              style="
                width: 44%;
                display: flex;
                align-items: center;
                justify-content: space-between;
              "
            >
              <div style="width: 90px">
                <span class="sv_member" style="color: #d81e22">{{
                  notice.이름
                }}</span>
              </div>
              <span style="width: 60px; text-align: left"
                ><i
                  style="color: #005bfe"
                  class="fa fa-eye"
                  aria-hidden="true"
                ></i
                ><span
                  ><span
                    style="margin: 0 5px 0 3px; color: #005bfe"
                    class="cnt_hit"
                    >{{ notice.조회수 }}</span
                  ></span
                ></span
              ><span> {{ notice.등록일 }}</span>
            </div>
          </div>
        </router-link>
      </li>

      <li
        style="padding-left: 4%; padding-right: 8%"
        v-for="item in items"
        :key="item.id"
      >
        <router-link :to="{ name: 'BoardView', params: { no: item.번호 } }">
          <div
            class="notice-item"
            style="
              display: flex;
              align-items: center;
              justify-content: space-between;
            "
          >
            <div class="d-flex justify-content-between" style="width: 55%">
              <div>
                <span> {{ item.번호 }} &nbsp;</span>
              </div>
              <div style="width: 75%; text-align: left">
                <span
                  ><a style="font-size: 1.15em; margin: 0">{{ item.제목 }}</a>
                </span>
              </div>
            </div>

            <div
              style="
                width: 44%;
                display: flex;
                align-items: center;
                justify-content: space-between;
              "
            >
              <div style="width: 90px">
                <span class="sv_member">{{ item.이름 }}</span>
              </div>
              <span style="width: 60px; text-align: left"
                ><i
                  style="color: #005bfe"
                  class="fa fa-eye"
                  aria-hidden="true"
                ></i
                ><span
                  ><span
                    style="margin: 0 5px 0 3px; color: #005bfel"
                    class="cnt_hit"
                    >{{ item.조회수 }}</span
                  ></span
                ></span
              ><span> {{ item.등록일 }}</span>
            </div>
          </div>
        </router-link>
      </li>
    </ul>

    <div
      id="btn-group"
      class="d-flex justify-content-between"
      style="width: 18%; float: right"
    >
      <b-button
        v-if="this.userInfo.id == 'admin'"
        variant="outline-primary"
        :to="{ name: 'BoardCreate' }"
        >공지사항 작성</b-button
      >
      <b-button v-else variant="outline-info" :to="{ name: 'BoardCreate' }"
        >글 작성</b-button
      >
    </div>
  </div>
</template>

<script>
import http from "@/util/http-common.js";
import { mapState } from "vuex";
const memberStore = "memberStore";
export default {
  name: "BoardList",
  data() {
    return {
      items: [],
      notices: [],
      word: null,
      keys: {
        name: "작성자",
        subject: "제목",
      },
      key: "name",
    };
  },
  created() {
    http.get("/api/notice").then(({ data }) => {
      data.forEach((d) => {
        this.items.push({
          번호: d.noticeNo,
          제목: d.subject,
          작성자: d.id,
          이름: d.name,
          등록일: d.regTime,
          조회수: d.view,
        });
      });
    });

    http.get("/api/notice/notice").then(({ data }) => {
      console.log(data);
      data.forEach((d) => {
        this.notices.push({
          번호: d.noticeNo,
          제목: d.subject,
          작성자: d.id,
          이름: d.name,
          등록일: d.regTime,
          조회수: d.view,
        });
      });
    });
  },
  computed: {
    ...mapState(memberStore, ["userInfo"]),
  },
  methods: {
    showView(item) {
      console.log(item[0].번호);
      this.$router.push({ name: "QnAView", params: { no: item[0].번호 } });
    },

    search() {
      this.items = [];
      const params = { key: this.key, word: this.word };
      http.get("/api/notice", { params }).then(({ data }) => {
        data.forEach((d) => {
          this.items.push({
            번호: d.noticeNo,
            제목: d.subject,
            작성자: d.id,
            이름: d.name,
            등록일: d.regTime,
            조회수: d.view,
          });
        });
      });
    },

    reload() {
      location.reload();
    },
  },
};
</script>

<style lang="scss" scoped>
ul {
  list-style: none;
  margin-top: 3%;
}

.notice-item {
  margin: 2% 0;
}

#notice {
  a {
    color: rgb(250, 70, 124);
  }
}
a {
  color: rgb(87, 91, 114);
}
a:hover {
  text-decoration: none;
}
li:hover {
  background-color: #dadce083;
  cursor: pointer;
}
</style>
