<template>
  <div id="app">
    <sidebar-menu
      :menu="menu"
      collapsed="true"
      width="250px"
      widthCollapsed="70px"
      theme="white-theme"
    />
    <div id="username">김싸피님</div>

    <!-- 메뉴들 라우터 뷰 -->
    <router-view></router-view>
  </div>
</template>

<script>
export default {
  data() {
    return {
      menu: [
        {
          header: true,
          title: "",
        },

        {
          href: "/charts",
          title: "아파트",
          icon: "far fa-building ",
          child: [
            {
              href: "/charts/sublink",
              title: "서브링크가능",
            },
          ],
        },
        {
          href: "/",
          title: "마이페이지",
          icon: "fa fa-user",
        },
        {
          href: "/dd",
          title: "게시판",
          icon: "far fa-list-alt ",
        },
      ],
    };
  },
};
</script>

<style lang="scss">
:root {
  background: rgba(219, 203, 192, 0.384) 10%;
}

#username {
  text-align: right;
  padding-top: 10px;
  padding-right: 40px;
  height: 30px;
  background-color: turquoise;
}

.vsm--arrow {
  margin-bottom: 30px;
}

.vsm--title {
  margin-bottom: 30px;
  margin-left: 20px;
}
.vsm--header {
  padding-top: 60px !important;
}

.v-sidebar-menu.vsm_expanded {
  background: rgb(238, 174, 202);
  background: radial-gradient(
    circle,
    rgba(238, 174, 202, 1) 0%,
    rgba(148, 187, 233, 1) 100%
  );
}
.v-sidebar-menu.vsm_collapsed {
  background: rgb(238, 174, 202);
  background: radial-gradient(
    circle,
    rgba(238, 174, 202, 1) 0%,
    rgba(148, 187, 233, 1) 100%
  );
}

.v-sidebar-menu.vsm_rtl {
  background-color: khaki !important;
}

.v-sidebar-menu .vsm--mobile-bg {
  background-color: rgba(242, 242, 242, 0.5) !important;
}

.v-sidebar-menu.vsm_white-theme .vsm--toggle-btn {
  background-color: transparent !important;
}

.v-sidebar-menu.vsm_white-theme {
  .vsm--link_level-1 .vsm--icon {
    height: 50px !important;
    line-height: 50px !important;
    width: 50px !important;
    border-radius: 20px !important;
    margin-bottom: 40px !important;
  }
}

.v-sidebar-menu.vsm_white-theme .vsm--link_mobile-item {
  color: black !important;
  padding-top: 30px !important;
  padding-left: 40px !important;
}

.v-sidebar-menu.vsm_white-theme.vsm_expanded
  .vsm--item_open
  .vsm--link_level-1 {
  color: black !important;
  background-color: rgba(242, 242, 242, 0.5) !important;
}

// 선택된 아이콘 색
.v-sidebar-menu.vsm_white-theme
  .vsm--link_level-1.vsm--link_exact-active
  .vsm--icon,
.v-sidebar-menu.vsm_white-theme .vsm--link_level-1.vsm--link_active .vsm--icon {
  color: #4675af !important;
  background-color: #ab50bd65 !important;
}

//선택 안된 아이콘
.v-sidebar-menu.vsm_white-theme .vsm--link_level-1 .vsm--icon {
  background-color: #4675af1f !important;
}

.v-sidebar-menu.vsm_white-theme {
  .vsm--link {
    &_level-1 {
      &.vsm--link_exact-active,
      &.vsm--link_active {
        box-shadow: 3px 0px 0px 0px #af8cac inset !important;
      }
    }
  }
}
</style>
