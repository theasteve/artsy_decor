window.onload = function() {
  console.log('PARTTYY')
  const fileUploadElement = document.getElementById('file-upload');
  console.log('HEREEE');
  if(fileUploadElement) {
    debugger;
    fileUploadElement.addEventListener('change', function(){
      const fileName = document.getElementById("post_image").files[0].name
      const fileNameElement = document.getElementById('file-name');

      fileNameElement.innerText = `${fileName}`
    })
  }
};

