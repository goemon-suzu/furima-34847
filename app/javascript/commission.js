function commission(){

  const price = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  price.addEventListener("input",function(){
    const selling_price = price.value; 

    if (selling_price >= 0 && selling_price <= 9999999){
      let add_tax = Math.floor(selling_price * 0.1);
      let sales_profit = selling_price - add_tax;
      tax.textContent = add_tax;
      profit.textContent = sales_profit;
    } else {
       let add_tax = NaN;
       let sales_profit = NaN;
       tax.textContent = add_tax;
       profit.textContent = sales_profit;
    };
  });

}
window.addEventListener('load',commission);