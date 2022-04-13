if (window.addEventListener) {
	window.addEventListener('touchmove', function () {});
	window.addEventListener('load', function () {});
} else if (window.attachEvent) {
	window.attachEvent('ontouchmove', function () {});
	window.attachEvent('onload', function () {});
}