window.onload=function(){
  var submitButton = document.getElementById('create');
  submitButton.addEventListener('click', function() {
    var privacy = document.getElementById('post_privacy').value;
    var body = document.getElementById('body').value;
    var data = JSON.stringify({'privacy': privacy, 'body': body});
    var contents = {privacy: privacy, body: body};
    var xhr = new XMLHttpRequest();
    newPost(contents);
    xhr.open("POST", `/api/posts`);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.send(data);
  })


  function newPost (data) {
    console.log(data)

    var posts = document.getElementById("post");
      var newPost = document.createElement("li");
      newPost.className = "post";
      var userId = Number(posts.getAttribute('data-user-id'));
      var userName = posts.getAttribute('data-user-name');
      var date = new Date();
      var html = `
        <a href="/users/${userId}", class="name">
          ${userName}
        </a>
        <span class=details>${date} (${data.privacy})</span>
        <br>${data.body}<br>`;

      newPost.innerHTML = html;
      posts.appendChild(newPost);
  }
}
