
!(function ($) {
  ("use strict");
    $(document).ready(function () {
      $("#getCpCode").click(function () {
        const inputCellPhone = $("#inputCellPhone").val();
        let dt = "mem_phone=" + inputCellPhone;
        console.log(inputCellPhone);
        $.ajax({
          type: "post",
          data: dt,
          url: "http://localhost:8080/member/sendSMSCode.nds",
          success: function (data) {
            alert(data);
          }
        })
    })
  })
})(jQuery);
