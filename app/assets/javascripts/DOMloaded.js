document.addEventListener("DOMContentLoaded", function() {
  const imgCardItems = document.querySelectorAll(".img-card-item");

  function showItems() {
    imgCardItems.forEach(function(item, index) {
      setTimeout(function() {
        item.classList.add("show");
      }, index * 300);
    });
  }

  showItems();
});
