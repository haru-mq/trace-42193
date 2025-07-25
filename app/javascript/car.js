window.addEventListener('load', function(){

// edit form ------------------------------------------------------
  const editCar = this.document.getElementById('edit-car');
  const editCarForm = this.document.getElementById('edit-car-form');
  
  editCar.addEventListener('click', function(){
    editCarForm.setAttribute("style", "display: block;");
  })

  const errorShow = editCarForm.dataset.errorMessages == "true";
  if (errorShow){
    editCarForm.setAttribute("style", "display: block;");
  }

  this.addEventListener('click', function(e) {
    if (e.target === editCarForm) {
      editCarForm.setAttribute("style", "display: none;");
    }
  });


  
})