<template>
  <div>
    <div class="d-flex justify-content-between">
      <a class="btn" style="font-size: 1.2em"
        ><i class="fa fa-list" aria-hidden="true"></i> 목록</a
      >
      <div>
        같은 유저일때만
        <span class="btn">수정하기</span><span class="btn">삭제하기</span>
      </div>
    </div>
    <div id="container">
      <article style="width: 70%; margin: auto">
        <header>
          <h2 id="bo_v_title">
            <span> 글 제목</span>
          </h2>
          <p><i class="far fa-clock"></i> 21-11-22 08:58</p>
        </header>

        <section
          id="bo_v_info"
          class="d-flex justify-content-between"
          style="width: 70%; margin: auto; font-size: 0.9em; color: gray"
        >
          <span>작성자: 으잉zz</span>

          <span class="sound_only"
            >조회: <i class="fa fa-eye" aria-hidden="true"></i>
            {{ board.view }}</span
          >
          <span class="sound_only"
            >댓글: <i class="fa fa-commenting-o" aria-hidden="true"></i>
            {{ board.comment.length }}건</span
          >
        </section>

        <section id="bo_v_atc">
          <div id="bo_v_img"></div>

          <div
            id="bo_v_con"
            class="mt-5 mb-5"
            style="
              min-height: 300px;
              margin: auto;
              text-align: left;
              font-size: 1.2em;
            "
          >
            {{ board.content }}
          </div>
        </section>

        <!-- 댓글 리스트 -->
        <section id="bo_vc">
          <h4 style="text-align: left">댓글목록</h4>
          <hr />
          <p id="bo_vc_empty" style="color: #d15ca4">등록된 댓글이 없습니다.</p>
          <div>댓글을</div>
        </section>
      </article>
    </div>
  </div>
</template>

<script>
import http from "@/util/http-common.js";

export default {
  name: "QnAView",
  data() {
    return {
      board: {
        id: "",
        name: "",
        subject: "",
        regtime: "",
        content: "",
        view: "",
        comment: [{ id: "hel", name: "김김", com: "ㅋㅋㅋ" }],
      },
    };
  },
  created() {
    http.get(`/api/notice/${this.$route.params.no}`).then(({ data }) => {
      this.board.id = data.id;
      this.board.name = data.name;
      this.board.subject = data.subject;
      this.board.regtime = data.regtime;
      this.board.content = data.content;
      this.board.view = data.view;
      console.log(data);
    });
  },
  methods: {
    deleteQnA() {
      http
        .delete(`/qna/${this.$route.params.no}`)
        .then((res) => {
          if (res.data == "success") alert("삭제완료");
          else alert("삭제실패");
          this.$router.push({ name: "QnAList" });
        })
        .catch((err) => console.log(err));
    },

    modifyQnA() {
      console.log("modify");
      this.$router.push({
        name: "QnAModify",
        params: { no: this.$route.params.no },
      });
    },
  },
};
</script>

<style lang="scss" scoped>
h1 {
  color: #d15ca4;
}
</style>
