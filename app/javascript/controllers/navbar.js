const navbar = () => {
  // Sets variables based on the unique class name I given them
  const collapseButton = document.querySelector(".btn-collapse");
  const navigation = document.querySelector(".navigation");
  const navbar = document.querySelector(".navbar");

  // Defines expandNavbar function
  const expandNavbar = () => {
    navbar.classList.toggle("navbar-expanded");
    navigation.classList.toggle("navigation-active");
  };

  // Defines retract Navbar function
  const retractNavbar = () => {
    navbar.classList.remove("navbar-expanded");
    navigation.classList.remove("navigation-active");
  };

  // Adds both functions to navbar on specific events
  navbar.addEventListener("click", expandNavbar);
  navbar.addEventListener("mouseleave", retractNavbar);
  console.log(navbar)
}


export { navbar };
