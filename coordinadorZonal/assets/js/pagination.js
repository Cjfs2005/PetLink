document.addEventListener("DOMContentLoaded", function () {
    const itemsPerPage = 6; // Mostrar 3 banners por página
    const banners = document.querySelectorAll(".contenedor-banner .banner");
    const paginationContainer = document.querySelector(".pagination");
    const totalPages = Math.ceil(banners.length / itemsPerPage);
  
    function showPage(page) {
      banners.forEach((banner, index) => {
        banner.style.display =
          index >= (page - 1) * itemsPerPage && index < page * itemsPerPage
            ? "flex"
            : "none";
      });
      updatePagination(page);
    }
  
    function updatePagination(currentPage) {
      paginationContainer.innerHTML = ""; // Limpia los botones anteriores
  
      // Detectar ancho de pantalla para mostrar diferentes elementos
      const isSmallScreen = window.innerWidth <= 480;
  
      // Botón de salto a la primera página
      const firstButton = document.createElement("li");
      firstButton.innerHTML = `<a href="#" class="button ${currentPage === 1 ? "disabled" : ""}">&laquo;&laquo;</a>`;
      firstButton.addEventListener("click", (e) => {
        e.preventDefault();
        showPage(1);
      });
      paginationContainer.appendChild(firstButton);
  
      // Botón de anterior
      const prevButton = document.createElement("li");
      prevButton.innerHTML = `<a href="#" class="button ${currentPage === 1 ? "disabled" : ""}">&laquo;</a>`;
      prevButton.addEventListener("click", (e) => {
        e.preventDefault();
        if (currentPage > 1) showPage(currentPage - 1);
      });
      paginationContainer.appendChild(prevButton);
  
      // Cálculo de rango de botones de página a mostrar en pantallas grandes
      let startPage, endPage;
      if (totalPages <= 5 || isSmallScreen) {
        startPage = 1;
        endPage = totalPages;
      } else {
        if (currentPage <= 3) {
          startPage = 1;
          endPage = 5;
        } else if (currentPage + 2 >= totalPages) {
          startPage = totalPages - 4;
          endPage = totalPages;
        } else {
          startPage = currentPage - 2;
          endPage = currentPage + 2;
        }
      }
  
      // Botones de página
      for (let i = startPage; i <= endPage; i++) {
        const pageButton = document.createElement("li");
        pageButton.innerHTML = `<a href="#" class="page ${i === currentPage ? "active" : ""}">${i}</a>`;
        pageButton.addEventListener("click", (e) => {
          e.preventDefault();
          showPage(i);
        });
        paginationContainer.appendChild(pageButton);
      }
  
      // Botón de siguiente
      const nextButton = document.createElement("li");
      nextButton.innerHTML = `<a href="#" class="button ${currentPage === totalPages ? "disabled" : ""}">&raquo;</a>`;
      nextButton.addEventListener("click", (e) => {
        e.preventDefault();
        if (currentPage < totalPages) showPage(currentPage + 1);
      });
      paginationContainer.appendChild(nextButton);
  
      // Botón de salto a la última página
      const lastButton = document.createElement("li");
      lastButton.innerHTML = `<a href="#" class="button ${currentPage === totalPages ? "disabled" : ""}">&raquo;&raquo;</a>`;
      lastButton.addEventListener("click", (e) => {
        e.preventDefault();
        showPage(totalPages);
      });
      paginationContainer.appendChild(lastButton);
    }
  
    // Inicializa en la primera página
    showPage(1);
  
    // Actualizar la paginación si el tamaño de pantalla cambia
    window.addEventListener("resize", () => {
      const currentPage = document.querySelector(".pagination .page.active");
      showPage(parseInt(currentPage ? currentPage.innerText : 1));
    });
  });