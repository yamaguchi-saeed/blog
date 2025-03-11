// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

// import "styles/application.css";
import { createApp } from "vue";
import BlogApp from "./components/BlogApp.vue";

document.addEventListener("DOMContentLoaded", () => {
	const blogApp = document.querySelector("#blog-app");
	if (blogApp) {
		createApp(BlogApp).mount("#blog-app");
	}
});
