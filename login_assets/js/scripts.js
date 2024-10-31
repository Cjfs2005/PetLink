document.addEventListener("DOMContentLoaded", function() {
    const registerForm = document.getElementById("register-form");
    const overlay = document.getElementById("overlay");
    const notificationModal = document.getElementById("notificationModal");
    const acceptBtn = document.getElementById("acceptBtn");
    const closeModal = document.getElementById("closeModal");

    // Función para mostrar el modal
    function showModal() {
        overlay.style.display = "block";
        notificationModal.style.display = "block";
    }

    // Función para ocultar el modal
    function hideModal() {
        overlay.style.display = "none";
        notificationModal.style.display = "none";
    }

    // Mostrar modal al enviar el formulario
    if (registerForm) {
        registerForm.addEventListener("submit", function(event) {
            event.preventDefault(); // Evita que la página se recargue
            showModal();  // Muestra la notificación de "Registro Completado"
        });
    }

    // Ocultar modal al hacer clic en "Aceptar" y redirigir al login
    if (acceptBtn) {
        acceptBtn.addEventListener("click", function() {
            hideModal();
            window.location.href = "login.html"; // Redirigir a la página de login
        });
    }

    // Ocultar modal al hacer clic en la "X"
    if (closeModal) {
        closeModal.addEventListener("click", function() {
            hideModal();
        });
    }
});
