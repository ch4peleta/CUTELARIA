document.addEventListener('DOMContentLoaded', () => {

    // Dynamic Date for Top Banner
    const dateElement = document.getElementById('dynamic-date');
    const today = new Date();
    const formattedDate = today.toLocaleDateString('pt-BR');
    if (dateElement) {
        dateElement.textContent = formattedDate;
    }

    // Countdown Timer
    const countdownElement = document.getElementById('countdown');
    const targetDate = new Date('2025-11-12T23:59:59').getTime(); // Fixed date as requested

    function updateCountdown() {
        const now = new Date().getTime();
        let distance = targetDate - now;

        // If passed, set to end of today
        const endOfDay = new Date();
        endOfDay.setHours(23, 59, 59, 999);
        distance = endOfDay.getTime() - now;

        const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        const seconds = Math.floor((distance % (1000 * 60)) / 1000);

        if (countdownElement) {
            countdownElement.innerHTML = `
                ${hours.toString().padStart(2, '0')}h : 
                ${minutes.toString().padStart(2, '0')}m : 
                ${seconds.toString().padStart(2, '0')}s
            `;
        }
    }

    setInterval(updateCountdown, 1000);
    updateCountdown();

    // FAQ Accordion
    const accordionHeaders = document.querySelectorAll('.accordion-header');

    accordionHeaders.forEach(header => {
        header.addEventListener('click', () => {
            const item = header.parentElement;

            // Toggle current item
            item.classList.toggle('active');

            const content = item.querySelector('.accordion-content');
            if (item.classList.contains('active')) {
                content.style.maxHeight = content.scrollHeight + "px";
            } else {
                content.style.maxHeight = null;
            }
        });
    });

    // Smooth Scroll for Anchor Links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const targetId = this.getAttribute('href');
            if (targetId === '#') return;
            const targetElement = document.querySelector(targetId);
            if (targetElement) {
                targetElement.scrollIntoView({
                    behavior: 'smooth'
                });
            }
        });
    });

    // Scroll Reveal Animation
    const revealElements = document.querySelectorAll('.reveal');

    const revealObserver = new IntersectionObserver((entries, observer) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('active');
            } else {
                // Remove active class to re-trigger animation when scrolling up/down
                entry.target.classList.remove('active');
            }
        });
    }, {
        root: null,
        threshold: 0, // Trigger as soon as any part is visible
        rootMargin: "0px 0px -10px 0px" // Slight offset
    });

    revealElements.forEach(element => {
        revealObserver.observe(element);
    });

    // Specifically ensure buttons are observed if they have the reveal class
    const revealButtons = document.querySelectorAll('a.cta-button.reveal');
    revealButtons.forEach(btn => {
        revealObserver.observe(btn);
    });

    // Sparkles Animation
    const hero = document.querySelector('.hero');
    const faqSection = document.querySelector('.faq-bg-glow');

    function createSparkle(container) {
        if (!container) return;

        const sparkle = document.createElement('div');
        sparkle.classList.add('sparkle');

        // Random position within container
        const x = Math.random() * 100;
        const y = Math.random() * 100;

        sparkle.style.left = x + '%';
        sparkle.style.top = y + '%';

        // Random size variation
        const scale = 0.5 + Math.random();
        sparkle.style.transform = `scale(${scale})`;

        container.appendChild(sparkle);

        // Remove after animation
        setTimeout(() => {
            sparkle.remove();
        }, 2000);
    }

    if (hero) {
        // Create sparkles periodically for hero
        setInterval(() => createSparkle(hero), 200);
    }

    if (faqSection) {
        // Create sparkles periodically for FAQ
        setInterval(() => createSparkle(faqSection), 300);
    }

    // 3D Book Interaction
    const bookContainers = document.querySelectorAll('.bonus-book-container');

    bookContainers.forEach(container => {
        const book = container.querySelector('.book');
        let isDragging = false;
        let startX, startY;
        let currentRotateY = -30;
        let currentRotateX = 0;

        // Mouse Events
        container.addEventListener('mousedown', (e) => {
            isDragging = true;
            startX = e.clientX;
            startY = e.clientY;
            container.style.cursor = 'grabbing';
        });

        window.addEventListener('mousemove', (e) => {
            if (!isDragging) return;
            const deltaX = e.clientX - startX;
            const deltaY = e.clientY - startY;

            currentRotateY += deltaX * 0.5;
            currentRotateX -= deltaY * 0.5;

            book.style.transform = `rotateY(${currentRotateY}deg) rotateX(${currentRotateX}deg)`;

            startX = e.clientX;
            startY = e.clientY;
        });

        window.addEventListener('mouseup', () => {
            if (isDragging) {
                isDragging = false;
                container.style.cursor = 'grab';
            }
        });

        // Touch Events
        container.addEventListener('touchstart', (e) => {
            isDragging = true;
            startX = e.touches[0].clientX;
            startY = e.touches[0].clientY;
        });

        container.addEventListener('touchmove', (e) => {
            if (!isDragging) return;
            e.preventDefault(); // Prevent scrolling
            const deltaX = e.touches[0].clientX - startX;
            const deltaY = e.touches[0].clientY - startY;

            currentRotateY += deltaX * 0.5;
            currentRotateX -= deltaY * 0.5;

            book.style.transform = `rotateY(${currentRotateY}deg) rotateX(${currentRotateX}deg)`;

            startX = e.touches[0].clientX;
            startY = e.touches[0].clientY;
        });

        container.addEventListener('touchend', () => {
            isDragging = false;
        });

        // Hover effect for non-drag interaction (subtle movement)
        container.addEventListener('mousemove', (e) => {
            if (isDragging) return;
            const rect = container.getBoundingClientRect();
            const x = e.clientX - rect.left;
            const y = e.clientY - rect.top;
            const centerX = rect.width / 2;
            const centerY = rect.height / 2;

            // Only slight tilt on hover, main rotation is drag
            // const tiltY = ((x - centerX) / centerX) * 10;
            // const tiltX = -((y - centerY) / centerY) * 10;
        });
    });

    // Initialize Lucide Icons
    if (typeof lucide !== 'undefined') {
        lucide.createIcons();
    }

});
