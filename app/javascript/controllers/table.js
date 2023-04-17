const table = () => {
  const reportTable = document.querySelector('#report-table');
  if (reportTable) {
    const headerRow = reportTable.firstElementChild;
    const columns = Array.from(headerRow.children);

    const sortGrid = (index, desc) => {
      desc = desc;
      const container = document.querySelector('#shifts');
      const items = Array.from(container.children);
      const sortedItems = items.sort(function (a, b) {
        var aVal = a.querySelectorAll('.cell')[index].innerHTML;
        var bVal = b.querySelectorAll('.cell')[index].innerHTML;
        if (desc) {
          return new Date(aVal) - new Date(bVal);
        } else {
          return new Date(bVal) - new Date(aVal);
        }
      });
      container.innerHTML = '';
      sortedItems.forEach(function (item) {
        container.appendChild(item);
      });
    };

    const removeArrows = () => {
      headerRow.children.start.children[2].innerText = '';
      headerRow.children.finish.children[2].innerText = '';
    }

    const addArrow = (column, desc) => {
      let arrow = column.children[2]
      if (desc) {
        arrow.innerText = 'v';
      } else {
        arrow.innerText = '^'
      }
    };

    const sortTableFromHeader = () => {

      sortGrid(3, true);

      columns.forEach(function (column, i) {
        let desc = true;
        if (i == 3 || i == 4) {
          column.addEventListener("click", function () {
            removeArrows();
            addArrow(column, desc);
            sortGrid(i, desc);
            desc = !desc;
          });
        }
      });
    };

  sortTableFromHeader();
  }
};
export { table }
