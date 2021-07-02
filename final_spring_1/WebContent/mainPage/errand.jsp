<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!-- =============================================== ▼ 심부름 모달 ▼ ================================================= -->
  <div class="modal modal-center fade" id="errand_modal" tabindex="-1" role="dialog" aria-labelledby="errand_modal"
    aria-hidden="true">
    <div class="modal-dialog modal-center" role="document">
      <div class="modal-content" style="width: 700px;">
        <div class="modal-header">
          <div class="d-flex flex-column">
            <h3 class="modal-title" id="exampleModalLongTitle">심부름 등록</h3>
            <label>어떤 심부름을 등록하실 건가요?? 상세 정보를 입력해주세요 : )</label>
          </div>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form>
            <div class="form-group">
              <h5 for="errandItem" style="font-weight: bold;">심부름 아이템</h5>
              <input type="text" class="form-control" id="errandItem" placeholder="어떤 심부름을 원하시나요??">
            </div>
            <div class="form-inline justify-content-end align-items-center mb-2">
              <h4 class="col-auto text-center mb-0" style="font-weight: bold;">금액 제안:</h4>
              <input type="text" class="form-control col-8" id="errandItemPr" placeholder="예상 금액을 입력해주세요."><span
                class="col-auto">원</span>
            </div>
            <div class="form-inline justify-content-end align-items-center mb-2">
              <h4 class="col-auto text-center mb-0" style="font-weight: bold;">심부름금액:</h4>
              <input type="text" class="form-control col-8" id="errandCost"
                placeholder="심부름 금액은 최소 1,000원부터 입니다 : )"><span class="col-auto">원</span>
            </div>
            <hr>
            <div class="form-group">
              <label for="">심부름 상세 내용 입력</label>
              <textarea type="text" class="form-control" id="errandDetail" placeholder="상세 내용을 입력해주세요."></textarea>
            </div>
            <div class="form-inline justify-content-between align-items-center mb-2">
              <label class="col-auto text-center">
                <i class="fas fa-map-marker-alt mr-1" style="color: rgb(0, 89, 255); font-size: 20px;"></i>
                현재 나의 위치:
              </label>
              <input type="text" class="col-6 form-control" id="errandAddr" placeholder="주소를 입력해주세요.">
              <button type="button" id="searchAddr" class="col-3 btn btn-primary">주소검색</button>
            </div>
            <div class="form-row justify-content-center mb-1">
              <span class="mr-1"><i class="fas fa-exclamation warn"
                  style="color: red; font-size: 20px; font-weight: bold;"></i></span>
              <small class="text-center">
                <span>심부름 요청은 등록 후 <span class="warn" style="color: red; font-weight: bold;">30분간 유지되며</span>
                  30분동안 심부름이 매칭되지 않았을 때,<br>
                  <span class="warn" style="color: red; font-weight: bold;">자동으로 등록이 취소됩니다.</span>
                </span>
              </small>
            </div>
            <div class="form-inline justify-content-end align-items-center mb-2">
              <h2 class="col-auto text-center mb-0" style="font-weight: bold;">총금액:</h2>
              <div class="col-9 d-flex justify-content-end align-items-baseline">
                <h3 id="totalCost" class="col-auto">"총금액 위치예정"(6,500)</h3><span class="col-auto">원</span>
              </div>
            </div>
            <div class="modal-footer">
              <button type="submit" id="errandBtn" class="btn btn-primary">심부름 등록하기</button>
              <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  <!-- 심부름 확인 모달 시작 -->
    <div class="modal modal-center fade" id="errand_check_modal" tabindex="-1" role="dialog" aria-labelledby="errand_check_modal"
    aria-hidden="true">
    <div class="modal-dialog modal-center" role="document">
      <div class="modal-content" style="width: 700px;">
        <div class="modal-header">
          <div class="d-flex flex-column">
            <h3 class="modal-title" id="exampleModalLongTitle">심부름 확인</h3>
          </div>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
            <div class="row">
              <div class="col-lg-3">
                <img src="" alt="">
                <div>
                  <span>
                    무지라이언
                  </span>
                </div>
              </div>
              <div class="col-lg-9">
                <div>
                  <h1>"심부름 등록된 아이템"</h1>
                </div>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" id="" class="btn btn-primary">심부름하기</button>
            <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
          </div>
      </div>
    </div>
  </div>
  <!-- 심부름 확인 모달 끝 -->
  <!-- =============================================== ▲ 심부름 모달 ▲ ================================================= -->