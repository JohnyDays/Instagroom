
function fullscreen(element)
{
  console.log(element.toElement)
var $img = $(element.toElement).clone(),
    imageWidth = $img[0].width,
    imageHeight = $img[0].height,
    maxWidth = $(window).width(),
    maxHeight = $(window).height(),
    widthRatio = maxWidth / imageWidth,
    heightRatio = maxHeight / imageHeight

var ratio = widthRatio

if (widthRatio * imageHeight > maxHeight) {
    ratio = heightRatio
}


$img.attr('width', imageWidth * ratio)
    .attr('height', imageHeight * ratio)
$img.click(function()
{
    $(this).remove()
})


$img.css({
    margin: 'auto',
    position: 'fixed',
    top: 0,
    bottom: 0,
    left: 0,
    right: 0
})
$img.appendTo('body')
}
