console.log('this is my github script')
console.log('https://raw.githubusercontent.com/wither7007/htmlTemplate/main/html/global.js')
console.log('')
let mydeliver = 'https://cdn.jsdelivr.net/gh/wither7007/htmlTemplate/html/script.js'
let myd = document.createElement('div')
myd.textContent = mydeliver
document.body.prepend(myd)
document.addEventListener('DOMContentLoaded', function () {
    console.log('DOMContentLoaded');
});
