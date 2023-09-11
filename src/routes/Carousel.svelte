<script>
	// @ts-ignore
	import Carousel from "svelte-flickity";

    const imageModules = import.meta.glob('$lib/images/*.jpg', {eager: true});

    let imageArr = [];
    let index = 0;
    for (const imageUrl in imageModules) {
        imageArr[index] = imageModules[imageUrl].default;
        index++;
    }

    // shuffle the array
    shuffleArray(imageArr)

    // output
    let output = "";
    imageArr.forEach((imageUrl) => {
        output += carouselOutput(imageUrl);
    });

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

    /**
     * @param {any[]} array
     */
    function shuffleArray(array) {
        for (let i = array.length - 1; i > 0; i--) {
            const j = Math.floor(Math.random() * (i + 1));
            [array[i], array[j]] = [array[j], array[i]]; // Swap elements at i and j
        }
    }
</script>

<Carousel {options}>
	{@html output}
</Carousel>
