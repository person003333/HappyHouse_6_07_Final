<template>
  <div id="app">
    <!-- 홈 or 메인 -->
    <router-view
      class="scrollbar"
      id="service"
      style="margin-left: 70px; padding: 0 200px"
    ></router-view>
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
#app {
}
body {
  margin: 0;
  height: 100vh;

  font-family: "RIDIBatang" !important;
}

#service {
  height: 100vh !important;
}

.scrollbar {
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
    color-stop(0.25, rgb(216, 166, 223)),
    color-stop(0.5, rgba(223, 174, 230, 0.555)),
    color-stop(0.75, rgba(170, 209, 233, 0.521)),
    color-stop(1, rgb(150, 197, 228))
  );
}
</style>
