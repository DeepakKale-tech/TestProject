(function () {

    const msg = localStorage.getItem("flashMsg");
    if (!msg) return;

    const popup = document.createElement("div");
    popup.className = "flash-popup";
    popup.innerText = msg;

    document.body.appendChild(popup);

    setTimeout(() => popup.classList.add("show"), 50);

    setTimeout(() => {
        popup.classList.remove("show");
        setTimeout(() => popup.remove(), 400);
    }, 2500);

    localStorage.removeItem("flashMsg");

})();
