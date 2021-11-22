<template>
  <div>
    <div class="btn_top top d-flex">
      <a
        href="./board.php?bo_table=free&amp;page="
        class="btn btn_b01"
        style="font-size: 1.2em"
        ><i class="fa fa-list" aria-hidden="true"></i> 목록</a
      >
      <div><span>수정하기</span><span>삭제하기</span></div>
    </div>
    <div id="container">
      <article style="width: 70%; margin: auto">
        <header>
          <h2 id="bo_v_title">
            <span>[공지] 글 제목</span>
          </h2>
          <p><i class="far fa-clock"></i> 21-11-22 08:58</p>
        </header>

        <section
          id="bo_v_info"
          class="d-flex justify-content-between"
          style="width: 70%; margin: auto"
        >
          <span>작성자: 으잉zz</span>

          <span class="sound_only"
            >조회: <i class="fa fa-eye" aria-hidden="true"></i> 280회</span
          >
          <span class="sound_only"
            >댓글:
            <i class="fa fa-commenting-o" aria-hidden="true"></i> 0건</span
          >
        </section>

        <section id="bo_v_atc">
          <div id="bo_v_img"></div>

          <div
            id="bo_v_con"
            class="mt-5 mb-5"
            style="background-color: aqua; height: 300px; margin: auto"
          >
            <h2>콘텐츠</h2>
          </div>
        </section>
      </article>
    </div>
  </div>
</template>

<script>
export default {};
</script>

<style lang="scss" scoped></style>
