// Small beginner-friendly interactions. No database is used in this first version.
function showMessage(message) {
    const box = document.getElementById('toast');
    box.textContent = message;
    box.classList.add('visible');
    setTimeout(() => box.classList.remove('visible'), 3500);
}

document.addEventListener('click', function (event) {
    const button = event.target.closest('[data-toggle]');
    if (button) {
        const on = button.dataset.on || 'Selected \u2713';
        const off = button.dataset.off || button.textContent;
        const selected = button.dataset.selected === 'yes';
        button.textContent = selected ? off : on;
        button.dataset.selected = selected ? 'no' : 'yes';
        showMessage(selected ? 'Selection removed.' : 'Selection updated for this demo.');
    }
    const demo = event.target.closest('[data-demo]');
    if (demo) showMessage(demo.dataset.demo || 'Demo action only. Database not connected.');
});

document.addEventListener('submit', function (event) {
    const form = event.target;
    if (form.dataset.demoForm) {
        event.preventDefault();
        showMessage(form.dataset.demoForm + ' (Demo only: not saved to a database.)');
        form.reset();
    }
    if (form.id === 'post-form') {
        event.preventDefault();
        const text = form.querySelector('textarea').value.trim();
        if (!text) return showMessage('Write something first.');
        const card = document.createElement('article');
        card.className = 'card';
        const heading = document.createElement('h3');
        heading.textContent = 'You \u2022 Just now';
        const paragraph = document.createElement('p');
        paragraph.textContent = text;
        card.append(heading, paragraph);
        document.getElementById('feed-posts').prepend(card);
        form.reset();
        showMessage('Post added to this page (demo only).');
    }
    if (form.id === 'chat-form') {
        event.preventDefault();
        const field = form.querySelector('textarea');
        const text = field.value.trim();
        if (!text) return;
        const bubble = document.createElement('div');
        bubble.className = 'bubble me';
        bubble.textContent = text;
        document.getElementById('chat-messages').appendChild(bubble);
        field.value = '';
        bubble.scrollIntoView({behavior: 'smooth'});
    }
});

// Switch visible categories without creating additional pages.
document.addEventListener('click', function (event) {
    const filter = event.target.closest('[data-filter]');
    if (!filter) return;
    const group = filter.closest('[data-filter-group]');
    if (!group) return;
    group.querySelectorAll('[data-filter]').forEach(x => x.classList.remove('active'));
    filter.classList.add('active');
    const choice = filter.dataset.filter;
    const target = group.dataset.filterGroup;
    document.querySelectorAll('[data-category-group="' + target + '"]').forEach(item => {
        item.hidden = choice !== 'all' && item.dataset.category !== choice;
    });
});
