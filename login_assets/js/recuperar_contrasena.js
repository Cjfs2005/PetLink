document.addEventListener("DOMContentLoaded", function() {
    const recoverForm = document.getElementById("recover-form");
    const overlay = document.getElementById("overlay");
    const notificationModal = document.getElementById("notificationModal");
    const acceptBtn = document.getElementById("acceptBtn");
    const closeModal = document.getElementById("closeModal");

    if (recoverForm) {
        recoverForm.addEventListener("submit", function(event) {
            event.preventDefault(); // Evita el envío del formulario
            overlay.style.display = "block";
            notificationModal.style.display = "block";
        });

        acceptBtn.addEventListener("click", function() {
            overlay.style.display = "none";
            notificationModal.style.display = "none";
        });

        closeModal.addEventListener("click", function() {
            overlay.style.display = "none";
            notificationModal.style.display = "none";
        });
    }
});
