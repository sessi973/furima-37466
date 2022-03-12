function tax (){
  const itemPrice  = document.getElementById("item-price");
  itemPrice.addEventListener("input", () => {
    const inputValue = itemPrice.value;

    const addTaxValue= document.getElementById("add-tax-price");
    const addTax = Math.floor(inputValue * 0.1)
    addTaxValue.innerHTML = addTax;

    const profit = document.getElementById("profit")
    profit.innerHTML = (Math.floor(inputValue - addTax));
  })
}

window.addEventListener('load', tax);
