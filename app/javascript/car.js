window.addEventListener('load', function(){

// Car new & edit form ------------------------------------------------------
  const newEditCar = this.document.getElementById('new-edit-car');
  const carForm = this.document.getElementById('car-form');
  const carErrorMessages = carForm.querySelector('.error-messages');
  
  newEditCar.addEventListener('click', function(){
    carForm.setAttribute("style", "display: block;");
  })

  const carErrorShow = carForm.dataset.errorMessages == "true";
  if (carErrorShow){
    carForm.setAttribute("style", "display: block;");
  }

  this.addEventListener('click', function(e) {
    if (e.target === carForm) {
      carForm.setAttribute("style", "display: none;");
      if (carErrorMessages) {
        carErrorMessages.innerHTML = "";
      }
    }
  });

// Calculation edit form ------------------------------------------------------
  const newEditCalculation = this.document.getElementById('edit-calculation');
  const calculationForm = this.document.getElementById('calculation-form');
  const errorMessages = calculationForm.querySelector('.error-messages');

  newEditCalculation.addEventListener('click', function(){
    const calculationId = this.dataset.calculationId;
    const calculationName = this.dataset.calculationName;
    const calculationCarId = this.dataset.calculationCarId;

    const calculationEditForm = document.getElementById('calculation-edit-form');
    calculationEditForm.setAttribute("action", `/cars/${calculationCarId}/calculations/${calculationId}`);

    document.getElementById('calculation-id-field').value = calculationId;
    document.getElementById('calculation-name-field').value = calculationName;

    calculationForm.setAttribute("style", "display: block;");
  })

  const calculationErrorShow = calculationForm.dataset.errorMessages == "true";
  if (calculationErrorShow){
    calculationForm.setAttribute("style", "display: block;");
  }

  this.addEventListener('click', function(e) {
    if (e.target === calculationForm) {
      calculationForm.setAttribute("style", "display: none;");
      if (errorMessages) {
        errorMessages.innerHTML = "";
      }
    }
  });

})