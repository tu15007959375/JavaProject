<template>
  <div id="app">
    <router-view></router-view>
  </div>
</template>
 
<script>
import { detectZoom } from './libs/detectZoom';


export default {
  name: 'app'
}
// 解决ERROR ResizeObserver loop completed with undelivered notifications.
var m = Number(detectZoom());

console.log(window.screen.width,window.devicePixelRatio);

document.body.style.zoom = 100.0 / (m / (1.75)*(2560/(window.screen.width * window.devicePixelRatio)));

const debounce = (fn, delay) => {

let timer = null;

return function () {

  let context = this;

  let args = arguments;

  clearTimeout(timer);

  timer = setTimeout(function () {

    fn.apply(context, args);

  }, delay);

}

}

// 解决ERROR ResizeObserver loop completed with undelivered notifications.

//问题的

const _ResizeObserver = window.ResizeObserver;

window.ResizeObserver = class ResizeObserver extends _ResizeObserver {

constructor(callback) {

  callback = debounce(callback, 16);

  super(callback);

}

},
( 
function () {
            var a_idx = 0;
            window.onclick = function (event) {
                var a = new Array("❤富强❤", "❤民主❤", "❤文明❤", "❤和谐❤", "❤自由❤", "❤平等❤", "❤公正❤", "❤法治❤", "❤爱国❤",
                    "❤敬业❤", "❤诚信❤", "❤友善❤");
 
                var heart = document.createElement("b"); //创建b元素
                heart.onselectstart = new Function('event.returnValue=false'); //防止拖动
 
                document.body.appendChild(heart).innerHTML = a[a_idx]; //将b元素添加到页面上
                a_idx = (a_idx + 1) % a.length;
                heart.style.cssText = "position: fixed;left:-100%;"; //给p元素设置样式
 
                var f = 10, // 字体大小
                    x = event.clientX - f / 2, // 横坐标
                    y = event.clientY - f, // 纵坐标
                    c = randomColor(), // 随机颜色
                    a2 = 0.6, // 透明度
                    s = 1.0; // 放大缩小
 
                var timer = setInterval(function () { //添加定时器
                    if (a2 <= 0) {
                        document.body.removeChild(heart);
                        clearInterval(timer);
                    } else {
                        heart.style.cssText = "font-size:16px;cursor: default;position: fixed;color:" +
                            c + ";left:" + x + "px;top:" + y + "px;opacity:" + a2 + ";transform:scale(" +
                            s + ");";
 
                        y--;
                        a2 -= 0.016;
                        s += 0.002;
                    }
                }, 15)
 
            }
            // 随机颜色
            function randomColor() {
 
                return "rgb(" + (~~(Math.random() * 255)) + "," + (~~(Math.random() * 255)) + "," + (~~(Math
                .random() * 255)) + ")";
 
            }
        }());
</script>

<style >
</style>