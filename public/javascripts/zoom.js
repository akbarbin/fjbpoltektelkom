$('#pictureFilePreview').css('overflow','scroll'); 
$('#pictureFilePreviewImg') 
.attr("src", "http://url.of.the.image") 
.css("display","block") 
.bind("load", function(){ //wait for complete load of the image 
// Slider   
var initHeight = parseInt($('#pictureFilePreviewImg').attr("height"));   
var initWidth = parseInt($('#pictureFilePreviewImg').attr("width"));   
if ($('#pictureFilePreview').width() < initWidth  
|| $('#pictureFilePreview').height() < initHeight) { 
var deltaW = $('#pictureFilePreview').width() - initWidth; 
var deltaH = $('#pictureFilePreview').height() - initHeight; 
var ratio = 0; 
if (deltaW < deltaH) { 
ratio = ($('#pictureFilePreview').width() / initWidth) * 100; 
} else { 
ratio = ($('#pictureFilePreview').height() / initHeight) * 100; 
} 
$('#pictureSlider').slider({   
range: false, 
min : ratio, 
values: [100], 
change: function(event, ui) {   
var newHeight = ((initHeight) * ui.value / 100);   
var newWidth = ((initWidth) * ui.value / 100);  
$('#pictureFilePreviewImg').attr("height",newHeight);   
$('#pictureFilePreviewImg').attr("width",newWidth);   
$('#pictureFilePreview').css('overflow',ui.value === 0?'visible':'scroll');   
}   
});  
} 
}); 
