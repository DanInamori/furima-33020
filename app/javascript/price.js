function changePrice() {
  const priceInput = document.getElementById("item-price")
  priceInput.addEventListener('input', () => {
    const price = priceInput.value;
    const salesCommission = document.getElementById("add-tax-price");
    salesCommission.innerHTML = Math.floor(price / 10);
    const salesProfit = document.getElementById("profit")
    salesProfit.innerHTML = price - (salesCommission.innerHTML);
  });
}
window.addEventListener('load', changePrice)