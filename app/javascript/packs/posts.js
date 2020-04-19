document.addEventListener('turbolinks:load', event => {
  const fileUploadElement = document.getElementById('file-upload');

  if(fileUploadElement) {
    fileUploadElement.addEventListener('change', function(){
      const fileName = document.getElementById("post_image").files[0].name
      const fileNameElement = document.getElementById('file-name');

      fileNameElement.innerText = `${fileName}`
    })
  }

/**
 * Display the image in the file input when added to the form.
 * Replace avatar with image selected.
 */
  let profileAvatarBlock = document.getElementById('profile-avatar');

  function showImage(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
        let avatarPreview = document.getElementById('profile-avatar-preview');
        let imageEl = avatarPreview.children[1]

        imageEl.setAttribute("src", e.target.result);

        ['width', 'height'].forEach(attribute => { 
          imageEl.removeAttribute(attribute)
        });

      };

      reader.readAsDataURL(input.files[0]);
    }
  }

  if (profileAvatarBlock) {
    profileAvatarBlock.addEventListener('change', function() {
        showImage(this);
    })
  }
});
