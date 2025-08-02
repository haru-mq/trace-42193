window.addEventListener('turbo:load', function(){

  // Function List ------------------------------------------------------
  function showModal(modal) {
    modal.style.display = "block";
  }

  function hideModal(modal, errorMessages) {
    modal.style.display = "none";
    if (errorMessages) errorMessages.innerHTML = "";
  }

  // Car new & edit form ------------------------------------------------------
  const newEditCar = document.getElementById('new-edit-car');
  const carForm = document.getElementById('car-form');

    // Car edit popup
  if (newEditCar && carForm) {
    const carErrorMessages = carForm.querySelector('.error-messages');
  
    newEditCar.addEventListener('click', function() {
      showModal(carForm);
    })

      // Car edit error
    if (carForm?.dataset.errorMessages == "true") {
      showModal(carForm);
    }

      // Close Car edit form
    this.addEventListener('click', (e) => {
      if (e.target === carForm) {
        hideModal(carForm, carErrorMessages);
      }
    });
  }

  // Calculation edit form ------------------------------------------------------
  const editCalculation = document.getElementById('edit-calculation');
  const calculationForm = document.getElementById('calculation-form');

    // Calculation update pass setting
  function setCalculationFormAction(calculationId, calculationCarId) {
    const calculationEditForm = document.getElementById('calculation-edit-form');
    calculationEditForm.setAttribute("action", `/cars/${calculationCarId}/calculations/${calculationId}`);
  }

    // Calculation edit popup
  if (editCalculation && calculationForm) {
    const calculationErrorMessages = calculationForm.querySelector('.error-messages');

    editCalculation.addEventListener('click', function(){
      const calculationId = this.dataset.calculationId;
      const calculationName = this.dataset.calculationName;
      const calculationCarId = this.dataset.carId;

      setCalculationFormAction(calculationId, calculationCarId);

      document.getElementById('calculation-id-field').value = calculationId;
      document.getElementById('calculation-name-field').value = calculationName;

      showModal(calculationForm);
    })

      // Calculation edit error
    if(calculationForm?.dataset.errorMessages == "true") {
      const calculationId = calculationForm.dataset.calculationId;
      const calculationCarId = calculationForm.dataset.carId;

      console.log(calculationId, calculationCarId)

      setCalculationFormAction(calculationId, calculationCarId);

      showModal(calculationForm);
    }

      // Close Calculation edit form
    this.addEventListener('click', (e) => {
      if (e.target === calculationForm) {
        hideModal(calculationForm, calculationErrorMessages);
      }
    });
  }

  // Signal edit form ------------------------------------------------------
  const editSignals = document.querySelectorAll('.edit-signalinfo');
  const signalinfoForm = document.getElementById('signalinfo-form');

    // Signal update pass setting
  function setSignalinfoFormAction(signalinfoId, signalCalculationId, signalCarId) {
    const signalEditForm = document.getElementById('signalinfo-edit-form');
    signalEditForm.setAttribute("action", `/cars/${signalCarId}/calculations/${signalCalculationId}/signalinfos/${signalinfoId}`);
  }

    // Signal edit popup
  if (editSignals.length > 0 && signalinfoForm) {
    const signalinfoErrorMessages = signalinfoForm.querySelector('.error-messages');

    editSignals.forEach((editSignal) => {
      editSignal.addEventListener('click', function() {
        const signalinfoId = this.dataset.signalinfoId;
        const signalinfoName = this.dataset.signalinfoName;
        const signalinfoType = this.dataset.signalinfoType;
        const signalCalculationId = this.dataset.calculationId;
        const signalCarId = this.dataset.carId;

        setSignalinfoFormAction(signalinfoId, signalCalculationId, signalCarId);

        document.getElementById('signalinfo-name-field').value = signalinfoName;
        document.getElementById('signalinfo-type-field').value = signalinfoType;

        showModal(signalinfoForm);
      });
    });

      // Signal edit error
    if(signalinfoForm?.dataset.errorMessages == "true") {
      const signalinfoId = signalinfoForm.dataset.signalinfoId;
      const signalCalculationId = signalinfoForm.dataset.calculationId;
      const signalCarId = signalinfoForm.dataset.carId;

      setSignalinfoFormAction(signalinfoId, signalCalculationId, signalCarId);

      showModal(signalinfoForm);
    }

      // Close Signal edit form
    this.addEventListener('click', function(e) {
      if (e.target === signalinfoForm) {
        hideModal(signalinfoForm, signalinfoErrorMessages);
      }
    });
  }
})