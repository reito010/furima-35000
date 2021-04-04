window.addEventListener('DOMContentLoaded', () => {
  

  const priceInput = document.getElementById("item-price")
  const tax = document.getElementById("add-tax-price")
  const price = document.getElementById("profit")

  
  priceInput.addEventListener("keyup", () => {
    const inputValue = priceInput.value;
   
    let priceTax = Math.floor(inputValue * 0.1);
    let sum = Math.floor(inputValue * 0.9);
   
    tax.innerHTML =  priceTax;
    price.innerHTML = sum;
    
    console.log(inputValue);

  })

  

});


