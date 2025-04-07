document.addEventListener('DOMContentLoaded', function () {
  const button = document.querySelector('.custom-button');
  const modal = document.querySelector('#custom-modal');
  const closeModal = document.querySelector('#close-modal');

  if (button && modal && closeModal) {
    button.addEventListener('click', function (e) {
      e.preventDefault();
      modal.style.display = 'block';
    });

    closeModal.addEventListener('click', function () {
      modal.style.display = 'none';
    });

    window.addEventListener('click', function (e) {
      if (e.target === modal) {
        modal.style.display = 'none';
      }
    });
  }
});