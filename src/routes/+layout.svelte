<script>
    import Header from './Header.svelte';
	import Content1 from './Content1.svelte';
	import Content2 from './Content2.svelte';
	import Carousel from './Carousel.svelte';
    import Footer from './Footer.svelte';
	import './styles.css';
</script>

<div class="background"></div>

<div class="app">
	<Header />

	<Content1 />

    <Carousel />

	<Content2 />

	<Footer />
</div>
