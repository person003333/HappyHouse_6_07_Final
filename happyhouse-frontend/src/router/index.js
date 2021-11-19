import Vue from "vue";
import VueRouter from "vue-router";
import Home from "../views/Home.vue";
import Main from "../views/Main.vue";
import Board from "../views/Board.vue";
import User from "../views/User.vue";
import store from "@/store/index.js";
import MapMain from "@/components/main/MapMain.vue";
Vue.use(VueRouter);

const noHome = function (to, from, next) {
  const checkUserInfo = store.getters["memberStore/checkUserInfo"];
  let token = sessionStorage.getItem("access-token");

  if (checkUserInfo != null && token) {
    router.push({ name: "Main" });
  } else next();
};

const routes = [
  {
    path: "/",
    name: "Home",
    beforeEnter: noHome,
    component: Home,
  },
  {
    path: "/main",
    name: "Main",
    component: Main,
    redirect: "/main/map",
    children: [
      {
        path: "user",
        name: "User",
        component: User,
      },
      {
        path: "board",
        name: "Board",
        component: Board,
      },
      {
        path: "map",
        name: "MapMain",
        component: MapMain,
      },
    ],
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;
