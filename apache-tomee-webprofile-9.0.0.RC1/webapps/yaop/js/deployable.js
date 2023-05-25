import { menu_state } from "./index.js";

// function push_state(inverse_function) {
// 	if (!menu_state.includes(inverse_function)) {
// 		menu_state.push(inverse_function)
// 		console.log(menu_state)
// 	}
// }

// function pop_state() {
// 	menu_state.pop()
// 	console.log(menu_state)
// }

// function triggrer_pop() {
// 	const fn_close = menu_state[menu_state.length - 1]
// 	if (fn_close != undefined) {
// 		fn_close()
// 	}
// 	// console.log(menu_state)
// }

// function opennav() {
// 	parent.document.getElementById("menu_side").style.visibility = "visible";
// 	push_state(closenav)
// }

// function closenav() {
// 	parent.document.getElementById("menu_side").style.visibility = "hidden";
// 	closelang()
// 	closelogin()
// 	pop_state()
// }


// function openlang() {
// 	parent.document.getElementById("lang_select").style.visibility = "visible";
// 	if(menu_state.length > 1 && menu_state[menu_state.length - 1] != closelang)
// 		triggrer_pop()
// 	push_state(closelang)
// }

// function closelang() {
// 	parent.document.getElementById("lang_select").style.visibility = "hidden";
// 	pop_state()
// }

// function openlogin() {
// 	parent.document.getElementById("login").style.visibility = "visible";
// 	if(menu_state.length > 1 && menu_state[menu_state.length - 1] != closelogin)
// 		triggrer_pop()
// 	push_state(closelogin)
// }

// function closelogin() {
// 	parent.document.getElementById("login").style.visibility = "hidden";
// 	pop_state()
// }

// document.addEventListener('keydown', (event) => {
// 	// var name = event.key;
// 	// var code = event.code;
// 	if(event.key == 'Escape')
// 		triggrer_pop()
// },
// 	false);

