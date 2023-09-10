<script>
    import { page } from '$app/stores';

    let guestOutput = '';
    const url = $page.url;
    const firstName = url.searchParams.get('firstName');
    const lastName = url.searchParams.get('lastName');
    const title = Number(url.searchParams.get('title'));
   
    if ((firstName != null) && (lastName != null)) {
        guestOutput = lastName + ' ' + firstName;

        switch(title) {
        case 1:
            guestOutput = guestOutput + ' 女士 ';
            break;
        default:
            guestOutput = guestOutput + ' 先生 ';
        } 
    }
</script>

<svelte:head>
	<title>Wedding Invitation</title>
	<meta name="description" content="Jason & Sherry" />
</svelte:head>

<section>
    <p></p>
    <p>我们将于</p>
    <p>2023年11月5日/农历九月廿二日 周日</p>
    <p>中午 12:00</p>
    <p>举行婚礼仪式</p>
    <p>
    <span class="brideAndGroom">
        <span class="brideAndGroomTitle">新郎:</span>
        <span class="brideAndGroomName">黄翰翔</span>
    </span>
    <span class="brideAndGroom">
        <span class="brideAndGroomTitle">新娘:</span>
        <span class="brideAndGroomName">董升</span>
    </span>
    </p>
    <p>{guestOutput}敬邀光临</p>
    <p>一起见证我们的幸福时刻</p>
    <p>酒店/Hotel</p>
    <p>地址/Address</p>
</section>
