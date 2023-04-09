const sidebar = () => {
  // Sets variables based on the unique class name I given them
  const collapseButton = document.querySelector(".btn-collapse");
  const navigation = document.querySelector(".navigation");
  const sidebar = document.querySelector(".sidebar");

  // Defines expandNavbar function
  const expandNavbar = () => {
    sidebar.classList.toggle("sidebar-expanded");
    navigation.classList.toggle("navigation-active");
  };

  // Defines retract Navbar function
  const retractNavbar = () => {
    sidebar.classList.remove("sidebar-expanded");
    navigation.classList.remove("navigation-active");
  };

  // Adds both functions to sidebar on specific events
  sidebar.addEventListener("click", expandNavbar);
  sidebar.addEventListener("mouseleave", retractNavbar);
}

export { sidebar };
