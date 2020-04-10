window.onload = function() {
  const fileUploadElement = document.getElementById('file-upload');

  if(fileUploadElement) {
    fileUploadElement.addEventListener('change', function(){
      const fileName = document.getElementById("post_image").files[0].name
      const fileNameElement = document.getElementById('file-name');

      fileNameElement.innerText = `${fileName}`
    })
  }
};

