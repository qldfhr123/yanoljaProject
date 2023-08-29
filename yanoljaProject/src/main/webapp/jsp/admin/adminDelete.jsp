<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>회원탈퇴</title>

<script src="yanoljaFunction.js"></script>
<script src="yanoljaFunction1.js"></script>
<link rel="stylesheet" href="/css/reset.css" type="text/css">
<c:import url="/header"/>

<div class="adminDelete">
	<div class="inner">
		<h2>회원 탈퇴</h2>
		<hr>
			<table class="adminDelete_rule inner800">
				<tr>
					<th>1.&nbsp;&nbsp;현재 사용중인 계정 정보는 복구 불가능합니다.</th>
				</tr>
				<tr>
					<td>탈퇴 시 현재 하용하고 계신 정보는 재생이 불가능한 방법으로 파기되며 본인과 타인 모두 복구가 불가능합니다.</td>
				</tr>
				<tr>
					<th>2.&nbsp;&nbsp;게시판형 서비스에 등록된 게시물은 삭제되지 않고 유지됩니다.</th>
				</tr>
				
				<tr>
					<td>
						이용하기와 같은 게시판형 서비스에 등록한 게시물은 삭제되지않고 유지됩니다. 
						탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할수있는방법이 없으므로, 게시글을 임의로 삭제할수없습니다.<br>
						<q><b>삭제를 원하는 게시물이 있을경우, 반드시 삭제 후 탈퇴하시기 바라며 필요한 데이터는 미리 백업을 해주시기 바랍니다.</b></q>
					</td>
				</tr>

				<tr>
					<th>3.&nbsp;&nbsp;탈퇴사유</th>
				</tr>
				
				<tr>
					<td>
						<ul>
							<li><input type="radio" name="memberDel_check" id ="memberDel_return"><label for="memberDel_return">&nbsp;&nbsp;재가입 (ID 변경)</label></li>
							<li><input type="radio" name="memberDel_check" id ="memberDel_notFun"><label for="memberDel_notFun">&nbsp;&nbsp;나에게 필요한 정보가 부족하고나 재미가 없어서, 혹은 불필요한 정보가 많아서</label></li>
							<li><input type="radio" name="memberDel_check" id ="memberDel_problem"><label for="memberDel_problem">&nbsp;&nbsp;개인정보 유출 방지 등 보안 상의 문제</label></li>
							<li><input type="radio" name="memberDel_check" id ="memberDel_etc"><label for="memberDel_etc">&nbsp;&nbsp;기타</label></li>
							<li><textarea cols="50" rows="10" name="deleteMember_answer" placeholder="내용을 입력해 주세요."></textarea></li>
						</ul>
					</td>
				</tr>
				
			</table>
		
		
		
		<div class="admindDeleteBtn">
            <form action="adminDeleteProc" method="post">
               <button id="adminDelete_openPopupButton">회원 탈퇴</button>
               <div class="adminDelete_popup popup" style="display:none;" id="adminDelete_popup">
                  <div class="adminDelete_popup_content popup_content">
                     <h3>회원 정보를 삭제하시겠습니까?</h3>
                     <button id="adminDelete_confirmButton">확인</button>
                     <button id="adminDelete_cancelButton">취소</button>
                  </div>
               </div>
            </form>
         </div>
         
   
	</div>

</div>


<c:import url="/footer"/>