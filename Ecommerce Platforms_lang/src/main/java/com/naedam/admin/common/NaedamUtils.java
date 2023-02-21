package com.naedam.admin.common;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class NaedamUtils {
	public static String getPagebar(int cPage, int numPerPage, int totalContents, String url) {
		StringBuilder pagebar = new StringBuilder();
		
		// 전체페이지수
		int totalPage = (int) Math.ceil((double) totalContents / numPerPage);
		
		// 페이지번호를 클릭했을 때 링크
		String delimeter = url.contains("?") ? "&" : "?";
		url = url + delimeter + "cPage="; // /spring/board/boardList.do?cPage=
		// 페이지바 크기 
		int pagebarSize = 5;
		
		/* 
		 		1 2 3 4 5 >>
		 		
		 	<<	6 7 8 9 10 >>
		 	
		 	<< 11 12
		 	
		 	pageStart : 시작하는 pageNo
		 		- cPage와 pagebarSize에 의해 결정
		 */
		int pageStart = (cPage - 1) / pagebarSize * pagebarSize + 1;
		int pageEnd = pageStart + pagebarSize - 1;
		
		int pageNo = pageStart;
		System.out.println("page 확인 === "+pageStart+" ||| "+pageEnd+" ||| "+pageNo+ " ||| "+totalPage);
		/*
		 *  ● disabled : 필요 없는 목록 비활성화 처리
		 *  ● tabindex = "-1" : tab을 해도 건너 띄게끔 처리(disabled 처리 할 때 같이 처리) 
		 *  ● <span aria-hidden="true">&laquo;</span> : << 꺽쇠
		 *  ● <span aria-hidden="true">&raquo;</span> : >> 꺽쇠
		 */
		
		/*
		 <nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">
		  
		  	// 이전 영역
		    <li class="page-item disabled">
		      <a class="page-link" href="#" aria-label="Previous" tabindex="-1">
		        <span aria-hidden="true">&laquo;</span>
		        <span class="sr-only">Previous</span>
		      </a>
		    </li>
		    
		    // 페이지바 영역
		    <li class="page-item"><a class="page-link" href="#">1</a></li>
		    <li class="page-item"><a class="page-link" href="#">2</a></li>
		    <li class="page-item"><a class="page-link" href="#">3</a></li>
		    
		    // 다음 영역
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		        <span class="sr-only">Next</span>
		      </a>
		    </li>
		    
		  </ul>
		</nav>
		<script>
		const paging = (cPage) => {
			location.href = url + cPage;
		}
		</script>
		
		 */
		
		// \n : 마지막에 개행문자를 붙혀준다. --> 확인 용이.
		pagebar.append("<div class=\"common-pagination\">\n");
		
		// 1. 이전
		/*
		 * ● pageNo == 1 이전 페이지가 없으므로,
		 * ● disabled & tabindex="-1" 처리
		 */
		if(cPage == 1) {
			pagebar.append("<a href=\"javascript:paging('prev');\" class=\"prev\"></a>\n"
					+ " <div>\n");
		}
		/*
		 * ● 자바 스크립트 함수 호출 : href=\"javascript:paging(" + (pageNo - 1) + ") --> 이전 페이지로.
		 */
		else {
			pagebar.append("<a href=\"javascript:paging(" + (cPage-1) + ");\" class=\"prev\"></a>\n"
					+ " <div>\n");
		}
		
		// 2. pageNo
		while(pageNo <= pageEnd && pageNo <= totalPage) {
			if(pageNo == cPage) {
				/*
				 * ● 현재 페이지인 경우 링크 제공안함.
				 * ● class 값으로 active 추가
				 * ● a 태그 안에 pageNo
				 */
				pagebar.append("<a href=\"javascript:paging("+ pageNo +")\")><strong>"+ pageNo +"</strong></a>\n");
			}
			else {
				/*
				 * ● 현재 페이지가 아닌 경우 링크를 제공.
				 * ● href=\"javascript:paging(" + pageNo + ")
				 */
				pagebar.append("<a href=\"javascript:paging("+ pageNo +")\");\">"+ pageNo +"</a>\n");
			}
			
			pageNo++;
		}
		
		// 3. 다음
		/* 
		 * ● pageNO > totalPage 인 경우 다음 페이지로 이동 없게끔 조치.
		 * ● disabled & tabindex="-1" 처리
		 */
		if(cPage >= totalPage) {
			System.out.println(cPage+" > "+totalPage+"    ||| 접근");
			pagebar.append("</div>\n<a href=\"javascript:paging('next');\" class=\"next\"></a>\n"
					+"		</div>\n");
		}
		/*
		 * ● 자바 스크립트 함수 호출 : href=\"javascript:paging(" + (pageNo) + ") --> 다음 페이지로.
		 */
		else {
			System.out.println(cPage+" > "+totalPage+"    ||| 접근2");
			pagebar.append("<a href=\"javascript:paging(" + (cPage+1) + ");\" class=\"next\"></a>\n"
					+"		</div>\n");
		}
		return pagebar.toString();
	}
}
