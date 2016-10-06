<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	.card{
		border: 2px; 
		border-radius: 8px; 
		padding-top: 20px; 
		padding-bottom: 20px; 
		margin-bottom: 20px; 
		-webkit-box-shadow: 5px 5px 20px 5px rgba(0,0,0,0.12);
		-moz-box-shadow: 5px 5px 20px 5px rgba(0,0,0,0.12);
		box-shadow: 5px 5px 20px 5px rgba(0,0,0,0.12);
	}
</style>
<div class="main-panel" style="padding-top: 20px;">
        <div class="content">
            <div class="container-fluid col-lg-10 col-lg-offset-1">
                <div class="row">
                    <div class="col-lg-4 col-md-5">
                        <div class="card card-user">
                            <div class="content text-center">
                                <div class="author">
                                  <img class="avatar border-white" src="img/images.png" alt="..."/>
                                  <h4 class="title">${login.mem_name }<br />
                                  </h4>
                                </div>
                                <div class="text-center">
                                    안녕하세요 반갑습니다.<br>
                                </div>
                            </div>
                            <hr>
                            <div class="text-center">
                            	<div class="row">
                            		<div class="col-md-5 col-md-offset-1">
	                                    <c:if test="${mDto.mem_email_ck == 'Y'}">
	                                    	<img style="width: 30px; height: 30px;" src="img/verified.png" alt="..."/>
	                                    </c:if>
	                                    <c:if test="${mDto.mem_email_ck == 'N'}">
	                                    	<img style="width: 30px; height: 30px;" src="img/unverified.png" alt="..."/>
	                                    </c:if><br />
	                                    <h4 class="title">이메일인증</h4>
                            		</div>
                            		<div class="col-md-5">
	                                    <c:if test="${mDto.mem_phone_ck == 'Y'}">
	                                    	<img style="width: 30px; height: 30px;" src="img/verified.png" alt="..."/>
	                                    </c:if>
	                                    <c:if test="${mDto.mem_phone_ck == 'N'}">
	                                    	<img style="width: 30px; height: 30px;" src="img/unverified.png" alt="..."/>
	                                    </c:if><br/>
	                                    <h4 class="title">휴대폰인증</h4>
	                                </div>
                            	</div>
                            </div>
                            <div class="text-center">
                                <div class="row">
                                    <div class="col-md-3 col-md-offset-1">
                                        <h5>한국<br /><small>국가</small></h5>
                                    </div>
                                    <div class="col-md-4">
                                        <h5>25<br /><small>나이</small></h5>
                                    </div>
                                    <div class="col-md-3">
                                        <h5>대학생<br /><small>직업</small></h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card col-lg-8 col-md-7">
                    	<div class="header text-center">
                           	<h3 class="title">${retrieveMap.bDto.scb_title}</h3>
                        </div>
                    </div>
                    <div class="card col-lg-8 col-md-7">
                        <div>
                            <div class="content">
                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group text-center">
                                                <small>출발 공항</small>
                                                <br>
                                                <label>${retrieveMap.start}</label>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group text-center">
                                                <small>경유</small>
                                                <br>
                                                <label>${retrieveMap.bDto.scb_via}</label>
                                            </div>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-group text-center">
                                                <small>도착 공항</small>
                                                <br>
                                                <label>${retrieveMap.arrival}</label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group text-center">
                                                <small>출발 시간</small>
                                                <br>
                                                <label>${retrieveMap.bDto.scb_sdate}</label>
                                            </div>
                                        </div>
                                    </div>
									<div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group text-center">
                                            	<hr>
                                                <br>
                                                ${retrieveMap.bDto.scb_content}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="text-center">
                                        <form name="myForm" method="get">
										<c:set var="case2" value="${retrieveMap.bDto.scb_case}"></c:set>
										<c:set var="loginMemberNum" value="${login.mem_num}" scope="session"></c:set>
										<c:set var="retrieveMap" value="${retrieveMap}" scope="session"></c:set>
										<c:set var="DtoMemberNum" value="${mDto.mem_num}"></c:set>
										<c:set var="boardNum" value="${retrieveMap.bDto.scb_num}"></c:set>
										<c:set var="searchMapFrom" value="${map.scb_from}" scope="session"></c:set>
										<c:set var="mDto" value="${mDto}" scope="session"></c:set>
										<c:if test="${loginMemberNum!=DtoMemberNum}">
											<input type="button" value="동행요청" <c:if test="${case2!='WAIT'}">disabled="disabled" style="background: rgb(100,100,100);"</c:if> onclick="boardMediate()" >
										</c:if>
										<c:if test="${loginMemberNum==DtoMemberNum}">
											<input class="btn btn-info btn-fill btn-wd" type="button" value="수정" onclick="boardUpdate(myForm)">
											<input class="btn btn-info btn-fill btn-wd" type="button" value="삭제" onclick="boardDelete(myForm,${boardNum})">
										</c:if>
											<input class="btn btn-info btn-fill btn-wd" type="button" value="목록보기" onclick="boardRetrieveToList(myForm,'${map.scb_from}','${map.scb_to }','${map.min}','${map.max}','${curPage1}')">
										</form>
                                    </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>
<script type="text/javascript">
	function boardDelete(f,num) {
		alert(num);
		location.href="BoardDeleteServlet?scb_num="+num;
	}
	function boardUpdate(f) {
		f.action="BoardUpdateUIServlet";
		console.log(f.action);
		location.href="BoardUpdateUIServlet";
	}
	function boardMediate(){
		if(${login==null}){
			alert("로그인을 하셔야 이용 할 수 있습니다.");
		}else{
			location.href="BoardMediateServlet";
		} 
	}
	function boardRetrieveToList(f,scb_from,scb_to,min,max,curPage) {
		location.href="BoardListServlet?scb_from="+scb_from+"&scb_to="+scb_to+"&min="+min+"&max="+max+"&curPage="+curPage;
	}
</script>