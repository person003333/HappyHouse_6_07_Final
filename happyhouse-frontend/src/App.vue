<template>
  <div id="app">
    <!-- 홈 or 메인 -->
    <router-view></router-view>
  </div>
</template>

<style>
@font-face {
  font-family: "RIDIBatang";
  src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff")
    format("woff");
  font-weight: normal;
  font-style: normal;
}
body {
  margin: 0;
  font-family: "RIDIBatang" !important;
}
</style>
