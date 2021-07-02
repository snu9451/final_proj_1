<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!-- =========================================== ▼ 회원가입 양식 모달 ▼ ============================================= -->
  <div class="modal modal-center fade" id="signInForm" tabindex="-1" role="dialog" aria-labelledby="signIn" aria-hidden="true">
    <div class="modal-dialog modal-center" style="width: 600px;" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h3 class="modal-title" id="exampleModalLongTitle">회원가입 정보입력</h3>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form class="needs-validation" id="joinForm" novalidate><!-- ▼ 회원가입 양식 | form 태그 시작 ▼ -->
            <div class="form-group">
              <label for="inputEmail">E-mail</label>
              <input type="email" readonly class="form-control" id="inputEmail" placeholder="email 자동으로 가져올예정">
            </div>
            <div class="form-row align-items-center">
              <div class="form-group col-md-12">
                <label for="inputCellPhone">핸드폰 번호</label>
                <div class="form-row align-items-center justify-content-between">
                  <div class="form-group col-md-8 mb-0">
                    <input type="text" class="form-control" id="inputCellPhone" placeholder="(-) 없이 번호를 입력해주세요." required minlength="11">
                  </div>
                  <div class="form-group col-md-4 mb-0 text-right">
                    <button type="button" id="getCpCode" class="btn btn-primary">인증번호 받기</button>
                  </div>
                </div>
                <div class="valid-feedback">Good</div>
                <div class="invalid-feedback">핸드폰번호 11자리를 입력해주세요.</div>
              </div>
            </div>
            <div class="form-row align-items-center justify-content-between">
              <div class="form-group col-md-12">
                <label for="inputSafetyCode">인증번호 입력</label>
                <div class="form-row align-items-center justify-content-between">
                  <div class="form-group col-md-9 mb-0">
                    <input type="text" class="form-control" id="inputSafetyCode" placeholder="인증번호를 입력해주세요." required minlength="6">
                    </div>
                    <div class="form-group col-md-3 mb-0 text-right">
                      <button type="button" class="btn btn-primary">확인</button>
                    </div>
                </div>
                <div id="safetyCodeChck__box" class="doEmpty">
                  <small id="safetyCodeChck" class="form-text"></small>
                </div>
              </div>
            </div>
            <div class="form-group">
              <label for="inputPassWord">비밀번호</label>
              <input type="password" class="form-control" id="inputPassWord" placeholder="영문,숫자,특수문자 조합 8~20글자" required minlength="8">
              <div class="valid-feedback">
                Good
              </div>
            </div>
            <div class="form-group">
              <label for="checkPassWord">비밀번호 확인</label>
              <input type="password" class="form-control" id="checkPassWord" placeholder="비밀번호를 한번 더 입력해주세요." required minlength="8">
              <div id="pwChck__box" class="doEmpty">
                  <small id="pwChck" class="form-text"></small>
              </div>
            </div>
            <div class="form-row align-items-center justify-content-between">
              <div class="form-group col-md-12">
                <label for="inputNickName">닉네임</label>
                <div class="form-row align-items-center justify-content-between">
                  <div class="form-group col-md-9 mb-0">
                    <input type="text" class="form-control" id="inputNickName" placeholder="사용하실 닉네임을 입력해주세요." required minlength="2">
                  </div>
                  <div class="form-group col-md-3 mb-0 text-right">
                    <button type="button" class="btn btn-primary">중복확인</button>
                  </div>
                </div>
                <div id="nickChck__box" class="doEmpty">
                  <small id="nickNameChck" class="form-text"></small>
                </div>
              </div>
            </div>
            <div class="form-group">
              <label for="inputAge">연령대</label>
              <select class="form-control custom-select" id="inputAge" name="mem_age" required>
                <option selected="selected" value="default">고객님의 연령대를 선택해주세요.</option>
                <option value="10">10대</option>
                <option value="20">20대</option>
                <option value="30">30대</option>
                <option value="40">40대</option>
                <option value="50">50대</option>
                <option value="60">60대이상</option>
              </select>
              <div class="valid-feedback">Good</div>
              <div class="invalid-feedback">연령대를 선택해주세요.</div>
            </div>
            <div class="custom-control custom-radio custom-control-inline">
              <input type="radio" name="mem_gender" value="female" class="custom-control-input" required>
              <label class="custom-control-label" for="female">여성</label>
            </div>
            <div class="custom-control custom-radio custom-control-inline">
              <input type="radio" name="mem_gender" value="male" class="custom-control-input" required>
              <label class="custom-control-label" for="male">남성</label>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-primary">확인</button>
              <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
            </div>
          </form><!-- ▲ 회원가입 양식 | form 태그 끝 ▲ -->
        </div>
      </div>
    </div>
  </div>
  <!-- =========================================== ▲ 회원가입 양식 모달 ▲ ============================================= -->