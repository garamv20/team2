function check_all(n){
	let list = document.querySelectorAll(".list");
	for(let i = 0; i < list.length; i++){
		list[i].checked = n.checked;
	}
total_price();
}

function total_price(){
	let list = document.querySelectorAll(".list");
	let total = 0;
	let delivery = 0;
	for(let i = 0; i < list.length; i++){
		if(list[i].checked){
			total += parseInt(list[i].value);
		}
	}
	if(total > 0 && total < 50000){
		delivery = 3000;
	}
document.getElementById('items').innerText = total;
document.getElementById('delivery').innerText = delivery;
document.getElementById('total').innerText = total + delivery;
}
