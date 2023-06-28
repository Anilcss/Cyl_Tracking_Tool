// Apply custom styling to the Yard Reports table
function customizeYardReportsTable() {
  // Add classes to table elements for Bootstrap styling
  var table = document.querySelector("table");
  table.classList.add("table");
  table.classList.add("table-bordered");

  // Add class to thead element for dark background
  var thead = table.querySelector("thead");
  thead.classList.add("thead-dark");
}

// Call the function to customize the table on page load
window.addEventListener("load", function() {
  customizeYardReportsTable();
});
