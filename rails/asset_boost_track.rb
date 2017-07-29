小技巧是可以將 js 和 css code 放進 Asset Pipeline 裡面，但是只有特定頁面才會作用(這一招不管 Turbolinks 有沒有移除都適用)。方法是每一頁的 body 標籤加上 id，修改 app/views/layout/application.html.erb：

<body id="<%= controller.controller_name %>-<%= controller.action_name %>">
這樣如果 welcome controller 的 index 頁面的話，就會產生出 <body id="welcome-index"> 的標籤。如此這樣我們的 css 或 javascript 就可以定位了。例如可以在上述的 assets/javascript/common.js 寫：

$(document).on("turbolinks:load", function() {
  if ( $("#welcome-index").length > 0 ) {
    console.log("this is welcome-index page");
  }
})