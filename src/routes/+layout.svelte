<script>
    import Header from './Header.svelte';
	import Carousel from './Carousel.svelte';
    import Footer from './Footer.svelte';
	import './styles.css';
</script>

<div class="app">
	<Header />

    <Carousel />

	<main>
		<slot />
	</main>

	<Footer />
</div>
