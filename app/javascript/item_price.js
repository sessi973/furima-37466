function tax (){
  const itemPrice  = document.getElementById("item-price");
  itemPrice.addEventListener("input", () => {
    const inputValue = itemPrice.value;
    console.log(inputValue);

    const addTaxValue= document.getElementById("add-tax-price");
    const addTax = Math.floor(inputValue * 0.1)
    addTaxValue.innerHTML = addTax;
     console.log(addTaxValue);

    const profit = document.getElementById("profit")
    profit.innerHTML = (Math.floor(inputValue - addTax));
     console.log(profit);
  })
}

window.addEventListener('load', tax);
