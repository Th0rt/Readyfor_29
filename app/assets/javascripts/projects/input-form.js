$(document).on('turbolinks:load', function () {
  // 目標金額を9桁までしか入力できないようにする
  $('.price-input').on('keypress', function () {
    if (this.value.length > 8) {
      this.value = this.value.slice(0, 8);
    }
  });
});
