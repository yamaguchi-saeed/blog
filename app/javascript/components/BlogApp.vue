// app/javascript/components/BlogApp.vue
<template>
	<div class="blog-container">
		<div class="filters">
			<div class="search-container">
				<input
					type="text"
					v-model="searchTerm"
					placeholder="記事を検索..."
					class="search-input" />
			</div>

			<div class="category-filters">
				<button
					@click="selectedCategory = null"
					:class="{ active: selectedCategory === null }"
					class="filter-btn">
					すべて
				</button>
				<button
					v-for="category in categories"
					:key="category.id"
					@click="selectedCategory = category.id"
					:class="{ active: selectedCategory === category.id }"
					class="filter-btn">
					{{ category.name }}
				</button>
			</div>
		</div>

		<div class="articles-list">
			<div
				v-if="filteredArticles.length === 0"
				class="no-results">
				該当する記事はありません。
			</div>

			<div
				v-for="article in filteredArticles"
				:key="article.id"
				class="article-card">
				<h2 class="article-title">{{ article.title }}</h2>
				<div class="article-meta">
					<span>投稿者: {{ article.user.email }}</span>
					<span v-if="article.category"
						>カテゴリ: {{ article.category.name }}</span
					>
					<span>{{ formatDate(article.created_at) }}</span>
				</div>
				<div
					class="article-tags"
					v-if="article.tags.length > 0">
					<span
						v-for="tag in article.tags"
						:key="tag.id"
						class="tag">
						{{ tag.name }}
					</span>
				</div>
				<p class="article-excerpt">{{ truncate(article.content) }}</p>
				<a
					:href="`/articles/${article.id}`"
					class="read-more"
					>続きを読む</a
				>
			</div>
		</div>
	</div>
</template>

<script>
export default {
	data() {
		return {
			articles: [],
			categories: [],
			searchTerm: "",
			selectedCategory: null,
		};
	},
	computed: {
		filteredArticles() {
			return this.articles.filter((article) => {
				// Filter by search term
				const matchesSearch =
					this.searchTerm === "" ||
					article.title
						.toLowerCase()
						.includes(this.searchTerm.toLowerCase()) ||
					article.content
						.toLowerCase()
						.includes(this.searchTerm.toLowerCase());

				// Filter by category
				const matchesCategory =
					this.selectedCategory === null ||
					article.category_id === this.selectedCategory;

				return matchesSearch && matchesCategory;
			});
		},
	},
	methods: {
		truncate(text) {
			return text.length > 150 ? text.substring(0, 150) + "..." : text;
		},
		formatDate(dateString) {
			const date = new Date(dateString);
			return (
				date.getFullYear() +
				"年" +
				(date.getMonth() + 1) +
				"月" +
				date.getDate() +
				"日"
			);
		},
		fetchArticles() {
			fetch("/articles.json", {
				headers: {
					Accept: "application/json",
					"Content-Type": "application/json; charset=utf-8",
				},
			})
				.then((response) => response.json())
				.then((data) => {
					this.articles = data;
				});
		},
		fetchCategories() {
			fetch("/categories.json", {
				headers: {
					Accept: "application/json",
					"Content-Type": "application/json; charset=utf-8",
				},
			})
				.then((response) => response.json())
				.then((data) => {
					this.categories = data;
				});
		},
	},
	mounted() {
		this.fetchArticles();
		this.fetchCategories();
	},
};
</script>
