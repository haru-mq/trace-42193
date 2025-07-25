window.addEventListener('load', function(){

// new & edit form ------------------------------------------------------
  const newEditCar = this.document.getElementById('new-edit-car');
  const CarForm = this.document.getElementById('car-form');
  const errorMessages = CarForm.querySelector('.error-messages');
  
  newEditCar.addEventListener('click', function(){
    CarForm.setAttribute("style", "display: block;");
  })

  const errorShow = CarForm.dataset.errorMessages == "true";
  if (errorShow){
    CarForm.setAttribute("style", "display: block;");
  }

  this.addEventListener('click', function(e) {
    if (e.target === CarForm) {
      CarForm.setAttribute("style", "display: none;");
      if (errorMessages) {
        errorMessages.innerHTML = "";
      }
    }
  });
})