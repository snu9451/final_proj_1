<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Map<String, Object> comments = (Map<String,Object>)request.getAttribute("comments");
	String mem_nickname = String.valueOf(comments.get("MEM_NICKNAME"));
	int comment_step = Integer.parseInt(String.valueOf(comments.get("COMMENT_STEP")));
	int comment_pos = Integer.parseInt(String.valueOf(comments.get("COMMENT_POS")));
	int comment_me = Integer.parseInt(String.valueOf(comments.get("COMMENT_ME")));
	int bm_no  = Integer.parseInt(String.valueOf(comments.get("pr_bm_no")));
	int comment_group  = Integer.parseInt(String.valueOf(comments.get("COMMENT_GROUP")));
	String comment_date = String.valueOf(comments.get("COMMENT_DATE"));
	String comment_msg = String.valueOf(comments.get("COMMENT_MSG"));
%>
<div class="w-100 mt-3  comments comment_num<%=comment_step%>" id="comment__box" style="border-top-left-radius: 10px;">
	<div class="d-flex justify-content-between align-items-end" style="padding-left: 10px; padding-right: 10px;" id="">                                                  
		<div>                                                                                                            
			<span id="comment__user__origin"><%=mem_nickname %></span>
			<span id="comment__date"><%=comment_date %></span>
		</div>                                                                                                           
		<div>                                                                                                            
			<ul class="d-flex align-items-end mb-0">                                                                     
<%
	if(comment_pos == 0){
%>                                                                                                             
				<li>                                                                                                         
					<button class="pd__comment__btn"  onclick="pdCommentBtn(this)" id="<%=comment_step %>-<%= bm_no %>">답글</button>                                                       
				</li>     
<%
	}
	if(comment_me == 1){
%>                                                                                                   
				<li>                                                                                                              
					<button class="pd__comment__btn" id="<%=comment_group %>-<%=comment_pos %>" onclick="pdCommentupdateBtn(this)">수정</button>                                            
				</li>                                                                                                        
				<li>                                                                                                         
					<button class="pd__comment__btn" id="<%=comment_step %>" onclick="deleteComment(this)" >삭제</button> 
				</li>      
<%
	} else {
%>				                                                                                                  
				<li>                                                                                                         
					<button class="pd__comment__btn" id="">                                                                  
						유저신고 <i class="fas fa-exclamation warn" style="color: red; font-size: 20px; font-weight: bold;"></i> 
					</button>                                                                                                
				</li>    
<%
	}                                                                                                                                          
%>                                                                                                    
				</ul>                                                                                                        
			</div>                                                                                                           
		</div>                                                                                                               
		<div id="comment_txt" style="padding-left: 10px; padding-right: 10px;">
<%
	if(comment_pos == 1){                                                                                                             
%>
				<p class="w-100" row="2" readonly>                                                                           
					&nbsp&nbsp&nbsp&nbsp&nbsp<i class="fas fa-level-up-alt" style="transform:rotate(90deg);"></i>&nbsp&nbsp<%=comment_msg %>                                     
				</p>
<%
	} else {                                                                                                                                   
%>
				<p class="w-100" row="2" readonly><%=comment_msg %></p>
<%
	};                                                                                                                                         
%>
		</div>                                                                                                               
	</div>                           