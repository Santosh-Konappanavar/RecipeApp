document.addEventListener('DOMContentLoaded', function() {
    const visibilitySwitch = document.querySelector('.visibility-switch');
  
    visibilitySwitch.addEventListener('click', function() {
      const form = visibilitySwitch.closest('form');
      const publicField = form.querySelector('[name="recipe[public]"]');
      const isActive = visibilitySwitch.classList.contains('active');
  
      visibilitySwitch.classList.toggle('active');
      publicField.value = isActive ? 'true' : 'false';
  
      // Additional logic to submit the form if needed
      form.submit();
    });
  });

  