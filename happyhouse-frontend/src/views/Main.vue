<template>
  <div style="">
    <sidebar-menu
      :menu="menu"
      :collapsed="true"
      width="250px"
      widthCollapsed="70px"
      theme="white-theme"
    />
    <div id="username">
      {{ userInfo.name }} 님
      <span id="logout" @click="logoutProcess">로그아웃</span>
    </div>

    <!-- 메뉴들 라우터 뷰 -->
    <router-view></router-view>
    <div>
      Lorem ipsum dolor sit, amet consectetur adipisicing elit. Error pariatur a
      eveniet totam ea aliquid amet iste, laboriosam, distinctio atque
      cupiditate asperiores iusto fuga incidunt vel repudiandae eius inventore.
      Adipisci provident qui nostrum inventore corrupti laborum voluptate
      reprehenderit, debitis quibusdam alias architecto sunt similique quisquam
      corporis assumenda aperiam asperiores dicta modi minima! Minus est error
      quidem eum omnis excepturi culpa similique aut natus minima alias, et
      quisquam incidunt ipsam adipisci quam perferendis? Veritatis, illo autem
      minus perspiciatis rerum voluptatibus! Facilis, odit dolorem deserunt
      earum iusto recusandae, eaque sequi consequuntur explicabo esse, atque
      quos eos non praesentium maxime! Autem necessitatibus expedita harum animi
      odit ea! Impedit accusantium voluptatem reiciendis incidunt sunt
      architecto vel numquam saepe distinctio aliquid! Quo voluptatem, sunt
      ipsa, at repudiandae quia amet voluptates quasi distinctio sint veritatis
      doloribus repellat ducimus exercitationem aperiam. Quam, quod harum,
      cupiditate molestias illo beatae earum, repellat dignissimos ut eaque
      perferendis quos quis iusto! Laboriosam eos ipsam optio, esse expedita
      iste quod officiis rerum aspernatur? Quos nesciunt est sed consectetur
      laudantium asperiores ab commodi odio quas soluta nihil obcaecati quaerat
      mollitia excepturi autem non dolorum, eveniet illo aspernatur, rem
      inventore! Voluptatem repellendus at iste qui tempore officiis explicabo,
      itaque temporibus nihil iusto voluptatum illo accusamus nobis placeat
      cumque doloremque maxime unde. Ad magnam eum numquam eos perferendis
      cumque adipisci sapiente, doloremque a deserunt iste mollitia maxime nulla
      ducimus aperiam delectus, ea quisquam est earum consequuntur commodi?
      Rerum, vero? Odio itaque iusto culpa magni autem nemo veniam, enim in vel!
      Minima placeat voluptatem quasi praesentium fuga doloribus ut,
      reprehenderit eaque laboriosam hic quibusdam laudantium repudiandae, modi
      quidem quas quae mollitia magni! Minus corporis quam saepe iusto nam,
      placeat at, perspiciatis nisi soluta eius voluptas molestias obcaecati
      voluptatum modi odit adipisci, cumque ad odio quaerat nobis possimus illo?
      Et voluptatibus id magni voluptates mollitia laborum distinctio illo quo
      natus blanditiis, vitae, quibusdam neque quis saepe fuga quasi aut, porro
      pariatur. Vel nostrum in velit id possimus distinctio fugit recusandae
      dolorum, esse hic a minima molestiae quae cupiditate quisquam eius nulla
      libero, nihil nobis officia sunt repellendus dolor cumque! Magni aliquid,
      sequi explicabo, maxime obcaecati ipsa asperiores voluptatem fugit quas
      harum accusamus pariatur veritatis nostrum. Quidem odit vitae repellendus.
      Quod minima, ut iure quasi iste laborum nulla odio consectetur sit vero
      unde optio veniam repellat! Deserunt reprehenderit iste vitae nemo
      dignissimos ut optio dolores consequatur, quo mollitia molestiae veniam
      numquam officiis delectus molestias consequuntur nesciunt dolorem itaque
      quia et rem. Quibusdam sunt sed recusandae, beatae voluptatibus explicabo
      incidunt hic asperiores? Iste est at quia excepturi amet impedit fugiat
      vitae assumenda, aspernatur, sed aut ipsam, perferendis aliquid? Sapiente
      dignissimos itaque voluptas quisquam aut nemo libero possimus dicta, quasi
      hic in placeat voluptatem ut accusantium? Qui quos, tempora eaque quisquam
      sit voluptatibus, voluptatem ipsum asperiores recusandae facere hic magni
      quas quasi officia doloremque quod culpa similique voluptates ab illum
      optio commodi repellendus sed. Quibusdam quis sed neque? Quasi voluptate
      ut illo sapiente numquam excepturi optio esse harum eum qui, recusandae,
      voluptatibus aliquid aliquam tempora minima natus vitae. Perferendis
      doloremque reiciendis natus maxime fugiat ad quidem corporis facere optio
      sequi vitae odio vero incidunt nam, assumenda quis voluptates iusto
      deserunt. Consequatur veritatis, ducimus aut illo laboriosam pariatur quis
      corporis necessitatibus nam animi iure libero unde accusantium et non
      natus odit! Architecto quaerat labore officia doloremque adipisci iusto
      incidunt nostrum exercitationem rerum vitae. Autem vitae laudantium
      reiciendis provident molestiae vero, et aspernatur illo earum omnis sequi,
      maiores quo nesciunt accusantium tempore accusamus nisi, dolorem fugiat
      sit expedita exercitationem iusto quibusdam alias. Officia magnam qui fuga
      iste consequuntur. At accusantium corrupti ex itaque asperiores vel
      consequuntur atque iusto deleniti nihil sed culpa tempore ratione quos qui
      velit quia corporis delectus quidem quam tenetur, enim dolorem
      praesentium. Nostrum sunt maiores repellat, omnis quaerat vel deserunt
      tenetur? Harum quas temporibus magni magnam minima nulla, molestiae ab,
      atque esse saepe tempora enim ut tenetur non quae reprehenderit aperiam ex
      dolore excepturi. Deserunt quos totam corporis et dolore rem laboriosam!
      Quis quod repudiandae officia, neque corporis placeat minus, quasi
      explicabo optio dolorum veniam, tenetur fuga alias? Nihil corrupti
      perferendis cupiditate assumenda ex dolor repellat? Aliquam non, unde
      dolor illum, quas, repellendus in dignissimos alias ea maiores quibusdam
      repellat provident beatae. Veritatis, similique. Necessitatibus corrupti
      illo officiis, aliquid recusandae inventore dignissimos rerum. Quo
      accusantium provident ducimus eos iusto qui reprehenderit earum maxime
      alias nam, corrupti ipsum dolor ipsa iste veniam, tenetur necessitatibus.
      Eos tempore est animi ad hic praesentium explicabo. Earum expedita
      temporibus obcaecati deserunt reprehenderit iste esse ut libero possimus.
      Aliquid facilis voluptatum voluptas similique neque, aut illo fugit
      quibusdam illum inventore, facere deserunt reprehenderit maxime id
      incidunt ut! Dolor aspernatur excepturi quos esse doloribus tempore
      ratione sit sunt officiis, molestiae similique quo praesentium fuga
      exercitationem illo in a, pariatur placeat beatae doloremque neque.
      Quaerat, ipsam perferendis eius veniam corporis nihil illo, fuga ipsum
      soluta, distinctio molestias. Accusamus laboriosam excepturi facere, eaque
      unde doloribus modi quod minima aliquid dolorum aperiam fugit ea, amet,
      doloremque nobis reprehenderit! Deleniti iure doloremque aliquid
      cupiditate molestiae ducimus perferendis nihil voluptate asperiores, a
      beatae dignissimos laboriosam tempora impedit, porro, itaque quasi
      distinctio! Nesciunt magnam dicta exercitationem voluptatem perspiciatis?
      Repudiandae neque maxime est voluptatum amet molestias, dicta possimus,
      atque deserunt nulla voluptatibus officiis consequatur doloribus suscipit.
      Hic tenetur laudantium sed iusto neque, eius consequatur repellendus
      itaque tempore, voluptates a maxime rerum! Commodi, quod. Quae sapiente
      molestias quaerat dicta quia magnam, porro animi hic repudiandae obcaecati
      consequatur qui ab recusandae vitae eveniet inventore. Eius impedit
      laudantium officiis praesentium voluptas quas eligendi maxime delectus
      autem, obcaecati optio numquam illum cum nobis, sed suscipit veritatis
      ullam accusamus eaque vel fugit neque quam animi hic. Vel, at! Quas
      consequatur pariatur dolorem rem. Ad deleniti possimus iure eaque
      suscipit! Possimus molestias nulla, error aliquid consequuntur illo. Nemo
      maxime placeat temporibus debitis vero itaque, quidem eligendi recusandae
      cumque, modi incidunt, explicabo id dolores mollitia laboriosam minus
      facere quaerat. Velit quisquam laborum quae consequuntur et impedit minus
      non quis in hic quia quod, eius aspernatur illum consequatur cupiditate.
      Voluptatum ducimus in laboriosam, error cupiditate dolorem eius ipsa atque
      sed!
    </div>
  </div>
</template>

<script>
import { mapState, mapActions } from "vuex";
const memberStore = "memberStore";

export default {
  name: "Main",
  computed: {
    ...mapState(memberStore, ["userInfo"]),
  },
  data() {
    return {
      menu: [
        {
          header: true,
          title: "",
        },

        {
          href: "/main/map",
          title: "아파트",
          icon: "far fa-building ",
          child: [
            {
              href: "/map/sublink",
              title: "서브링크가능",
            },
          ],
        },
        {
          href: "user",
          title: "마이페이지",
          icon: "fa fa-user",
        },
        {
          href: "/main/board",
          title: "게시판",
          icon: "far fa-list-alt ",
        },
      ],
    };
  },
  methods: {
    ...mapActions(memberStore, ["logout"]),
    logoutProcess() {
      this.logout();
      this.$router.push({ name: "Home" });
    },
  },
};
</script>

<style lang="scss">
#username {
  text-align: right;
  padding-top: 20px;
  margin-bottom: 50px;
  height: 30px;
  font-size: 1.2em;

  #logout {
    font-size: 0.5em;
    color: rgb(129, 129, 129);
  }
  #logout:hover {
    cursor: pointer;
  }
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
