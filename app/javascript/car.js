window.addEventListener('load', function(){

  // Car new & edit form ------------------------------------------------------
  const newEditCar = document.getElementById('new-edit-car');
  const carForm = document.getElementById('car-form');
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
  const editCalculation = document.getElementById('edit-calculation');
  const calculationForm = document.getElementById('calculation-form');
  const calculationErrorMessages = calculationForm.querySelector('.error-messages');

  editCalculation.addEventListener('click', function(){
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
      if (calculationErrorMessages) {
        calculationErrorMessages.innerHTML = "";
      }
    }
  });

  // Calculation edit form ------------------------------------------------------
  const editSignals = document.querySelectorAll('.edit-signalinfo');
  const signalinfoForm = document.getElementById('signalinfo-form');
  const signalinfoErrorMessages = signalinfoForm.querySelector('.error-messages');

  editSignals.forEach((editSignal) => {
    editSignal.addEventListener('click', function() {
      const signalinfoId = this.dataset.signalinfoId;
      const signalinfoName = this.dataset.signalinfoName;
      const signalinfoType = this.dataset.signalinfoType;
      const signalCalculationId = this.dataset.signalCalculationId;
      const signalCarId = this.dataset.signalCarId;

      const calculationEditForm = document.getElementById('signalinfo-edit-form');
      calculationEditForm.setAttribute("action", `/cars/${signalCarId}/calculations/${signalCalculationId}/signalinfos/${signalinfoId}`);

      // document.getElementById('calculation-id-field').value = calculationId;
      document.getElementById('signalinfo-name-field').value = signalinfoName;
      document.getElementById('signalinfo-type-field').value = signalinfoType;

      signalinfoForm.setAttribute("style", "display: block;");
    });
  });

  const signalInfoErrorShow = signalinfoForm.dataset.errorMessages == "true";
  if (signalInfoErrorShow){
    signalinfoForm.setAttribute("style", "display: block;");
  }

  this.addEventListener('click', function(e) {
    if (e.target === signalinfoForm) {
      signalinfoForm.setAttribute("style", "display: none;");
      if (signalinfoErrorMessages) {
        signalinfoErrorMessages.innerHTML = "";
      }
    }
  });

})