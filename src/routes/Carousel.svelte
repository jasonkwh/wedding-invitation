<script>
	// @ts-ignore
	import Carousel from "svelte-flickity";

    const imageModules = import.meta.glob('$lib/images/*.jpg', {eager: true});

    let output = "";
    for (const imageUrl in imageModules) {
        output += carouselOutput(imageModules[imageUrl].default);
    }

	const options = {
		wrapAround: true,
        autoPlay: 1500,
	};

    /**
     * @param {string} imageUrl
     */
    function carouselOutput(imageUrl) {
        return '<div class="carousel-image"><img src="' + imageUrl + '" alt=""></div>';
    }
</script>

<Carousel {options}>
	{@html output}
</Carousel>
