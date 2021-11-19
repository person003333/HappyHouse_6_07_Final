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

.scrollbar {
  height: 600px;
  background: #e6e9f048;
  overflow-y: scroll;
  margin-bottom: 25px;
}

.scrollbar::-webkit-scrollbar-track {
  -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
  background-color: #f5f5f5;
  border-radius: 10px;
}

.scrollbar::-webkit-scrollbar {
  width: 5px;
  background-color: #f5f5f5;
}

.scrollbar::-webkit-scrollbar-thumb {
  border-radius: 10px;
  background-image: -webkit-gradient(
    linear,
    left bottom,
    left top,
    color-stop(0.25, rgb(227, 208, 230)),
    color-stop(0.5, rgb(229, 221, 230)),
    color-stop(0.75, rgb(214, 227, 235)),
    color-stop(1, rgb(206, 221, 231))
  );
}
</style>
