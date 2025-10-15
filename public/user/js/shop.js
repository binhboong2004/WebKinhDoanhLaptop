document.addEventListener('DOMContentLoaded', function() {
    var itemsPerPage = 6;
    var currentPage = 1;
    var productItems = Array.from(document.querySelectorAll('.product-item'));

    function renderProducts(page) {
        currentPage = page;
        var start = (page - 1) * itemsPerPage;
        var end = start + itemsPerPage;
        var paginatedProducts = productItems.slice(start, end);

        document.getElementById('product-list').innerHTML = '';

        paginatedProducts.forEach(function(productItem) {
            document.getElementById('product-list').appendChild(productItem.cloneNode(true));
        });

        renderPagination(); // Re-render pagination to update active class
    }

    function renderPagination() {
        var pageCount = Math.ceil(productItems.length / itemsPerPage);
        var paginationContainer = document.getElementById('pagination');
        paginationContainer.innerHTML = '';

        var prevLink = document.createElement('a');
        prevLink.href = '#';
        prevLink.innerHTML = '&laquo;';
        if (currentPage === 1) {
            prevLink.classList.add('disabled');
        }
        prevLink.onclick = function(event) {
            event.preventDefault();
            if (currentPage > 1) {
                renderProducts(currentPage - 1);
            }
        };
        paginationContainer.appendChild(prevLink);

        for (var i = 1; i <= pageCount; i++) {
            var pageLink = document.createElement('a');
            pageLink.href = '#';
            pageLink.innerText = i;
            if (i === currentPage) {
                pageLink.style.backgroundColor = '#EE1926';
                pageLink.style.color = 'white';
            }
            pageLink.onclick = (function(page) {
                return function(event) {
                    event.preventDefault();
                    renderProducts(page);
                };
            })(i);
            paginationContainer.appendChild(pageLink);
        }

        var nextLink = document.createElement('a');
        nextLink.href = '#';
        nextLink.innerHTML = '&raquo;';
        if (currentPage === pageCount) {
            nextLink.classList.add('disabled');
        }
        nextLink.onclick = function(event) {
            event.preventDefault();
            if (currentPage < pageCount) {
                renderProducts(currentPage + 1);
            }
        };
        paginationContainer.appendChild(nextLink);
    }

    renderProducts(currentPage);
    renderPagination();
});