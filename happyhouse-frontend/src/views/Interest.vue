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
        striped
        hover
        :items="interestedApt"
        :fields="fields"
        @row-clicked="detail"
      >
      </b-table>
      <!-- Info modal -->
      <b-modal
        :id="infoModal.id"
        :title="infoModal.title"
        ok-only
        @hide="resetInfoModal"
      >
        <pre>{{ infoModal.content.aptName }}</pre>
        <input type="text" v-model="newName" />
        <template #modal-footer="{ ok, cancel }">
          <!-- Emulate built in modal footer ok and cancel button actions -->
          <b-button
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
          <b-button
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
          <b-button size="sm" variant="danger" @click="cancel()">
            Cancel
          </b-button>
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
        { key: "action", label: " " },
      ],
      infoModal: {
        id: "info-modal",
        title: "",
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
      this.nuwName = "";
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
