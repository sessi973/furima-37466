const pay = () => {
  Payjp.setPublicKey("pk_test_9bf8c636c77829cc57ba8f62"); // PAY.JPテスト公開鍵
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_shared[number]"),
      cvc: formData.get("order_shared[cvc]"),
      exp_month: formData.get("order_shared[exp_month]"),
      exp_year: `20${formData.get("order_shared[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
   
      document.getElementById("charge-form").submit();   
    });
  });
};

window.addEventListener("load", pay);

