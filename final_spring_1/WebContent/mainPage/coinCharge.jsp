<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!-- =============================================== ▼ 코인 충전 모달  ▼ ================================================= -->
  <div class="modal modal-center fade" id="coinCharge" tabindex="-1" role="dialog" aria-labelledby="coinCharge"
    aria-hidden="true">
    <div class="modal-dialog modal-center" style="width: 600px;" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <div class="d-flex flex-column">
            <h3 class="modal-title" id="exampleModalLongTitle">코인충전</h3>
            <label>코인을 사용해서 안전하게 거래하세요 <i class="far fa-smile"></i></label>
          </div>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form id="coinCost" class="">
            <div class="form-group">
              <label for="inputCost">코인 충전</label>
              <input type="text" class="form-control" id="inputCost" placeholder="최소 충전 금액은 1,000원 입니다 : )">
            </div>
            <div class="modal-footer">
              <button type="submit" class="btn btn-primary">충전하기</button>
              <button type="button" class="btn btn-danger" data-dismiss="modal">돌아가기</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  <!-- =============================================== ▲ 코인 충전 모달 ▲ ================================================= -->