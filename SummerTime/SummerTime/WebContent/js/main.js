$(document).ready(function() {
	$(window).on("load",function(){
		imgLocation();
		
	});
});
function imgLocation(){
	var box=$(".box");
	var boxWidth=box.eq(0).width();
	var num=Math.floor($(window).width()/boxWidth);
	var boxArr=[];
	box.each(function(index,value){
		//console.log(index+"--"+value);
		var boxHeight =box.eq(index).height()+50;
		if(index<num){
			boxArr[index]=boxHeight;
		//	console.log(boxHeight);
			
		}else{
			var minboxHeight=Math.min.apply(null,boxArr);
		//	console.log(minboxHeight);
			var minboxIndex=$.inArray(minboxHeight,boxArr);
			$(value).css({
				"position":"absolute",
				"top":minboxHeight,
				"left":box.eq(minboxIndex).position().left
			
			});
			boxArr[minboxIndex]+=box.eq(index).height();
		}
	});
}




