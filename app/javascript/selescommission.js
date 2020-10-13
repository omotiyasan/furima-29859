window.addEventListener("DOMContentLoaded", () => {
  const priceBox = document.getElementById('item-price')
  const taxBox = document.getElementById('add-tax-price')
  const profitBox = document.getElementById('profit')

  priceBox.addEventListener('input', () => {
    let value = priceBox.value
      if ( 300 <= value && 9999999 >= value){
        let tax = parseInt(value * 0.1)
        let profit = value - tax
        taxBox.innerHTML = tax
        profitBox.innerHTML = profit
      } else{
        taxBox.innerHTML = "-"
        profitBox.innerHTML = "-"
      }
  })
})