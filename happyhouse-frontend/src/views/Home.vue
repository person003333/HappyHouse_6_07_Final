<template>
  <div class="home" style="margin-left: 70px; text-align: center">
    <h1>홈</h1>
    <router-link :to="{ name: 'Main' }">메인</router-link>
  </div>
</template>

<script>
// @ is an alias to /src

export default {
  name: "Home",
};
</script>
