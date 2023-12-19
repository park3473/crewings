$(document).ready(function(){

	// Mobile GNB
	var header = $("#header");
	var windowWidth = $(window).width();

	$(".btn-gnb-open").on("click",function () { // [p] 20190503 수정
		m_gnb_open ();
	});
	$(".btn-gnb-close").on("click",function () { // [p] 20190503 수정
		m_gnb_close ();
	});
	

	// PC GNB 2Depth
	$(".gnb-menu li").on("mouseover", function () {
		depth2_open(this);
	});

	// [p] 20190514 수정
	$(".nav-inner").mouseleave(function () { 
		depth2_close(this);
	});

	// Mobile GNB 2Depth
	$(".gnb-menu li > a").on("click",function () {
		m_depth2_open(this);
	});

	// 언어 선택
	$(".lang-list").children(".lang").on("click",function () {
		$(this).next(".select-lang").toggleClass("hide");
	});

	$(".select-lang").children("li").each(function () {
		$(this).find("a").click(function () {
			var selected = $(this).children("span").html();
			$(this).parent("li").addClass("on").siblings("li").removeClass("on")
			$(this).parent().parent(".select-lang").addClass("hide").siblings(".lang").children("span").html(selected);
		})
	});


	$(window).resize(function () {
		if($(window).width() >= 768 && $("#header").hasClass("m-gnb-open")) {
			m_gnb_close();
		}
		m_mode()

		// [p] 20190509 수정
		if (windowWidth >= 768) {
			$(".nav-inner").on("mouseleave", function () { 
				depth2_close(this);
			});
		}
	});

// 스크롤
	$(window).on("scroll", function(){
       goTop();
       scroll_header (); // 스크롤시 header
    });

}); 

var scrollValue;

// Mobile GNB
function m_gnb_open() {
	windowHeight = $(window).height();
	winWidth = $(window).width();

	$("#header").addClass("m-gnb-open");
	$("body").addClass("openGnb-mode");
	//$("#nav").css("height",windowHeight);
	$("#nav").append("<div class='gnb-bg' />"); // [p] 2019521 수정
	$(".gnb-bg").css({'width':winWidth,'height':windowHeight});  // [p] 2019521 수정

	$(window).resize(function () {
		m_mode();
		windowHeight = $(window).height();
		winWidth = $(window).width();
		//$("#nav").css("height",windowHeight);
		$(".gnb-bg").css({'width':winWidth,'height':windowHeight});  // [p] 2019521 수정
	});
}

function m_gnb_close() {

	$("body").removeClass("openGnb-mode");
	$("#header").removeClass("m-gnb-open");
	//$("#nav").removeAttr("style");

	m_depth2_close();
	$(".gnb-bg").remove(); // [p] 2019521 수정

	$(window).resize(function () {
		//$("#nav").removeAttr("style");
		$(".gnb-bg").removeAttr("style");  // [p] 2019521 수정
	});
}
function m_depth2_open (el) {

	if($("#header").hasClass("m-gnb-open")) {
		if (!$(el).parent("li").hasClass("on")) {
			$(el).parent("li").addClass("on").siblings("li").removeClass("on");
			$(el).parent("li").siblings("li").children(".depth2").slideUp(200);
			$(el).siblings(".depth2").slideDown(200);
		} else {
			$(el).parent("li").removeClass("on");
			$(el).siblings(".depth2").slideUp(200);
		}
	}
}
function m_depth2_close () {
	$(".gnb-menu li").removeClass("on");
	$(".depth2").slideUp(200).removeAttr("style");

}


// PC GNB
function depth2_open (el) {
	//var windowWidth = $(window).width();
	// if(windowWidth >= 768 && !$("#header").hasClass("m-gnb-open")) {
	if(!$("#header").hasClass("m-gnb-open")) {
		$(el).closest("#header").addClass("gnb-open");
	}
	if ($("#header").hasClass("color-bright")) {
		$('#header').find('.logo').find('img').attr('src','/resources/img/logo.png');
	}
}
function depth2_close (el) {
	$(el).closest("#header").removeClass("gnb-open");
	if ($("#header").hasClass("color-bright")) {
		$('#header').not(".scroll").find('.logo').find('img').attr('src','/resources/img/logo_white.png'); // [p] 20190508 수정 
	}
}

// 스크롤고탑
function goTop(){
}


// header
function scroll_header () {
	if ($(this).scrollTop() > 10){

		if (!$("#wrapper").hasClass("submain")) {
			$("#header").addClass("scroll");
		}

		if ($("#header").hasClass("color-bright")) {
			$('#header').find('.logo').find('img').attr('src','/resources/img/logo.png');
		}

    } else {
       $("#header").removeClass("scroll");
       if ($("#header").hasClass("color-bright")) {
			$('#header').find('.logo').find('img').attr('src','/resources/img/logo_white.png');
		}
    }
}

