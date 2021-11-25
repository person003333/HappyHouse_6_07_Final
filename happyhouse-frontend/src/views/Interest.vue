<template>
  <div>
    <b-container class="bv-example-row mt-3 text-center">
      <router-link :to="{ name: 'Interest' }" style="color: rgba(5, 5, 5, 90)"
        ><h2 style="font-size: 2.4em" class="underline-hotpink">
          관심 아파트
        </h2></router-link
      >

      <hr class="mt-5" />
      <b-table
        class="scrollbar"
        hover
        sticky-header
        responsive
        :items="interestedApt"
        :fields="fields"
        @row-clicked="detail"
        style="max-height: 470px"
      >
      </b-table>
      <!-- Info modal -->
      <b-modal
        :id="infoModal.id"
        :title="infoModal.title"
        ok-only
        @hide="resetInfoModal"
        :header-bg-variant="headerBgVariant"
        :header-text-variant="headerTextVariant"
        :body-bg-variant="bodyBgVariant"
        :body-text-variant="bodyTextVariant"
        :footer-bg-variant="footerBgVariant"
        :footer-text-variant="footerTextVariant"
        style="background-color: #ddddebc0 !important"
      >
        <h3>{{ infoModal.content.aptName }}</h3>
        <h4>{{ infoModal.content.aptNickName }}</h4>
        <template #modal-footer="{ ok, cancel }">
          <div class="w-100">
            <input
              type="text"
              v-model="newName"
              @keyup.enter="
                update_interestedApt([
                  infoModal.content.id,
                  infoModal.content.aptCode,
                  newName,
                ]),
                  ok()
              "
            />
            <!-- Emulate built in modal footer ok and cancel button actions -->
            <b-button
              size="sm"
              variant="danger"
              @click="cancel()"
              class="float-right"
            >
              Cancel
            </b-button>
            <b-button
              class="float-right"
              size="sm"
              variant="success"
              @click="
                delete_interestedApt([
                  infoModal.content.id,
                  infoModal.content.aptCode,
                ]),
                  ok()
              "
            >
              삭제
            </b-button>
            <b-button
              class="float-right"
              size="sm"
              variant="primary"
              @click="
                update_interestedApt([
                  infoModal.content.id,
                  infoModal.content.aptCode,
                  newName,
                ]),
                  ok()
              "
            >
              수정
            </b-button>
          </div>
        </template>
      </b-modal>
    </b-container>
  </div>
</template>

<script>
import { mapActions, mapState } from "vuex";
export default {
  name: "interest",
  data() {
    return {
      fields: [
        { key: "aptCode", sortable: true, label: "일련번호" },
        { key: "aptName", sortable: true, label: "이름" },
        { key: "aptNickName", sortable: true, label: "별칭" },
      ],
      variants: [
        "primary",
        "secondary",
        "success",
        "warning",
        "danger",
        "info",
        "light",
        "dark",
      ],
      headerBgVariant: "light",
      headerTextVariant: "dark",
      bodyBgVariant: "light",
      bodyTextVariant: "dark",
      footerBgVariant: "light",
      footerTextVariant: "dark",

      infoModal: {
        id: "info-modal",
        title: "관심 아파트 별칭 변경",
        content: { aptName: "" },
      },
      newName: "",
    };
  },
  computed: {
    ...mapState("interestedAptStore", ["interestedApt"]),
  },
  mounted() {
    console.log(this.interestedApt);
  },
  methods: {
    ...mapActions("interestedAptStore", [
      "delete_interestedApt",
      "update_interestedApt",
    ]),
    info(item, index, button) {
      this.infoModal.title = `Row index: ${index}`;
      this.infoModal.content = JSON.stringify(item, null, 2);
      this.$root.$emit("bv::show::modal", this.infoModal.id, button);
      this.newName = "";
    },
    resetInfoModal() {
      this.infoModal.title = "";
      this.infoModal.content = { aptName: "" };
    },
    detail(item) {
      console.log(item);
      this.infoModal.title = `관심 아파트 이름 변경`;
      this.infoModal.content = item;
      this.$root.$emit("bv::show::modal", this.infoModal.id);
      this.newName = "";
    },
  },
};
</script>

<style lang="scss" scoped>
.underline-hotpink {
  display: inline-block;
  background: linear-gradient(
    180deg,
    rgba(255, 255, 255, 0) 70%,
    rgba(231, 27, 139, 0.123) 30%
  );
}
</style>
