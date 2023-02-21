$(function () {
  /*// KOR 선택 시
	$(".lang_ko").click(function(){
		
		var hostname = $(location).attr('hostname'); 
		var pathname = $(location).attr('pathname'); 
		var local_domain = "http://localhost:8081";
		var dev_domain = "https://newdev.cjolivenetworks.co.kr:8443";
		var prd_domain = "https://www.cjolivenetworks.co.kr";
		
		if(hostname.includes('localhost')) {
			window.location = local_domain + pathname;	
		} 
		
		if(hostname.includes('newdeven.cjolivenetworks.co.kr')) {
			window.location = dev_domain + pathname;
		}
		
		if(hostname.includes('www.cjolivenetworks.co.kr')) {
			window.location = prd_domain + pathname;
		}
	});*/

  // ENG 선택 시
  $(".lang_en").click(function () {
    var hostname = $(location).attr("hostname");
    var pathname = $(location).attr("pathname");
    var local_domain = "http://localhost:8083";
    var dev_domain = "https://newdeven.cjolivenetworks.co.kr:8443";
    var prd_domain = "https://en.cjolivenetworks.co.kr";

    if (
      pathname.includes("/util/privacy_statement") ||
      pathname.includes("/util/billing_agreement") ||
      pathname.includes("/util/eft_agreement") ||
      pathname.includes("/util/pg_faq") ||
      pathname.includes("/util/sugarpay_agreement") ||
      pathname.includes("/sustainability/contribution/education_volunteers")
    ) {
      pathname = "/";
    }

    if (
      pathname.includes("/news/press_release/detail/") ||
      pathname.includes("/news/blog/detail/") ||
      pathname.includes("/news/notice/detail/")
    ) {
      pathname = "/news/recent_news";
    }

    if (hostname == "localhost") {
      window.location = local_domain + pathname;
    }

    if (hostname == "newdev.cjolivenetworks.co.kr") {
      window.location = dev_domain + pathname;
    }

    if (hostname == "www.cjolivenetworks.co.kr") {
      window.location = prd_domain + pathname;
    }
  });
});
