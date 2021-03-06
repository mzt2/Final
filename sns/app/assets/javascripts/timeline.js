window.onload=function(){
  var page = 0;

  var req = new XMLHttpRequest();
  req.addEventListener("load", getPosts);
  req.open("GET", `/api/posts?page=${page}`);
  req.send();


  var button = document.getElementById('add');
  if(!button){return};
  button.addEventListener('click', function(){
    var xhr = new XMLHttpRequest();
    xhr.addEventListener("load", getPosts);
    xhr.open("GET", `/api/posts?page=${page}`);
    xhr.send();
  });

  function getPosts () {
    var data = JSON.parse(this.responseText);
    console.log(data);
    var posts = document.getElementById("post");
    if(!posts){return};
    var userId = Number(posts.getAttribute('data-user-id'));
    data.forEach(function(d) {
      var nextPost = document.createElement("li");
      nextPost.className = "post onTimeline";
      var date = new Date(d.created_at);
      var html = `
        <a href="/users/${d.user.id}", class="name">
          ${d.user.name}
        </a>
        <span class=details>${date} (${d.privacy})</span>
      `;
      if (userId == d.user.id) {
        html += `<a href="/posts/${d.id}/edit", class="post_link">[Edit privacy]</a>`;
      };

      html += `<br>${d.body}<br>`;

      d.image_urls.forEach(function(image_url){html += `<image src="${image_url}">`});

      html += `
        <br><a href="/posts/${d.id}", class="post_link">
          [View detail]
        </a>
      `;

      nextPost.innerHTML = html;
      posts.insertBefore(nextPost, null);
    });
    ++page;
  }
}
