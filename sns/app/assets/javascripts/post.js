addOnload(function() {
  var submitButton = document.getElementById('create');
  console.log(1);
  submitButton.addEventListener('click', function(event) {
    console.log(2);
    var privacy = document.getElementById('post_privacy').value;
    var body = document.getElementById('body').value;
    var posts = document.getElementById("post");
    var userId = Number(posts.getAttribute('data-user-id'));
    var contents = JSON.stringify({post: {'privacy': privacy, 'body': body, 'user_id': userId}});
    var xhr = new XMLHttpRequest();
    xhr.open("POST", `/api/posts`);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.send(contents);
    xhr.onreadystatechange = function() {
      if (xhr.readyState == XMLHttpRequest.DONE) {
        newPost(JSON.parse(xhr.responseText));
        console.log(3);
      }
    }
    event.preventDefault();
  })
});

  function newPost (data) {
    console.log(data);
    var setPosts = document.getElementsByClassName("post");
    var posts = document.getElementById("post");
      var newPost = document.createElement("li");
      newPost.className = "post";
      var date = new Date();
      var html = `
        <a href="/users/${data.user.id}", class="name">
          ${data.user.name}
        </a>
        <span class=details>${date} (${data.privacy})</span>
        <a href="/posts/${data.id}/edit", class="post_link">[Edit privacy]</a>
        <br>${data.body}<br>
        <br><a href="/posts/${data.id}", class="post_link">
          [View detail]
        </a>`;

      newPost.innerHTML = html;
      posts.insertBefore(newPost, setPosts[0]);
  }

function addOnload(func){
  try {
    console.log(4);
    window.addEventListener("load", func, false);
  } catch (e) {
    window.attachEvent("onload", func);
  }
}
